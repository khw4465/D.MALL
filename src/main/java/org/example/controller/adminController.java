package org.example.controller;

import org.example.domain.CustDto;
import org.example.service.CustService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class adminController {
    @Autowired
    CustService custService;

    @RequestMapping("/admin")
    public String admin() {
        return "admin";
        //관리자페이지를 불러온다.
    }

    @RequestMapping("/modifyInfo")
    public String modifyInfo() {
        return "modifyInfo";
        //정보수정 페이지를 불러온다.
    }

    @RequestMapping("/myPage")
    public String myPage() {
        return "myPage";
        //마이페이지를 불러온다.
    }

    @RequestMapping("/prodDetails")
    public String prodDetails() {
        return "prodDetailtest";
    }

}
