package org.example.controller;

import org.example.dao.CustLoginHistDao;
import org.example.domain.CustDto;
import org.example.domain.CustStatsDto;
import org.example.domain.LoginHistoryDTO;
import org.example.service.CustLoginHistService;
import org.example.service.CustStatsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class CustHistController { // 이력통계작업 여기서가자

    CustLoginHistService custLoginHistService; //
    CustLoginHistDao custLoginHistDao; // 임시 테스트용

    @Autowired
    CustStatsService custStatsService;

    public CustHistController(CustLoginHistService custLoginHistService, CustLoginHistDao custLoginHistDao) {
        this.custLoginHistService = custLoginHistService;
        this.custLoginHistDao = custLoginHistDao;
    }

    // 이력작업
    @GetMapping("/loginHist")
    public String loginHist(LoginHistoryDTO loginHistoryDTO, Model m) throws Exception {
        List<LoginHistoryDTO> loginlist = custLoginHistService.selectAllLoginHist();
        m.addAttribute("loginlist",loginlist);

        return "loginlist"; // 바꿔야함 나중에
    }

    // 통계작업
    @GetMapping("/stats")
    public String selectAllStats(LoginHistoryDTO loginHistoryDTO, Model m) throws Exception {
        List<CustStatsDto> loginstats = custStatsService.selectAllLoginStats();
        System.out.println("loginstats = " + loginstats);
        m.addAttribute("loginstats",loginstats);

        return "stats";
    }
}
