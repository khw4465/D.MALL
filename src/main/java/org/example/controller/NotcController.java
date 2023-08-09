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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping(value = "/notc")
public class NotcController {


    @Autowired
    NotcService notcService;

    //    회원쪽 컨트롤러
    @PostMapping("/modify")
    public String modify(NotcDto dto, HttpSession session, RedirectAttributes rattr, Model m){
        String wrtr = (String) session.getAttribute("id");
        dto.setWrtr(wrtr);

        try {
            int rowCnt = notcService.modify(dto);

            if (rowCnt != 1)
                throw new Exception("modify error");

            rattr.addFlashAttribute("msg","MOD_OK");

            return "redirect:/notc/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("dto",dto);
            m.addAttribute("msg","MOD_ERR");
            return "cs_notcview";
        }

    }


    @GetMapping("/write")
    public String write(Model m){
        m.addAttribute("mode","new");
        return "cs_notcview"; // 읽기와 쓰기에 사용.
    }

    @PostMapping("/write")
    public String write(NotcDto dto, HttpSession session, RedirectAttributes rattr, Model m){
        String wrtr = (String) session.getAttribute("id");
        dto.setWrtr(wrtr);

        try {
            int rowCnt = notcService.write(dto);

            if (rowCnt != 1)
                throw new Exception("write error");

            rattr.addFlashAttribute("msg","WRT_OK");

            return "redirect:/notc/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("dto",dto);
            m.addAttribute("msg","WRT_ERR");
            return "cs_notcview";
        }

    }

    @PostMapping("/remove")
    public String remove(Integer bbsoNo, Model m, NotcSearchCondition sc, RedirectAttributes rattr){
        //        if(!loginCheck(request))
        //            return "redirect:/login/login?toURL="+request.getRequestURL();
        // 로그인을 안했으면 로그인 화면으로 이동
        try{
            int rowCnt = notcService.remove(bbsoNo);

            if(rowCnt!=1)
                throw new Exception("notc remove error");

            rattr.addFlashAttribute("msg","DEL_OK");
        } catch (Exception e){
            e.printStackTrace();
            rattr.addFlashAttribute("msg","DEL_ERR");
        }

        m.addAttribute("page",sc.getPage());
        m.addAttribute("pageSize",sc.getPageSize());

        return "redirect:/notc/list";
    }

    @GetMapping("/read")
    public String read(Integer bbsoNo, Model m, NotcSearchCondition sc, RedirectAttributes rattr){
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
    public String list(NotcSearchCondition sc, Model m){
//        if(!loginCheck(request))
//            return "redirect:/login/login?toURL="+request.getRequestURL();
        // 로그인을 안했으면 로그인 화면으로 이동

        try {
            int totalCnt = notcService.getSearchResultCnt(sc);
            m.addAttribute("totalCnt",totalCnt);
            m.addAttribute("page",sc.getPage());
            m.addAttribute("pageSize",sc.getPageSize());

            NotcPageHandler notcpageHandler = new NotcPageHandler(totalCnt, sc);
            List<NotcDto> list = notcService.getSearchResultPage(sc);

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

//    회원쪽 컨트롤러


    //    관리자쪽 컨트롤러
    //    관리자쪽 컨트롤러
    //    관리자쪽 컨트롤러

    @PostMapping("/adminmodify")
    public String adminmodify(NotcDto dto, HttpSession session, RedirectAttributes rattr, Model m){
        String wrtr = (String) session.getAttribute("id");
        dto.setWrtr(wrtr);

        try {
            int rowCnt = notcService.modify(dto);

            if (rowCnt != 1)
                throw new Exception("modify error");

            rattr.addFlashAttribute("msg","MOD_OK");
            rattr.addFlashAttribute("msg","MOD_READY");

            return "redirect:/notc/adminlist";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("dto",dto);
            m.addAttribute("msg","MOD_ERR");
            return "admin_notcview";
        }

    }

    @PostMapping("/adminremove")
    public String adminremove(Integer bbsoNo, Model m, NotcSearchCondition sc, RedirectAttributes rattr){
        //        if(!loginCheck(request))
        //            return "redirect:/login/login?toURL="+request.getRequestURL();
        // 로그인을 안했으면 로그인 화면으로 이동
        try{
            int rowCnt = notcService.remove(bbsoNo);

            if(rowCnt!=1)
                throw new Exception("notc remove error");

            rattr.addFlashAttribute("msg","DEL_OK");
        } catch (Exception e){
            e.printStackTrace();
            rattr.addFlashAttribute("msg","DEL_ERR");
        }

        m.addAttribute("page",sc.getPage());
        m.addAttribute("pageSize",sc.getPageSize());

        return "redirect:/notc/adminlist";
    }

    @GetMapping("/adminwrite")
    public String adminwrite(Model m){
        m.addAttribute("mode","new");
        return "notcwrite"; // 읽기와 쓰기에 사용.
    }

    @PostMapping("/adminwrite")
    @ResponseBody
    public Map <String, Object> adminwrite(NotcDto dto, HttpSession session, RedirectAttributes rattr, Model m){
        String wrtr = (String) session.getAttribute("id");
        dto.setWrtr(wrtr);

        Map<String, Object> response = new HashMap<>();
        try {
            int rowCnt = notcService.write(dto);

            if (rowCnt != 1)
                throw new Exception("write error");

            response.put("success", true);
            response.put("message", "WRT_OK");
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("dto",dto);
            m.addAttribute("msg","WRT_ERR");
            response.put("success", false);
            response.put("message", e.getMessage());
        }

        return response;
    }
    @GetMapping("/adminread")
    public String adminread(Integer bbsoNo, Model m, NotcSearchCondition sc, RedirectAttributes rattr){
        try {
            NotcDto NotcDto = notcService.read(bbsoNo);
            m.addAttribute("NotcDto",NotcDto);
            m.addAttribute("page",sc.getPage());
            m.addAttribute("pageSize",sc.getPageSize());
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","READ_ERR");
            return "redirect:/notc/adminlist"+sc.getQueryString();
        }
        return "admin_notcview";
    }

    @GetMapping("/adminlist")
    public String adminlist(NotcSearchCondition sc, Model m){
//        if(!loginCheck(request))
//            return "redirect:/login/login?toURL="+request.getRequestURL();
        // 로그인을 안했으면 로그인 화면으로 이동

        try {
            int totalCnt = notcService.getSearchResultCnt(sc);
            m.addAttribute("totalCnt",totalCnt);
            m.addAttribute("page",sc.getPage());
            m.addAttribute("pageSize",sc.getPageSize());

            NotcPageHandler notcpageHandler = new NotcPageHandler(totalCnt, sc);
            List<NotcDto> list = notcService.getSearchResultPage(sc);

            m.addAttribute("list",list);
            m.addAttribute("pagehandler",notcpageHandler);

            Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
            m.addAttribute("startOfToday",startOfToday.toEpochMilli());
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg","LIST_ERR");
            m.addAttribute("totalCnt",0);
        }

        return "admin_notc";
    }

}
