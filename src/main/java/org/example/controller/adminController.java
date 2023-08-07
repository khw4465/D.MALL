package org.example.controller;

import org.example.domain.CustDto;
import org.example.domain.CustStatsDto;
import org.example.service.CustService;
import org.example.service.CustStatsService;
import org.example.service.OrderListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class adminController {
    CustService custService;
    CustStatsService custStatsService;
    OrderListService orderListService;
    public adminController(CustService custService, CustStatsService custStatsService, OrderListService orderListService) {
        this.custService = custService;
        this.custStatsService = custStatsService;
        this.orderListService = orderListService;
    }

    @GetMapping("/admin")
    public String admin(Model m) throws Exception {
        List<CustStatsDto> loginstats = custStatsService.selectAllLoginStats();
        // 모든 로그인 정보의 통계를 List로 가져온다. (특정회원아님)
        m.addAttribute("loginstats",loginstats);


        List<Map<String, Object>> stats = orderListService.getStat();
        m.addAttribute("stat", stats);

        // 모델에 담는다.
        return "admin";
        //관리자페이지를 불러온다.
    }

    @RequestMapping("/modifyInfo")
    public String modifyInfo() {
        return "modifyInfo";
        //정보수정 페이지를 불러온다.
    }

    @RequestMapping("/myPage")
    public String myPage() {
        return "myPage";
        //마이페이지를 불러온다.
    }

    @RequestMapping("/prodDetails")
    public String prodDetails() {
        return "prodDetailtest";
    }

}
