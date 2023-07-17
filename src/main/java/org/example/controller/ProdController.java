package org.example.controller;

import org.example.domain.ProdDto;
import org.example.domain.ProdImgDto;
import org.example.service.ProdImgService;
import org.example.service.ProdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/prod")
public class ProdController {
    ProdService prodService;
    ProdImgService prodImgService;
    public ProdController(ProdService prodService, ProdImgService prodImgService){
        this.prodService = prodService;
        this.prodImgService = prodImgService;
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
            ProdDto prodDto = prodService.getProdDetail(prodCd);
            m.addAttribute("prodDto", prodDto);         // 상품의 정보들을 담은 dto

            List<ProdImgDto> list = prodImgService.getAllImg(prodCd);
            m.addAttribute("imgList", list);            // 한 상품의 사진을 담은 dto 리스트
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "prodDetail";
    }
}
