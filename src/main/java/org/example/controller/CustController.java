package org.example.controller;

import org.example.dao.CustDao;
import org.example.domain.CustDto;
import org.example.domain.CustPageHandler;
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
import java.util.HashMap;
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

    @GetMapping("/custSelectAll")
    public String selectAll(CustDto custDto, Model m,HttpServletRequest request,
                            @RequestParam(defaultValue = "1") Integer page,
                            @RequestParam(defaultValue = "10") Integer pageSize) throws Exception {
        //관리자페이지에 회원리스트 보여주는 코드
        List<CustDto> custList = custService.getCustList();
        m.addAttribute("custList",custList);

        //---------
        int totalCnt = custList.size();
        //페이지핸들러를 위한 회원수

        m.addAttribute("cust_totalCnt",totalCnt);

        CustPageHandler handler = new CustPageHandler(totalCnt,page,pageSize);

        // map에 offset,pageSize 입력

        Map map = new HashMap();
        map.put("offset", (page-1)*pageSize);
        map.put("pageSize",pageSize);
        //10개씩 가져오는 매퍼 필요
        List<CustDto> CustList = custService.CustPage(map);
        m.addAttribute("CustListPage",CustList);
        m.addAttribute("cust_ph",handler);
        //--------


        return "custSelectAll";
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
        // 포인트 없으면 에러난다. 0으로 라도 세팅해줘야함 -> 회원가입시 세팅 해줘야할듯.
        pointDto pointList = pointService.selectPointOne(custId);
        m.addAttribute("pointResult",pointList.getPoint());

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
