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
import org.springframework.web.multipart.MultipartFile;

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
    public String prodregisterPost(@ModelAttribute ProdDto prodDto,String cateName) throws Exception{
//        System.out.println("file = " + file);
        String a = cateName; //카테고리
        String b = prodDto.getProdName(); //그린맛
        StringBuilder sb = new StringBuilder(a);
        sb.append(" "+" ");
        sb.append(b);
        String c = sb.toString(); // "카테고리+입력한이름명 들어감"

        prodDto.setProdName(c);
        prodService.productRegister(prodDto); //prod 테이블에는 들어감
        // 이미지테이블에 들어온 개수만큼 하나씩 쌓아야함.

        return "admin";
    }


    @GetMapping("/search")
    public String prodSearchGET(Model m, NotcSearchCondition sc,String keyword1) throws Exception{
        System.out.println("keyword1 = " + keyword1);
        //        ProdDto prodDto = new ProdDto();
//
//        m.addAttribute("prodDto",prodDto);
//
//        int totalCnt = prodService.getprodCount(sc);
//        m.addAttribute("totalCnt",totalCnt);
//        List<ProdDto> list = prodService.getprodSearchResult(sc);
//        m.addAttribute("list",list);
//
//        NotcPageHandler notcPageHandler = new NotcPageHandler(totalCnt, sc);
//        m.addAttribute("pageHandler",notcPageHandler);


        //return "prodsearch";
        return "index";
    }

}
