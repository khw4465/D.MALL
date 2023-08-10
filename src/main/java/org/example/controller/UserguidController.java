package org.example.controller;

import org.example.domain.GuidDto;
import org.example.domain.GuidPageHandler;
import org.example.service.GuidServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value ="/user")
public class UserguidController {
    @Autowired
    GuidServiceImpl guidService;

    @GetMapping("/list")

    public String list(Integer page, Integer pageSize, Model m) {
        if (page == null) page = 1;
        if (pageSize == null) pageSize = 10;

        try {
            int totalCnt = guidService.getCount();
            m.addAttribute("totalCnt", totalCnt);
            GuidPageHandler guidpageHandler = new GuidPageHandler(totalCnt, page, pageSize);

            Map map = new HashMap();
            map.put("offset", (page - 1) * pageSize);
            map.put("pageSize", pageSize);

            List<GuidDto> list = guidService.getPage(map);


            m.addAttribute("list", list);
            m.addAttribute("pagehandler", guidpageHandler);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "cs_user_guid";
    }

}