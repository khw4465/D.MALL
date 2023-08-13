package org.example.controller;

import org.example.domain.CustDto;
import org.example.domain.CustStatsDto;
import org.example.domain.OrderDto;
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
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.Date;
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
    public String admin(Model m, HttpServletRequest request) throws Exception {
        List<CustStatsDto> loginstats = custStatsService.selectAllLoginStats();
        // 모든 로그인 정보의 통계를 List로 가져온다. (특정회원아님)
        m.addAttribute("loginstats",loginstats);

        int totalCnt = orderListService.count();
        m.addAttribute("totalCnt",totalCnt);

        List<OrderDto> dto = orderListService.getFullOrder();
        m.addAttribute("allOrder", dto);

        List<Map<String, Object>> stats = orderListService.getStat();
        m.addAttribute("stat", stats);

        Map<String, Double> weekStats = orderListService.getSumAvg(6);
        Map<String, Double> monthStats = orderListService.getSumAvg(29);
        m.addAttribute("weekStat", weekStats);
        m.addAttribute("monthStat", monthStats);


        Calendar calendar = Calendar.getInstance();                             // 날짜 구하기 (조회용)
        request.setAttribute("today", calendar.getTime());
        calendar.add(Calendar.DAY_OF_MONTH, -1);
        Date yesterday = calendar.getTime();
        request.setAttribute("yesterday", yesterday);
        calendar.add(Calendar.DAY_OF_MONTH, -1);
        Date dayBeforeYesterday = calendar.getTime();
        request.setAttribute("dayBeforeYesterday", dayBeforeYesterday);
        calendar.add(Calendar.DAY_OF_MONTH, -1);
        Date threeDaysAgo = calendar.getTime();
        request.setAttribute("threeDaysAgo", threeDaysAgo);

        int todayCost = orderListService.todayCost();
        int todayCnt = orderListService.todayCnt();
        request.setAttribute("todayCost", todayCost);
        request.setAttribute("todayCnt", todayCnt);

        // 모델에 담는다.
        return "admin";
        //관리자페이지를 불러온다.
    }
    @RequestMapping("/prodDetails")
    public String prodDetails() {
        return "prodDetailtest";
    }

}
