package org.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExceptionController {
    @ExceptionHandler(Exception.class)
    public String catcher(Exception ex, Model m){
        System.out.println("catcher() int exception-controller");
        System.out.println("m=" + m);
        m.addAttribute("ex",ex);
        return "error";
    }
    @ExceptionHandler(IllegalArgumentException.class)
    public String catcher1(IllegalArgumentException ex1, Model m){
        m.addAttribute("ex1",ex1);
        return "error";
    }

    @RequestMapping("/ex")
    public String main(Model m) throws Exception {
        m.addAttribute("msg","message from ExceptionController.main()");
        throw new Exception("예외가 발생했습니다");
    }
    @RequestMapping("/test1")
    public String test1() throws Exception{
        return "test1";
    }
}
