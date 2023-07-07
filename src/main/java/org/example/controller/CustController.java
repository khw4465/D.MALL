package org.example.controller;

import org.example.domain.CustDto;
import org.example.service.CustService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CustController {
    @Autowired
    CustService custService;

    @RequestMapping("/custselect")
    public String selectAll(CustDto custDto, Model m) throws Exception {
        List<CustDto> list = custService.getCustList();
        System.out.println("list = " + list);
        m.addAttribute("list",list);
        m.addAttribute("test1","test1");
        return "admin";
    }

//    @GetMapping("custMyPage")
//    public String custMyPageGet(){
//        return "myPage";
//    }

    @GetMapping("custMyPage")
    public String custMyPage(CustDto custDto, Model m, HttpServletRequest request){
        //세션에 아이디가 없으면 로그인창으로 이동 //나중에는 db에 아이디가 있는지까지 체크해야함.
        HttpSession session = request.getSession();// 세션을 받아온다.
        if(session.getAttribute("id") == null){
            return "login";
        }
        //System.out.println("session.getAttribute(\"id\") = " + session.getAttribute("id"));
        //System.out.println("session.getAttribute(\"custId\") = " + session.getAttribute("custId"));
        return "myPage";
        //return "error";
    }

    @RequestMapping("custModify")
    public String custModify(CustDto custDto, Model m, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession(); // 세션을 받아온다.
        if(session.getAttribute("id") == null){
            return "login";
        }

         CustDto dto = custService.modifyselect((String) session.getAttribute("id"));
        m.addAttribute("custId",session.getAttribute("id"));
        dto.setCustId((String) session.getAttribute("id"));
        m.addAttribute("modydto",dto);

        return "modifyInfo";
        //return "error";
    }
    @RequestMapping("deleteCust")
    public String deleteCust(CustDto dto,Model m , HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession(); // 세션을 받아온다.
        custService.withdrawal((String) session.getAttribute("id"));
        session.invalidate();
        return "redirect:/";
    }



}
