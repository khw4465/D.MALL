package org.example.controller;

import org.example.domain.NotcPageHandler;
import org.example.domain.NotcSearchCondition;
import org.example.domain.ProdDto;

import org.example.service.ProdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/prod")
public class ProdController {
    @Autowired
    ProdService prodService;


    @GetMapping("/register")
    public String prodregisterGET(Model m) throws Exception{
//        ProdDto prodDto = new ProdDto();
//        m.addAttribute("prodDto",prodDto);

        return "prodRegister";
    }

    @PostMapping("/register")
    public String prodregisterPost(@ModelAttribute ProdDto prodDto) throws Exception{
        int a=0;
        //System.out.println("prodDto = " + prodDto);
        a= prodService.productRegister(prodDto);
        System.out.println("a = " + a);
        return "admin";
    }


    @GetMapping("/search")
    public String prodSearchGET(Model m, NotcSearchCondition sc) throws Exception{
        ProdDto prodDto = new ProdDto();

        m.addAttribute("prodDto",prodDto);

        int totalCnt = prodService.getprodCount(sc);
        m.addAttribute("totalCnt",totalCnt);
        List<ProdDto> list = prodService.getprodSearchResult(sc);
        m.addAttribute("list",list);

        NotcPageHandler notcPageHandler = new NotcPageHandler(totalCnt, sc);
        m.addAttribute("pageHandler",notcPageHandler);


        return "prodsearch";
    }

}
