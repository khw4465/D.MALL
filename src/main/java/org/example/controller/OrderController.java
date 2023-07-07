package org.example.controller;

import org.example.domain.CartDto;
import org.example.domain.CustDto;
import org.example.domain.DlvAddrDto;
import org.example.domain.MyOrderList;
import org.example.service.CartService;
import org.example.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    OrderService orderService;
    @Autowired
    CartService cartService;
    @GetMapping("/order")
    public String order(MyOrderList ol,  Model m, HttpServletRequest request) {
        if(!loginCheck(request))
            return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동
        if(!isValid(ol))
            return "error";


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
        } catch (Exception e) {
            return "error";
        }

        return "order";
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
