package org.example.controller;

import org.example.domain.*;
import org.example.service.CartService;
import org.example.service.OrderListService;
import org.example.service.OrderService;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/order")
public class OrderController {
    OrderService orderService;
    OrderListService orderListService;
    CartService cartService;

    public OrderController( OrderService orderService, OrderListService orderListService, CartService cartService) {
        this.orderService = orderService;
        this.orderListService = orderListService;
        this.cartService = cartService;
    }

    @GetMapping("/order")
    public String order(Model m, HttpServletRequest request) {

        if(!loginCheck(request))
            return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동
//        if(!isValid(ol))
//            return "error";


        try {
            HttpSession session = request.getSession();
            String custId = (String)session.getAttribute("id");     // 세션으로 회원아이디 가져오기

            CustDto custInfo = orderService.getCust(custId);
            m.addAttribute("custInfo", custInfo);             //  회원정보를 가져와 모델에 넣어줌

            List<DlvAddrDto> dlvList = orderService.getDlvAddr(custId);
            m.addAttribute("dlvList", dlvList.get(0));        // 배송지 정보를 가져와 모델에 넣어줌 (배송지가 여러개면 일단 첫번째것만)

            List<CartDto> cartList = cartService.getCartList(custId);
            m.addAttribute("cartList", cartList);             // 장바구니에 담긴 상품의 정보를 모델에 넣어줌

            List<List<CartOptDto>> optLists = cartService.getAllOptList(custId);
            m.addAttribute("optLists", optLists);

            OrderDto priceInfo = cartService.getOrdHist(custId);
            m.addAttribute("prcInfo", priceInfo);                 // 최종금액을 합산한 것을 모델에 넣어줌

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
    public String orderList(Model m, HttpServletRequest request){
        try {
            if(!loginCheck(request)) {
                return "redirect:/login/login?toURL="+request.getRequestURL();      // 로그인을 안했으면 로그인 화면으로 이동
            }

            HttpSession session = request.getSession();
            String custId = (String) session.getAttribute("id");         // 로그인 한 아이디 가져오기

            List<OrderDto> ordList = orderListService.getOrdMonth(custId,1);
            m.addAttribute("list", ordList);

            return "orderList";
        } catch (Exception e) {
            return "error";
        }

    }

    @GetMapping("/cnclRtn")
    public String cnclRtn(HttpServletRequest request) {
        if(!loginCheck(request))
            return "redirect:/login/login?toURL="+request.getRequestURL();      // 로그인을 안했으면 로그인 화면으로 이동

            HttpSession session = request.getSession();                         // 로그인 한 아이디 가져오기
            String custId = (String)session.getAttribute("id");

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

//            orderService.getOneAddr(custId, 1);                         // 회원의 배송지목록 1번의 dto 가져오기

            orderListService.addOrder(ordCd,custId,1,dlvMsg);    // 주문내역 추가

            OrderDto ordDto1 = orderListService.getLastOrd(custId);       // 세션에 최근 주문내역 저장
            session.setAttribute("lastOrder", ordDto1);

            cartService.removeAll(custId);                                // 주문을 했으니 장바구니 목록 삭제

            return new ResponseEntity<>(HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

   @GetMapping("/complete")
   public String ordComplete(Model m, HttpSession session) {
       try {
           OrderDto ordDto2 = (OrderDto) session.getAttribute("lastOrder");    // 세션으로 주문한 건의 내역 가져오기
           m.addAttribute("ordInfo", ordDto2);

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
