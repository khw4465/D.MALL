package org.example.controller;

import org.example.dao.CustDao;
import org.example.domain.CustDto;
import org.example.domain.LoginHistoryDTO;
import org.example.domain.pointDto;
import org.example.service.CustLoginHistService;
import org.example.service.CustService;
import org.example.service.PointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class CustController {

    CustService custService;
    CustDao custDao;
    CustLoginHistService custLoginHistService;

    @Autowired
    PointService pointService; // 마이페이지 눌렀을때 포인트 띄워주기 위함.

    public CustController(CustService custService, CustDao custDao, CustLoginHistService custLoginHistService) {
        this.custService = custService;
        this.custDao = custDao;
        this.custLoginHistService = custLoginHistService;
    }

    @GetMapping("/custselect")
    public String selectAll(CustDto custDto, Model m) throws Exception {
        //관리자페이지에 회원리스트 보여주는 코드
        List<CustDto> list = custService.getCustList();
        m.addAttribute("list",list);
        m.addAttribute("test1","test1");
        return "admin";
    }


//    @GetMapping("custMyPage")
//    public String custMyPageGet(){
//        return "myPage";
//    }

    @GetMapping("custMyPage")
    public String custMyPage(CustDto custDto, Model m, HttpServletRequest request) throws Exception {
        //세션에 아이디가 없으면 로그인창으로 이동 // 나중에는 db에 아이디가 있는지까지 체크해야함.
        HttpSession session = request.getSession();// 세션을 받아온다.
        String custId = (String) session.getAttribute("id"); // 회원아이디 뽑아내기
        int pointLast=0;
        if(custId == null){
            return "login";
        }
        // 마이페이지 진입시 포인트 보여야함 ( 접속한 회원의 id 꺼)
        List<pointDto> pointList = pointService.selectPoint(custId);
        for (pointDto point : pointList) {
            pointLast = point.getPoint(); //마지막꺼를 가지고와야하는구나.
            // 일부러 더하지 않고 마지막꺼만 저장 이유는 매퍼에 select 쿼리 재사용위해서
            // 나중에 포인트상세에서 써먹으려고
        }
        m.addAttribute("pointResult",pointLast);

        //System.out.println("session.getAttribute(\"id\") = " + session.getAttribute("id"));
        //System.out.println("session.getAttribute(\"custId\") = " + session.getAttribute("custId"));
        return "myPage";
        //return "error";
    }

    @GetMapping("custModify")
    public String custModify(CustDto custDto, Model m, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession(); // 세션을 받아온다.
        if(session.getAttribute("id") == null){
            return "login";
        }

         CustDto dto = custService.modifyselect((String) session.getAttribute("id"));
        m.addAttribute("custId",session.getAttribute("id"));
        dto.setCustId((String) session.getAttribute("id"));
        m.addAttribute("modydto",dto);

        return "modifyInfo";
        //return "error";
    }
    @PostMapping("/custModify")
    @ResponseBody
    public ResponseEntity<?> modifyCustomer(@RequestBody Map<String, String> payload, HttpServletRequest request) throws Exception {
        try {
            HttpSession session = request.getSession();

            String custName = payload.get("cust-name");
            String custMpNo = payload.get("cust-mpno");
            String custEmail = payload.get("cust-email");
            String custAcno = payload.get("cust-acno");

            CustDto dto = custDao.selectUser((String) session.getAttribute("id"));

            dto.setName(custName);
            dto.setMpNo(custMpNo);
            dto.setEmail(custEmail);
            dto.setAcno(custAcno);

            custDao.updateUser(dto);
            System.out.println("Updated Customer Info = " + dto.toString());

            // Now we return the updated customer as the response body
            return ResponseEntity.ok(dto);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("An error occurred while updating the customer data.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("deleteCust")
    public String deleteCust(CustDto dto,Model m , HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession(); // 세션을 받아온다.
        custService.withdrawal((String) session.getAttribute("id"));
        session.invalidate();

        return "redirect:/";
    }




}
