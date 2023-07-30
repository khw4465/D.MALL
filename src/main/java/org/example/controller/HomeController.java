package org.example.controller;

import org.example.dao.CateMainDao;
import org.example.dao.ProdCateDao;
import org.example.domain.CateMainDto;
import org.example.domain.ProdCateDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    CateMainDao cateMainDao;
    @Autowired
    ProdCateDao prodCateDao;
    @RequestMapping("/")
    public String home(Model m) {
        try {
            List<List<ProdCateDto>> prodCateLists = prodCateDao.getMainCate();
            m.addAttribute("prodCate", prodCateLists);
            
            List<CateMainDto> cateMain = cateMainDao.selectAll();
            m.addAttribute("cateMain", cateMain);

            return "newmaintest";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}