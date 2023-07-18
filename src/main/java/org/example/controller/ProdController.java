package org.example.controller;

import org.example.domain.NotcPageHandler;
import org.example.domain.NotcSearchCondition;
import org.example.domain.ProdDto;
import org.example.domain.*;

import org.example.service.ProdImgService;
import org.example.service.ProdOptService;

import org.example.service.ProdService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

import java.util.List;

@Controller
@RequestMapping("/prod")
public class ProdController {
    ProdService prodService;
    ProdImgService prodImgService;
    ProdOptService prodOptService;
    public ProdController(ProdService prodService, ProdImgService prodImgService, ProdOptService prodOptService){
        this.prodService = prodService;
        this.prodImgService = prodImgService;
        this.prodOptService = prodOptService;
    }


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

    @GetMapping("/detail/{prodCd}")     //  테스트용 데이터는 P010202
    public String prodDetail(@PathVariable String prodCd, Model m) {
        try {
            ProdDto prodDto = prodService.getProdDetail(prodCd);            // 상품의 정보들을 담은 dto
            m.addAttribute("prodDto", prodDto);

            List<ProdImgDto> imgList = prodImgService.getAllImg(prodCd);    // 한 상품에 대한 이미지dto 리스트
            m.addAttribute("imgList", imgList);

            List<ProdOptDto> optList = prodOptService.getOptList(prodCd);   // 한 상품에 대한 옵션dto 리스트
            m.addAttribute("optList", optList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "prodDetail";
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
