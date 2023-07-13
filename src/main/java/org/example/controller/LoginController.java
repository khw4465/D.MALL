package org.example.controller;

import org.example.dao.*;
import org.example.domain.*;
import org.example.service.CustService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    CustDao custDao;

    @Autowired
    CustService custService;

    @Autowired
    private JavaMailSender mailSender;

    @GetMapping("/findId")
    public String findidget() {
        return "findId";
    }

    //    @PostMapping("/findid")// id를찾을때
//    public String findidpost(Model m, String name, String email,HttpServletRequest request, HttpServletResponse response) throws Exception {
//        // db에서 특정 아이디랑 이메일 가진사람 찾아야함.
//       // 이름이랑 이메일 들어오면
//        //해당하는 id를 찾고 해당 아이디의
//        CustDto custDto = new CustDto();
//        custDto.setName(name);
//        custDto.setEmail(email);
//        // m.addAttribute("findidresult",custDao.findid(custDto)); // 모델에 찾은 아이디 담음
//        String resultid = custDao.findid(custDto); // 해당하는 id 찾아냈음
//
//        // 그 아이디의 이메일과 입력된 이메일을 비교해서 맞으면
//        // 이 아래부터 트라이캐치로 잡아야할듯.
//
//        if(!(email.equals(custService.loginCust(resultid).getEmail())))
//            return "redirect:login/findid"; //리다이렉트로 바꿈
//
//        // 인증번호를 이메일로 보내고
//        String subject = "인증번호를 보내드립니다.";
//        String content = "인증번호는 "+ resultid +"입니다. ";
//        String from = "hsm1020ss@naver.com";
//        String to = ""+email+"";
//        try {
//            MimeMessage mail = mailSender.createMimeMessage();
//            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
//                mailHelper.setFrom(from);
//                mailHelper.setTo(to);
//                mailHelper.setSubject(subject);
//                mailHelper.setText(content, true);
//                mailSender.send(mail);
//            } catch(Exception e) {
//                e.printStackTrace();
//            }
//        m.addAttribute("findidresult",resultid); // 모델에 찾은 아이디 담음
//        return "findidresult";
//    }
    @PostMapping("/findid")// id를찾을때
    public String findidpost(Model m, String name, String email,String mpNo) throws Exception {
        CustDto custDto = new CustDto();
        custDto.setName(name);
        custDto.setEmail(email);
        custDto.setMpNo(mpNo);
        String resultid = custService.findCustId(custDto); // 해당하는 id 찾아냈음
        // 그 아이디의 이메일과 입력된 이메일을 비교해서 맞으면
        // 원래 이름,이메일,전화 일치해야

        if (!(email.equals(custService.loginCust(resultid).getEmail())))
            return "redirect:login/findid"; //리다이렉트로 바꿈

        SecureRandom random = new SecureRandom();
        String sms = new BigInteger(70, random).toString(32);

        // 인증번호를 이메일로 보내고
        String subject = "인증번호를 보내드립니다.";
        String content = "인증번호는 " + sms + "입니다. ";
        String from = "hsm1020ss@naver.com";
        String to = "" + email + "";
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
            mailHelper.setFrom(from);
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);
            mailSender.send(mail);
        } catch (Exception e) {
            e.printStackTrace();
        }
        m.addAttribute("findidresult", resultid); // 모델에 찾은 아이디 담음
        return "findidresult";
    }

    @GetMapping("/findPwd")
    public String findPwd(String custId, String name, String email, String mpNo) {
        return "findPwd";
    }

    @PostMapping("/findPwd")
    public String findPwdReturn(String custId, String name, String email, String mpNo) throws Exception {
        CustDto custDto = new CustDto();
        custDto.setCustId(custId);
        custDto.setName(name);
        custDto.setEmail(email);
        custDto.setMpNo(mpNo);
        custDto = custService.temporaryPwd(custDto);
        SecureRandom random = new SecureRandom();
        String password = new BigInteger(50, random).toString(32);
        password = password.substring(0, 5); // 문자열에서 앞쪽 5자만 잘라냄
        password += custDto.getMpNo().substring(custDto.getMpNo().length() - 2);
        password += custDto.getEmail().substring(0, 2);
        custDto.setPwd(password);

        custService.temporaryPwdReturn(custDto);
        String subject = "비밀번호를 보내드립니다";
        //String content =  "메일 테스트 내용" + "<img src=\"img/cart.png\">";
        String content = "<img src=\"https://postfiles.pstatic.net/MjAyMzA3MDVfMjc4/MDAxNjg4NTE2ODUwNzI1.tSsVmQZHdFxSpSINcOPi1p4aV8UB-JxoYZCMjghLehQg.mFUzLkRqn9SLC6I73Wv3mmUybQE4nHWQ6SruEou5tTAg.PNG.hsm1020ss/github.png?type=w966\">";
        content += "비밀번호는 " + password + "입니다. "; //위에 패스워드 흰색떠도 괜찮음 여기서 사용함.
        String from = "hsm1020ss@naver.com";
        String to = "hsm1020s@naver.com";

        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
            mailHelper.setFrom(from);
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);
            mailSender.send(mail);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "index";
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
    public String login(Model m, String id, String pwd, String toURL, boolean rememberId,
                        HttpServletRequest request, HttpServletResponse response) throws Exception {

        // 1. id와 pwd를 확인
        if (!loginCheck(id, pwd)) {
            // 2-1   일치하지 않으면, loginForm으로 이동
            String msg = URLEncoder.encode("id 또는 pwd가 일치하지 않습니다.", "utf-8");
            return "redirect:/login/login?msg=" + msg;
        }
        // 2-2. id와 pwd가 일치하면,
        //  세션 객체를 얻어오기
        HttpSession session = request.getSession();
        //  세션 객체에 id를 저장
        session.setAttribute("id", id);

        if (rememberId) {
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
        toURL = toURL == null || toURL.equals("") ? "/" : toURL;


        // 아이디 비번이 어드민이 맞는지 확인
        if (adminCHeck(id)) { // 어드민일경우
            m.addAttribute("loginAdminTrue", true);
            return "index";
        }
        return "redirect:" + toURL;
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
            //user = custService.loginCust()
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return user != null && user.getPwd().equals(pwd);
//        return "asdf".equals(id) && "1234".equals(pwd);
    }

    private boolean adminCHeck(String id) throws Exception {
        String tp = "2";
        CustDto dto = custService.loginCust(id);
        return dto.getCustTp().equals(tp);
    }
}