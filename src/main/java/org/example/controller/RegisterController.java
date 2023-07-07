package org.example.controller;

import org.example.dao.CustDao;
import org.example.domain.CustDto;
import org.example.domain.custValidator;
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

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    CustDao custDao;

    @GetMapping("/add")
    public String add() {
        return "register";
    }

    @PostMapping("/add")
    public String addPost(String toURL, HttpSession session, Model model, @Valid CustDto custDto, BindingResult result) throws Exception {
        // custValidator custValidator = new custValidator();
        // custValidator.validate(custDto,result);

        if(result.hasErrors()){
            System.out.println("Validation Error");
            System.out.println("result = " + result);
            return "register";
        }

        session.setAttribute("id", custDto.getCustId());
        model.addAttribute("user", custDto);
        custDao.insertUser(custDto);
        System.out.println("User successfully registered");

        toURL = toURL == null || toURL.equals("") ? "/" : toURL;
        return "redirect:" + toURL;
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