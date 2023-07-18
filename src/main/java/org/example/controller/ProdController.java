package org.example.controller;

import org.example.domain.*;

import org.example.service.ProdImgService;
import org.example.service.ProdOptService;

import org.example.service.ProdService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
        ProdDto prodDto = new ProdDto();
        m.addAttribute("prodDto",prodDto);

        return "prodRegister";
    }

    @PostMapping("/register")
    public String prodregisterPost(ProdDto prodDto) throws Exception{
        // 상품등록 서비스 호출


        return "admin"; // 결과창 다른곳으로 돌려보내야함.
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
