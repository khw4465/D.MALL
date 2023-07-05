package org.example.controller;

import jdk.jfr.StackTrace;
import org.example.classForAjax.Prod;
import org.example.domain.CartDto;
import org.example.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    CartService cartService;

    @GetMapping("/list")
    public String getCart(Model m, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();     // 로그인 한 아이디 가져오기
//            System.out.println("아이디는 = "+session.getAttribute("id"));
            String custId = (String)session.getAttribute("id");

            List<CartDto> list = cartService.getCartList(custId);// 로그인한 아이디에 담긴 장바구니 목록을 리스트로 담는다
            m.addAttribute("list", list);   // list를 모델에 담는다.


            int totalPrice = 0;    // 최종상품금액
            int totalDcPrice = 0;   // 최종할인금액
            int delPrice = 0;   // 배송비

            for (CartDto cart : list) {     // 리스트 각각의 가격을 더한다.
                totalPrice += cart.getTotSetlPrice();
                totalDcPrice += cart.getExpctDcPrc();
            }
            delPrice = totalPrice >= 20000 ? 0 : 3000;  // 최종상품금액이 20000원 이상이면 배송비 무료

            m.addAttribute("totalPrice", totalPrice);
            m.addAttribute("totalDcPrice", totalDcPrice);
            m.addAttribute("delPrice", delPrice);



        System.out.println("장바구니 내용 = " + cartService.getCartList((String)session.getAttribute("id")));
        } catch (Exception e) {
            return "error";
        }

        return "cart"; // 로그인을 한 상태이면, 장바구니 화면으로 이동
    }
//    @PatchMapping("/list")
//    @ResponseBody
//    public String updateCart(@RequestBody ProdDto prod, Model m, HttpServletRequest request) {
//        HttpSession session = request.getSession();
//        String custId = (String)session.getAttribute("id");
//
//        cartService.increaseQty(custId, prodCd);
//
//        return "cart";
//    }

    @DeleteMapping("/delete")
    @ResponseBody
    public Prod removeCart(@RequestBody Prod p, HttpServletRequest request) {

        try {
            HttpSession session = request.getSession();
            String custId = (String)session.getAttribute("id"); // id 받아오기

            System.out.println("p = " + p);

            cartService.remove(custId, p.getProdCd());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return p;
    }

}