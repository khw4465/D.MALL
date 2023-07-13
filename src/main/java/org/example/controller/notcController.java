package org.example.controller;


import org.example.domain.NotcDTO;
import org.example.domain.notcPageHandler;
import org.example.domain.notcSearchCondition;
import org.example.service.NotcService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

@Controller
@RequestMapping(value = "/notc")
public class NotcController {

    @Autowired
    NotcService notcService;

    @PostMapping("/remove")
    public String remove(String BBSO_NO, Model m, Integer page, Integer pageSize, RedirectAttributes rattr){
        m.addAttribute("page",page);
        m.addAttribute("pageSize",pageSize);
        try{
            int rowCnt = notcService.remove(BBSO_NO);

            if(rowCnt!=1)
                throw new Exception("notc remove error");

            rattr.addFlashAttribute("msg","DEL_OK");
        } catch (Exception e){
            e.printStackTrace();
            rattr.addFlashAttribute("msg","DEL_ERR");
        }

        return "redirect:/notc/list";
    }

    @GetMapping("/read")
    public String read(String BBSO_NO, Model m, notcSearchCondition sc, RedirectAttributes rattr){
        try {
            NotcDTO notcDto = notcService.read(BBSO_NO);
            m.addAttribute("notcDto",notcDto);
            m.addAttribute("page",sc.getPage());
            m.addAttribute("pageSize",sc.getPageSize());
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","READ_ERR");
            return "redirect:/notc/list"+sc.getQueryString();
        }
        return "cs_notcview";
    }

    @GetMapping("/list")
    public String list(notcSearchCondition sc, Model m){
//        if(!loginCheck(request))
//            return "redirect:/login/login?toURL="+request.getRequestURL();
        // 로그인을 안했으면 로그인 화면으로 이동

        try {
            int totalCnt = notcService.getSearchResultCnt(sc);
            m.addAttribute("totalCnt",totalCnt);
            m.addAttribute("page",sc.getPage());
            m.addAttribute("pageSize",sc.getPageSize());

            notcPageHandler notcpageHandler = new notcPageHandler(totalCnt, sc);
            List<NotcDTO> list = notcService.getSearchResultPage(sc);
            System.out.println("Controller = " + list);
            m.addAttribute("list",list);
            m.addAttribute("pagehandler",notcpageHandler);

            Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
            m.addAttribute("startOfToday",startOfToday.toEpochMilli());
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg","LIST_ERR");
            m.addAttribute("totalCnt",0);
        }

        return "cs_notc";
    }
}
