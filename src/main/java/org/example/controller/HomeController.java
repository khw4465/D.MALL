package org.example.controller;

import org.example.dao.CateMainDao;
import org.example.dao.ProdCateDao;
import org.example.dao.ProdDao;
import org.example.domain.CateMainDto;
import org.example.domain.ProdCateDto;
import org.example.domain.ProdDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    CateMainDao cateMainDao;
    @Autowired
    ProdCateDao prodCateDao;
    @Autowired
    ProdDao prodDao;

    @RequestMapping("/")
    public String home(Model m) {
        try {
            List<List<ProdCateDto>> prodCateLists = prodCateDao.getMainCate();
            m.addAttribute("prodCate", prodCateLists);
            
            List<CateMainDto> cateMain = cateMainDao.selectAll();
            m.addAttribute("cateMain", cateMain);

            List<ProdDto> prodDto = prodDao.selectAll();
            m.addAttribute("prodDtoAll",prodDto); // 모든상품 리스트 담기

            List<ProdDto> prodcateOne = new ArrayList<>(); // 닭가슴살 카테고리
            List<ProdDto> prodcateTwo = new ArrayList<>(); // 샐러드 카테고리
            List<ProdDto> prodcateThree = new ArrayList<>(); // 도시락.볶음밥
            List<ProdDto> prodcateFour = new ArrayList<>(); // 음료.단백질

            // 상품에서 4가지 카테고리에 대해서 이터레이터 돌면서 저장
            for (ProdDto dto : prodDto) {
                if(dto.getCateCd()>=100 && dto.getCateCd()<=199){
                    prodcateOne.add(dto);
                }
                if(dto.getCateCd()>=200 && dto.getCateCd()<=299){
                    prodcateTwo.add(dto);
                }
                if(dto.getCateCd()>=300 && dto.getCateCd()<=399){
                    prodcateThree.add(dto);
                }
                if(dto.getCateCd()>=400 && dto.getCateCd()<=499){
                    prodcateFour.add(dto);
                }
            }
            m.addAttribute("cateOne",prodcateOne);
            m.addAttribute("cateTwo",prodcateTwo);
            m.addAttribute("cateThree",prodcateThree);
            m.addAttribute("cateFour",prodcateFour);

            return "newmaintest";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}