package org.example.controller;


import org.example.domain.NotcDto;
import org.example.domain.NotcPageHandler;
import org.example.domain.NotcSearchCondition;
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
    public String remove(String bbsoNo, Model m, Integer page, Integer pageSize, RedirectAttributes rattr){
        m.addAttribute("page",page);
        m.addAttribute("pageSize",pageSize);
        try{
            int rowcnt = notcService.remove(bbsoNo);

            if(rowcnt!=1)
                throw new Exception("notc remove error");

            rattr.addFlashAttribute("msg","DEL_OK");
        } catch (Exception e){
            e.printStackTrace();
            rattr.addFlashAttribute("msg","DEL_ERR");
        }

        return "redirect:/notc/list";
    }

    @GetMapping("/read")
    public String read(String bbsoNo, Model m, NotcSearchCondition sc, RedirectAttributes rattr){
        try {
            NotcDto NotcDto = notcService.read(bbsoNo);
            m.addAttribute("NotcDto",NotcDto);
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
    public String list(NotcSearchCondition sc, Model m, String bbsoNo){
//        if(!loginCheck(request))
//            return "redirect:/login/login?toURL="+request.getRequestURL();
        // 로그인을 안했으면 로그인 화면으로 이동

        try {
            int totalcnt = notcService.getSearchResultcnt(sc);
            m.addAttribute("totalcnt",totalcnt);
            m.addAttribute("page",sc.getPage());
            m.addAttribute("pageSize",sc.getPageSize());

            NotcPageHandler notcpageHandler = new NotcPageHandler(totalcnt, sc);
            List<NotcDto> list = notcService.getSearchResultPage(sc);
            System.out.println("Controller = " + list);
            m.addAttribute("list",list);
            m.addAttribute("pagehandler",notcpageHandler);

            Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
            m.addAttribute("startOfToday",startOfToday.toEpochMilli());
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg","LIST_ERR");
            m.addAttribute("totalcnt",0);
        }

        return "cs_notc";
    }
}
