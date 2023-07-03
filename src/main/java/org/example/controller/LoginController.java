package org.example.controller;

import org.example.dao.*;
import org.example.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    CustDao custDao;

    @GetMapping("/findId")
    public String findidget() {
        return "findId";
    }
    @PostMapping("/findid")
    public String findidpost(Model m, String name, String email,HttpServletRequest request, HttpServletResponse response) throws Exception {
        // db에서 특정 아이디랑 이메일 가진사람 찾아야함.
        CustDto custDto = new CustDto();
        custDto.setName(name);
        custDto.setEmail(email);
        custDao.findid(custDto);

        m.addAttribute("findidresult",custDao.findid(custDto));

        // System.out.println("userDao.findid(custDto) = " + userDao.findid(custDto));
        //name이랑 email이 동일한 custid를 반환해야함.

        return "findidresult";
    }



    @GetMapping("/findPwd")
    public String findPwd() {
        return "findPwd";
    }

    @GetMapping("/login")
    public String loginForm() {
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // 1. 세션을 종료
        session.invalidate();
        // 2. 홈으로 이동
        return "redirect:/";
    }

    @PostMapping("/login")
    public String login(String id, String pwd, String toURL, boolean rememberId,
                        HttpServletRequest request, HttpServletResponse response) throws Exception {

        // 1. id와 pwd를 확인
        if(!loginCheck(id, pwd)) {
            // 2-1   일치하지 않으면, loginForm으로 이동
            String msg = URLEncoder.encode("id 또는 pwd가 일치하지 않습니다.", "utf-8");
            return "redirect:/login/login?msg="+msg;
        }
        // 2-2. id와 pwd가 일치하면,
        //  세션 객체를 얻어오기
        HttpSession session = request.getSession();
        //  세션 객체에 id를 저장
        session.setAttribute("id", id);

        if(rememberId) {
            //     1. 쿠키를 생성
            Cookie cookie = new Cookie("id", id); // ctrl+shift+o 자동 import
//		       2. 응답에 저장
            response.addCookie(cookie);
        } else {
            // 1. 쿠키를 삭제
            Cookie cookie = new Cookie("id", id); // ctrl+shift+o 자동 import
            cookie.setMaxAge(0); // 쿠키를 삭제
//		       2. 응답에 저장
            response.addCookie(cookie);
        }
//		       3. 홈으로 이동
        toURL = toURL==null || toURL.equals("") ? "/" : toURL;


        // 아이디 비번이 어드민이 맞는지 확인
        if(adminCHeck(id, pwd)){ // 어드민일경우
            return "admin";
        }
        return "redirect:"+toURL;
    }

//    @RequestMapping("/admin")
//    public String admin() {
//        //로그인되어있는지 확인한다.
//        //어드민인지 확인한다.
//        //어드민페이지로 보낸다.
//        return "admin";
//    }

    private boolean loginCheck(String id, String pwd) {
        CustDto user = null;

        try {
            user = custDao.selectUser(id);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return user!=null && user.getPwd().equals(pwd);
//        return "asdf".equals(id) && "1234".equals(pwd);
    }
    private boolean adminCHeck(String id, String pwd){
        return "admin".equals(id) && "admin123".equals(pwd);
    }
}