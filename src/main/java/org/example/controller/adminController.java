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
    }

    @RequestMapping("/modifyInfo")
    public String modifyInfo() {
        return "modifyInfo";
    }

    @RequestMapping("/myPage")
    public String myPage() {
        return "myPage";
    }

//    @RequestMapping("/")
//    public String home(Model m,HttpServletRequest request) throws Exception {
//        HttpSession session = request.getSession();
//        // 세션을 가져와서 하다가 논리적에러
//        if(session.getAttribute("id")==null){
//            return "index";
//        }
//
//        adminCHeck((String) session.getAttribute("id"));
//        m.addAttribute("loginAdminTrue1",true);
//
//        return "index";
//    }
//    private boolean adminCHeck(String id) throws Exception {
//        String tp="2";
//        CustDto dto = custService.loginCust(id);
//        return dto.getCustTp().equals(tp);
//    }
}
