package org.example.controller;

import org.example.domain.*;
import org.example.service.ProdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
        ProdDto prodDto = new ProdDto();
        m.addAttribute("prodDto",prodDto);

        return "prodRegister";
    }

    @PostMapping("/register")
    public String prodregisterPost(ProdDto prodDto) throws Exception{
        // 상품등록 서비스 호출


        return "admin"; // 결과창 다른곳으로 돌려보내야함.
    }


    @GetMapping("/search")
    public String search(Model m, ProdSearchCondition psc) {

        try{
//            int totalCnt = prodService.getprodCount(psc);
//            m.addAttribute("totalCnt",totalCnt);
        ProdSearchHandler PageHandler = new ProdSearchHandler(psc);
            List<ProdDto> list = prodService.getprodSearchResult(psc);
            m.addAttribute("list",list);
        m.addAttribute("PageHandler",PageHandler);

            System.out.println("list = " + list);
        } catch (Exception e){
            e.printStackTrace();
            m.addAttribute("msg","SEARRCH_ERR");
            m.addAttribute("totalCnt",0);
        }


        return "prodsearch";
//        return "index";
    }

}
