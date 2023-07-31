package org.example.controller;

import org.example.domain.DlvAddrDto;
import org.example.service.DlvAddrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/dlvAddr")
public class DlvController {
    @Autowired
    DlvAddrService dlvAddrService;

    @GetMapping("/list")
    public String dlvList(Model m, HttpServletRequest request) {
        if(!loginCheck(request))
            return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동

        try {
            HttpSession session = request.getSession();
            String custId = (String)session.getAttribute("id");     // 세션으로 회원아이디 가져오기

            List<DlvAddrDto> dlvAddrDto = dlvAddrService.getDlvAddr(custId);    // 회원의 배송지 리스트 가져오기
            m.addAttribute("dlvAddr", dlvAddrDto);

            return "dlvAddr";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("id") != null;
    }
}
