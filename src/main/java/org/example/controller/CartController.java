package org.example.controller;

import org.example.domain.CartDto;
import org.example.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

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

            List<CartDto> list = cartService.getCartList(custId);// 로그인한 아이디를 장바구니아이디로 변환하는 메서드에 주입
            m.addAttribute("list", list);   // list를 모델에 담는다.

            System.out.println("장바구니 내용 = " + cartService.getCartList((String)session.getAttribute("id")));
        } catch (Exception e) {
            e.printStackTrace();
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

//    @DeleteMapping("/list?prodCd="+cartService.getProd)
//    @ResponseBody
//    public String removeCart(@RequestBody Prod prod, Model m, HttpServletRequest request) {
//        try {
//            HttpSession session = request.getSession();
//            String custId = (String)session.getAttribute("id");
//
//            String cartId = cartService.getCartId(custId);
//
//            System.out.println("prod = " + prod);
//
//            prod.setAge(prod.getAge() + 10);
//            Map<String, String> map = new HashMap<>();
//            map.put(cartId, "a");
//
//            int i = cartService.remove(map);
//        } catch (Exception e) {
//            return "error";
//        }
//        return "cart";
//    }

}