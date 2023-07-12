package org.example.controller;

import org.example.domain.CartDto;
import org.example.domain.ProdDto;
import org.example.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    CartService cartService;

    @GetMapping("/list")
    public String getCart(Model m, HttpServletRequest request) {
        int totalPrice = 0;    // 최종상품금액
        int totalDcPrice = 0;   // 최종할인금액
        int delPrice;   // 배송비
        try {
            HttpSession session = request.getSession();     // 로그인 한 아이디 가져오기
//            System.out.println("아이디는 = "+session.getAttribute("id"));
            String custId = (String)session.getAttribute("id");

            List<CartDto> list = cartService.getCartList(custId);// 로그인한 아이디에 담긴 장바구니 목록을 리스트로 담는다
            m.addAttribute("list", list);   // list를 모델에 담는다.

            for (CartDto cart : list) {     // 리스트 각각의 가격을 더한다.
                totalPrice += cart.getTotSetlPrice() * cart.getProdQty();
                totalDcPrice += cart.getExpctDcPrc();
            }
            delPrice = totalPrice >= 20000 ? 0 : 3000;  // 최종상품금액이 20000원 이상이면 배송비 무료   //db에서 가져오기

            m.addAttribute("totalPrice", totalPrice);
            m.addAttribute("totalDcPrice", totalDcPrice);
            m.addAttribute("delPrice", delPrice);

            return"cart"; // 로그인을 한 상태이면, 장바구니 화면으로 이동
//        System.out.println("장바구니 내용 = " + cartService.getCartList((String)session.getAttribute("id")));
        } catch (Exception e) {
            return"error";
        }

    }

//    @PostMapping("/list")
//    public String addCart() {
//        return "";
//    }

    @PatchMapping("/modify")
    @ResponseBody
    @Transactional
    public ResponseEntity<CartDto> minusCart(@RequestBody CartDto dto, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            String custId = (String)session.getAttribute("id");

            cartService.modifyQty(dto.getProdQty(), custId, dto.getProdCd());

            return new ResponseEntity<>(dto, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    @DeleteMapping("/remove")
    @ResponseBody
    @Transactional
    public ResponseEntity<CartDto> removeCart(@RequestBody CartDto dto, HttpServletRequest request) {

        try {
            HttpSession session = request.getSession();
            String custId = (String)session.getAttribute("id"); // id 받아오기

            cartService.remove(custId, dto.getProdCd());
            return new ResponseEntity<>(dto, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }
// ResponseEntity
}