package org.example.controller;

import org.example.dao.CustDao;
import org.example.domain.CustDto;
import org.example.domain.LoginHistoryDTO;
import org.example.domain.custValidator;
import org.example.service.CustLoginHistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    CustDao custDao;
    @Autowired
    CustLoginHistService custLoginHistService;

    @GetMapping("/add")
    public String add() {
        return "register";
    }

    @PostMapping("/add")
    public String addPost(HttpServletRequest request,String toURL, HttpSession session, Model model, @Valid CustDto custDto, BindingResult result, String pwd, String pwd2) throws Exception {

        LoginHistoryDTO loginHistoryDTO = new LoginHistoryDTO();
        loginHistoryDTO.setCustId(custDto.getCustId()); //아이디
        loginHistoryDTO.setDttm(LocalDateTime.now()); // 발생시간
        loginHistoryDTO.setIp(request.getRemoteAddr()); //IP 로컬일때는 0 0 0 0 임
        loginHistoryDTO.setNatn(request.getHeader("Accept-Language")); // 국가 추론
        loginHistoryDTO.setMhrLS(request.getHeader("User-Agent")); // 기기(기계) 추론
        loginHistoryDTO.setScssYn("Y");

        loginHistoryDTO.setFailCnt(0);

        try {
            if(!(pwd.equals(pwd2))){
                //String msg = "비밀번호가 다릅니다.";
                return "redirect:/register/add"+"111";
            } //회원가입시 비번과 비번확인창의 내용이 다르면 다시 돌려보냄.

            if(result.hasErrors()){
                System.out.println("Validation Error");
                System.out.println("result = " + result);
                return "register";
            }

            session.setAttribute("id", custDto.getCustId());
            custDto.setCustTp("1");
            model.addAttribute("user", custDto);

            custDao.insertUser(custDto);
            System.out.println("User successfully registered");

            toURL = toURL == null || toURL.equals("") ? "/" : toURL;
            return "redirect:" + toURL;
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            custLoginHistService.LoginHistInsert(loginHistoryDTO);
        }
    }

    @InitBinder
    public void toDate(WebDataBinder binder){
        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
        binder.registerCustomEditor(Date.class,new CustomDateEditor(df,false));
        binder.setValidator(new custValidator());

        List<Validator> validators = binder.getValidators();
        System.out.println("validators = " + validators);
    }
}