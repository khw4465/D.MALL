package org.example.controller;

import org.example.domain.CartDto;
import org.example.domain.OrderDto;
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
        try {
            HttpSession session = request.getSession();           // 로그인 한 아이디 가져오기
            String custId = (String)session.getAttribute("id");

            List<CartDto> list = cartService.getCartList(custId); // 로그인한 아이디에 담긴 장바구니 목록을 리스트로 담는다
            m.addAttribute("list", list);            // list를 모델에 담는다.

            OrderDto orddto = cartService.getOrdHist(custId);    // 장바구니 내용을 하나로 합쳐서 주문에 넣기 위해 OrderDto 형식으로 요약해놓은것
            m.addAttribute("ord",orddto);           // orddto를 모델에 담는다.

            return"cart"; // 로그인을 한 상태이면, 장바구니 화면으로 이동
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

//            cartService.modifyQty(dto.getProdQty(), dto.getTotProdPrice(), custId, dto.getProdCd());

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

//            cartService.remove(custId, dto.getProdCd());
            return new ResponseEntity<>(dto, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }
// ResponseEntity
}