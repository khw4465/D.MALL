package org.example.controller;

import org.example.domain.OrderDto;
import org.example.service.CartService;
import org.example.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    final OrderService orderService;
    final CartService cartService;

    public OrderController(OrderService orderService, CartService cartService) {
        this.orderService = orderService;
        this.cartService = cartService;
    }

    @GetMapping("/list")
    public String order(Model m, HttpServletRequest request){
        if(!loginCheck(request))
            return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동

        try {
            HttpSession session = request.getSession();     // 로그인 한 아이디 가져오기
            String custId = (String)session.getAttribute("id");

            List<OrderDto> list = orderService.getOrdMonth(custId,3);
            m.addAttribute("list", list);

        } catch (Exception e) {
            return "error";
        }
        return "order";
    }
    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("id")!=null;
    }
}
