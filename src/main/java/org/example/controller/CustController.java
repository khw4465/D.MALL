package org.example.controller;

import org.example.domain.CustDto;
import org.example.service.CustService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
