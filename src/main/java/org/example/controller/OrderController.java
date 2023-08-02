package org.example.controller;

import org.example.domain.*;
import org.example.service.CartService;
import org.example.service.OrderListService;
import org.example.service.DlvAddrService;
import org.example.service.PointService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.example.domain.OrderListPageHandler;


@Controller
@RequestMapping("/order")
public class OrderController {
    DlvAddrService dlvAddrService;
    OrderListService orderListService;
    CartService cartService;
    PointService pointService;

    public OrderController(DlvAddrService dlvAddrService, OrderListService orderListService, CartService cartService,
                           PointService pointService) {
        this.dlvAddrService = dlvAddrService;
        this.orderListService = orderListService;
        this.cartService = cartService;
        this.pointService = pointService;
    }
    //0729 mhs 생성자 추가

    @GetMapping("/order")
    public String order(Model m, HttpServletRequest request) {

        if(!loginCheck(request))
            return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동
//        if(!isValid(ol))
//            return "error";


        try {
            HttpSession session = request.getSession();
            String custId = (String)session.getAttribute("id");     // 세션으로 회원아이디 가져오기

            CustDto custInfo = dlvAddrService.getCust(custId);
            m.addAttribute("custInfo", custInfo);             //  회원정보를 가져와 모델에 넣어줌

            List<DlvAddrDto> dlvList = dlvAddrService.getDlvAddr(custId);
            m.addAttribute("dlvList", dlvList);               // 배송지 정보를 가져와 모델에 넣어줌

            List<CartDto> cartList = cartService.getCartList(custId);
            m.addAttribute("cartList", cartList);             // 장바구니에 담긴 상품의 정보를 모델에 넣어줌

            List<List<CartOptDto>> optLists = cartService.getAllOptList(custId);
            m.addAttribute("optLists", optLists);

            OrderDto priceInfo = cartService.getOrdHist(custId);
            m.addAttribute("prcInfo", priceInfo);                 // 최종금액을 합산한 것을 모델에 넣어줌

            // 0729 mhs 포인트보여주기 추가 7/29 6시 44분 또 수정
            pointDto pointList = pointService.selectPointOne(custId);
            m.addAttribute("pointResult",pointList.getPoint());



            return "order";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping("/kakao")
    @ResponseBody
    @Transactional(rollbackFor = Exception.class)
    public String kakaopay(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            String custId = (String)session.getAttribute("id");     // 세션으로 회원아이디 가져오기
            OrderDto dto = cartService.getOrdHist(custId);
            System.out.println("qty = " + dto.getTotQty());
            System.out.println("prc = " + dto.getFinPrc());

            URL url = new URL("https://kapi.kakao.com/v1/payment/ready");       // 결제 주소
            HttpURLConnection conn = (HttpURLConnection)  url.openConnection();      // 클라이언트와 서버를 연결해주는 역할 (형변환 필요)
            conn.setRequestMethod("POST");                                           // 전송 방식
            conn.setRequestProperty("Authorization", "KakaoAK 90be58aa2287576f2ebe7b9018a82b18");       // 인증 방식 , 서비스 앱 어드민키로 인증요청
            conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8"); // 요청 데이터 타입
            conn.setDoOutput(true);                                                  // 연결을 통해 서버에 전달해 줄 데이터가 있는지?  default = false
            String param = "cid=TC0ONETIME" +                                        // 요청 매개변수를 적어줌
                           "&partner_order_id=partner_order_id" +
                           "&partner_user_id=partner_user_id" +
                           "&item_name="+ URLEncoder.encode(dto.getProdName(), "UTF-8") +   // 한글이라 인코딩 필요
                           "&quantity=" + dto.getTotQty() +
                           "&total_amount=" + dto.getFinPrc() +
                           "&tax_free_amount=0" +
                           "&approval_url=http://localhost:8080/order/complete" +       // 주문승인 시 이동 주소
                           "&cancel_url=http://localhost:8080/order/cancle" +       // 주문취소 시 이동 주소
                           "&fail_url=http://localhost:8080/order/fail";           // 주문실패 시 이동 주소
            OutputStream output = conn.getOutputStream();  // 서버에 주는 애
            DataOutputStream data = new DataOutputStream(output); // 무엇을 줄지 결정
            data.writeBytes(param);     // 매개변수를 byte타입으로 변환
            data.close();               // 데이터를 주고 종료

            int result = conn.getResponseCode();    // 데이터를 보낸 후 결과

            InputStream input;      // 데이터를 받는 애
            if(result == 200){      // 200번대 => 성공적이면
                input = conn.getInputStream();  // 데이터를 받아옴

            } else{                             // 실패하면
                input = conn.getErrorStream();  // 에러를 받아옴
            }

            InputStreamReader read = new InputStreamReader(input); // 받은 데이터를 읽음
            BufferedReader bufferedReader = new BufferedReader(read); // 받은 데이터를 형변환



            return bufferedReader.readLine();   // 형변환을 한 후 찍어냄
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "(\"result\" : \"NO\")";
    }
    
    @GetMapping("/list")
    public String orderList(Model m, HttpServletRequest request,
                            @RequestParam(defaultValue = "1") Integer page,
                            @RequestParam(defaultValue = "5") Integer pageSize){
//        if(page == null) page = 1;
//        if(pageSize == null) pageSize = 5;

        try {
            if(!loginCheck(request)) {
                return "redirect:/login/login?toURL="+request.getRequestURL();      // 로그인을 안했으면 로그인 화면으로 이동
            }

            HttpSession session = request.getSession();
            String custId = (String) session.getAttribute("id");              // 로그인 한 아이디 가져오기

            Calendar calendar = Calendar.getInstance();                             // 오늘 날짜 구하기 (조회용)
            request.setAttribute("today", calendar.getTime());
            calendar.add(Calendar.MONTH, -1);                                // 한달 전 날짜
            request.setAttribute("oneMonthAgo", calendar.getTime());

            List<OrderDto> ordList = orderListService.getOrdMonth(custId,1);
            m.addAttribute("list", ordList);


//           // orderList 페이지 핸들러 코드 추가
            int totalCnt = orderListService.getOrdMonth(custId,1).size();
            m.addAttribute("totalCnt", totalCnt);


            OrderListPageHandler orderListPageHandler = new OrderListPageHandler(totalCnt, page, pageSize);

            Map map = new HashMap();
            map.put("custId", custId);
            map.put("offset", (page - 1) * pageSize);
            map.put("pageSize", pageSize);
            List<OrderDto> ordList1 = orderListService.getPage(map); // test
            m.addAttribute("list1",ordList1);

            List<OrderDto> list = orderListService.getOrdMonth(custId,1);

            System.out.println("list = " + list);
            System.out.println("page = " + page);
            System.out.println("pageSize = " + pageSize);
            System.out.println("totalCnt = " + totalCnt);


            m.addAttribute("handlelist", list);
            m.addAttribute("pagehandler", orderListPageHandler);

            return "orderList";
        } catch (Exception e) {
            return "error";
        }

    }

    @GetMapping("/cnclRtn")
    public String cnclRtn(HttpServletRequest request) {
        if(!loginCheck(request))
            return "redirect:/login/login?toURL="+request.getRequestURL();      // 로그인을 안했으면 로그인 화면으로 이동

        HttpSession session = request.getSession();                             // 로그인 한 아이디 가져오기
        String custId = (String)session.getAttribute("id");

        Calendar calendar = Calendar.getInstance();                             // 오늘 날짜 구하기 (조회용)
        request.setAttribute("today", calendar.getTime());
        calendar.add(Calendar.MONTH, -1);                                // 한달 전 날짜
        request.setAttribute("oneMonthAgo", calendar.getTime());

        return "cnclRtn";
    }

    @PostMapping("/list")
    @ResponseBody
    @Transactional(rollbackFor = Exception.class)
    public ResponseEntity<OrderDto> ordComplete(@RequestBody OrderDto orderDto, Model m, HttpSession session) {
        try {
            String ordCd = orderDto.getOrdCd();                           // ord.jsp에서 tid를 주문코드로 얻어옴
            String dlvMsg = orderDto.getDlvMsg();                         // ord.jsp에서 dlvMsg를 배송메시지로 얻어옴
            String custId = (String)session.getAttribute("id");     // 세션으로 회원아이디 가져오기
            int totDcPrc = orderDto.getTotDcPrc();

//            orderService.getOneAddr(custId, 1);                         // 회원의 배송지목록 1번의 dto 가져오기

            orderListService.addOrder(ordCd,custId,totDcPrc,1,dlvMsg);    // 주문내역 추가

            OrderDto ordDto1 = orderListService.getLastOrd(custId);       // 세션에 최근 주문내역 저장
            session.setAttribute("lastOrder", ordDto1);

            // 구매시 포인트 적립을 위한 메서드 07.29 mhs
            OrderDto dto = cartService.getOrdHist(custId);
            pointDto pointDto = settingPointDto(custId, dto);
            pointService.insertPoint(pointDto);                           // 포인트 insert

            cartService.removeAll(custId);                                // 주문을 했으니 장바구니 목록 삭제

            return new ResponseEntity<>(HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }
    // 구매시 포인트 적립을 위한 메서드 07.29 mhs
    private pointDto settingPointDto(String custId, OrderDto dto) throws Exception { // 07.29 mhs
        pointDto pointDto = pointService.selectPointOne(custId); // id 주면 최신포인트이력 한줄 가져온다.
        pointDto newPointDto = new pointDto();
        // 최신이력 1줄을 받아와 수정해서 새로 저장 시작
        newPointDto.setPntId(pointDto.getPntId()+1); // 포인트
        newPointDto.setCustId(pointDto.getCustId()); // 회원아이디
        newPointDto.setStus("적립"); //상태
        newPointDto.setChngPnt((dto.getTotPrc()/100)); //변화포인트
        newPointDto.setPoint(pointDto.getPoint()+(dto.getTotPrc()/100)); // 최신이력 + 총금액/100 저장 나머지 절삭
        newPointDto.setDttm(LocalDateTime.now()); // 현재날짜시간 //만료기간은 저장하지않음
        newPointDto.setChgCn("구매"); //사유
        newPointDto.setRemark("구매 적립"); //비고
        newPointDto.setPntCd("0"); // 코드
        System.out.println("newPointDto = " + newPointDto);
        return newPointDto;
    }

   @GetMapping("/complete")
   @Transactional(rollbackFor = Exception.class)
   public String ordComplete(Model m, HttpSession session) {
       try {
           System.out.println("\"hi\" = " + "hi");
           OrderDto ordDto2 = (OrderDto) session.getAttribute("lastOrder");    // 세션으로 주문한 건의 내역 가져오기
           m.addAttribute("ordInfo", ordDto2);

           // 일단 여기다가 구매로인한 포인트차감 추가합니다 나중에 다른쪽으로 옮겨주세요
            //--------------------------------------------------------------------------------
           pointDto point = pointService.selectPointOne((String) session.getAttribute("id"));
           // id 주면 최신포인트이력 한줄 가져온다.
           pointDto newPointDto = new pointDto();
           // 최신이력 1줄을 받아와 수정해서 새로 저장 시작
           newPointDto.setPntId(point.getPntId()+1); // 포인트
           newPointDto.setCustId(point.getCustId()); // 회원아이디
           newPointDto.setStus("사용"); //상태
           newPointDto.setChngPnt(ordDto2.getFinPrc()/100); //변화포인트 (사용금액)
           newPointDto.setPoint(point.getPoint()-(ordDto2.getFinPrc()/100)); //사용(차감)금액
           newPointDto.setDttm(LocalDateTime.now()); // 현재날짜시간 //만료기간은 저장하지않음
           newPointDto.setChgCn("포인트사용"); //사유
           newPointDto.setRemark("구매시 포인트 사용"); //비고
           newPointDto.setPntCd("1"); // 코드   //0은 구매시적립 1은 구매시 사용
           //2는 로그인,3은 회원가입시,4는 리뷰시 포인트
           System.out.println("newPointDto = " + newPointDto);
           // 그러나 포인트가 0이거나 그 이하일때도 고려되어야한다 일단 진행
           //--------------------------------------------------------------------------------
           //성공하면 제가 메서드로 추출해서 아래로 배치하겠습니다.

           return "ordComplete";
       } catch (Exception e) {
           System.out.println("Error in ordComplete: " + e.getMessage()); // 로그 추가: 에러 메시지 출력
           return "error";
       }

   }

    @GetMapping("/cancle")
    public String ordCancle(HttpSession session) {
        String custId = (String)session.getAttribute("id");     // 세션으로 회원아이디 가져오기

        return "ordCancle";
    }

    @GetMapping("/fail")
    public String ordFail(HttpSession session) {
        String custId = (String)session.getAttribute("id");     // 세션으로 회원아이디 가져오기

        return "ordFail";
    }

    @PostMapping("/addDlvAddr")
    @ResponseBody
    public ResponseEntity<DlvAddrDto> addDlv(@RequestBody DlvAddrDto dlvAddrDto, HttpSession session) {
    try{
        String custId = (String)session.getAttribute("id");     // 세션으로 회원아이디 가져오기
        dlvAddrDto.setCustId(custId);                                 // dto에 회원아이디 값 넣어주기

        int addrNo = dlvAddrService.getDlvCnt(custId);                // dto에 배송지 고유번호 넣어주기
        dlvAddrDto.setAddrNo(addrNo + 1);                             // 고유번호 == 기존 배송지 개수 + 1

        System.out.println("dlvAddrDto = " + dlvAddrDto);
        dlvAddrService.addDlvAddr(dlvAddrDto);


        return new ResponseEntity<>(dlvAddrDto, HttpStatus.OK);
    } catch (Exception e) {
        e.printStackTrace();
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    }

    @PatchMapping("/modifyDlvAddr")
    @ResponseBody
    public ResponseEntity<DlvAddrDto> modifyDlv(@RequestBody DlvAddrDto dlvAddrDto, HttpSession session) {
        try{
            String custId = (String)session.getAttribute("id");     // 세션으로 회원아이디 가져오기

            DlvAddrDto dto = dlvAddrService.getOneAddr(custId, dlvAddrDto.getAddrNo());        // 회원의 배송지 번호로 데이터 가져오기

            System.out.println("dto = " + dto);
            return new ResponseEntity<>(dto, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("id") != null;
    }
    public boolean isValid(MyOrderList ol){         // 유효성 검사
        return isValid(ol.getProdName(), ol.getProdCd(), ol.getProdQty(), ol.getProdPrice(), ol.getProdTotPrice());
    }
    private boolean isValid(String prodName, String prodCd, int prodQty, int prodPrice, int prodTotPrice) {
        if (prodName == "" || prodCd == "" || prodQty <= 0 || prodPrice <= 0 || prodTotPrice <= 0)
            return false;

        return true;
    }
}
