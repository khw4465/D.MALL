package org.example.controller;

import org.example.domain.FaqDto;
import org.example.domain.FaqPageHandler;
import org.example.service.FaqServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/faq")
public class FaqController {
    @Autowired
    FaqServiceImpl faqService;

    @GetMapping("/list")
    public String list(Integer page, Integer pageSize, Model m) {
        if (page == null) page = 1;
        if (pageSize == null) pageSize = 10;

        try{
            int totalCnt = faqService.getCount();
            m.addAttribute("totalCnt", totalCnt);
            FaqPageHandler faqpageHandler = new FaqPageHandler(totalCnt, page, pageSize);

            Map map = new HashMap();
            map.put("offset", (page - 1) * pageSize);
            map.put("pageSize", pageSize);

            List<FaqDto> list = faqService.getPage(map);
            m.addAttribute("list", list);
            m.addAttribute("pagehandler", faqpageHandler);
        } catch (Exception e){
            e.printStackTrace();
        }
        return "cs_faq";
    }
}
