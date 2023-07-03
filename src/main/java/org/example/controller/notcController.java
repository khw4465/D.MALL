package org.example.controller;


import org.example.domain.PageHandler;
import org.example.domain.notcDTO;
import org.example.service.NotcService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/notc")
public class notcController {

    @Autowired
    NotcService notcService;

    @PostMapping("/remove")
    public String remove(String BBSO_NO, Model m, Integer page, Integer pageSize, RedirectAttributes rattr){

        try{
            m.addAttribute("page",page);
            m.addAttribute("pageSize",pageSize);

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
    public String read(String BBSO_NO,Integer NOTC_CNT, Model m, Integer page, Integer pageSize){
        try {
            notcDTO notcDto = notcService.read(BBSO_NO,NOTC_CNT);

            m.addAttribute("notcDto",notcDto);
            m.addAttribute("page",page);
            m.addAttribute("pageSize",pageSize);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "notcview";
    }

    @GetMapping("/list")
    public String list(Integer page, Integer pageSize, Model m, HttpServletRequest request){
//        if(!loginCheck(request))
//            return "redirect:/login/login?toURL="+request.getRequestURL();
        // 로그인을 안했으면 로그인 화면으로 이동

        if(page==null) page=1;
        if(pageSize==null) pageSize=10;

        try {
            int totalCnt = notcService.getCount();
            PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);

            Map map = new HashMap();
            map.put("offset",(page-1)*pageSize);
            map.put("pageSize",pageSize);

            List<notcDTO> list = notcService.getPage(map);

            System.out.println("list = " + list);

            m.addAttribute("list",list);
            m.addAttribute("pagehandler",pageHandler);
            m.addAttribute("page",page);
            m.addAttribute("pageSize",pageSize);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "CS_notc";
    }


}
