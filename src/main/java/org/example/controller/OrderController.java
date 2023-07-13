package org.example.controller;

import org.example.domain.*;
import org.example.service.CartService;
import org.example.service.OrderListService;
import org.example.service.OrderService;
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
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    OrderService orderService;
    OrderListService orderListService;
    CartService cartService;

    public OrderController(OrderService orderService, OrderListService orderListService, CartService cartService) {
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
            m.addAttribute("custInfo", custInfo);   //  회원정보를 가져와 모델에 넣어줌

            List<DlvAddrDto> dlvList = orderService.getDlvAddr(custId);
            System.out.println(dlvList.get(0));
            m.addAttribute("dlvList", dlvList.get(0));  // 배송지 정보를 가져와 모델에 넣어줌 (배송지가 여러개라 일단 첫번째것만)

            List<CartDto> list = cartService.getCartList(custId);
            m.addAttribute("list", list);
//            System.out.println("ol.prodName = "+ol.getProdName());
//            System.out.println("ol.prodQty = "+ol.getProdQty());
//            System.out.println("ol.prodTotSetlPrice = "+ol.getProdTotPrice());
//            System.out.println(ol);

            return "order";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping("/kakao")
    @ResponseBody
    public String kakaopay() {
        try {
            URL url = new URL("https://kapi.kakao.com/v1/payment/ready");       // 결제 주소
            HttpURLConnection conn = (HttpURLConnection)  url.openConnection();      // 클라이언트와 서버를 연결해주는 역할 (형변환 필요)
            conn.setRequestMethod("POST");                                           // 전송 방식
            conn.setRequestProperty("Authorization", "KakaoAK 90be58aa2287576f2ebe7b9018a82b18");       // 인증 방식 , 서비스 앱 어드민키로 인증요청
            conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8"); // 요청 데이터 타입
            conn.setDoOutput(true);                                                  // 연결을 통해 서버에 전달해 줄 데이터가 있는지?  default = false
            String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=닭가슴살&quantity=1&total_amount=2200&tax_free_amount=0&approval_url=http://localhost:8080/order/list&cancel_url=http://localhost:8080/order/order&fail_url=http://localhost:8080/order/order"; // 요청 매개변수를 적어줌
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
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "(\"result\" : \"NO\")";
    }

    @GetMapping("/list")
    public String orderList(Model m, HttpServletRequest request){
        if(!loginCheck(request))
            return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동

        try {
            HttpSession session = request.getSession();     // 로그인 한 아이디 가져오기
            String custId = (String)session.getAttribute("id");

            List<OrderDto> list = orderListService.getOrdMonth(custId,3);
            m.addAttribute("list", list);

            return "orderList";
        } catch (Exception e) {
            return "error";
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
