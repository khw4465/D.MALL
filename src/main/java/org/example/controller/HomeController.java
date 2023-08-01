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

            List<String> Img = new ArrayList<>();

            List<ProdDto> prodDto = prodDao.selectAll();

            m.addAttribute("prodDtoAll",prodDto); // 모든상품 리스트
            prodDto.get(1).getProdImg();
//            for (ProdDto dto : prodDto) {
//                Img.add(dto.getProdImg()); // 이미지만 출력
//            }
//            m.addAttribute("prodImg",Img); // 이미지만 담음
            m.addAttribute("prodDtoAllSize",prodDto.size()); // 위에거사이즈

            return "newmaintest";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}