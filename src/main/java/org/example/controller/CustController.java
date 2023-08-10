package org.example.controller;

import org.example.dao.CustDao;
import org.example.domain.*;
import org.example.service.CustLoginHistService;
import org.example.service.CustService;
import org.example.service.OrderListService;
import org.example.service.PointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class CustController {

    CustService custService;
    CustDao custDao;
    CustLoginHistService custLoginHistService;

    @Autowired
    PointService pointService; // 마이페이지 눌렀을때 포인트 띄워주기 위함.
    @Autowired
    OrderListService orderListService;

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

        List<OrderDto> ordList =  orderListService.getOrdMonth(custId, 3);
        m.addAttribute("ordList", ordList);
        return "myPage";
        //return "error";
    }

    @GetMapping("custModify")
    public String custModify(CustDto custDto, Model m, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession(); // 세션을 받아온다.
        String custId= (String) session.getAttribute("id");
        if (custId == null) {
            return "login";
        }

        CustDto dto = custService.modifyselect((String) session.getAttribute("id"));
        m.addAttribute("custId", custId);
        dto.setCustId(custId);
        //m.addAttribute("modydto", dto);

        // 여기서 널포인터 나는데 dto 가져올때 아무값도 없어서 그런듯. 만들어질때 기본발급 해야할듯.

        // 생년월일을 년, 월, 일로 분리
        Date birth = dto.getBirth();
        Calendar cal = Calendar.getInstance();
        cal.setTime(birth);
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH) + 1; // 월은 0부터 시작하므로 +1
        int day = cal.get(Calendar.DAY_OF_MONTH);

        System.out.println("year = " + year);
        System.out.println("month = " + month);
        System.out.println("day = " + day);
        // 년, 월, 일을 모델에 추가
        m.addAttribute("birthYear", year);
        m.addAttribute("birthMonth", String.format("%02d", month)); // 월은 두 자리로 출력
        m.addAttribute("birthDay", String.format("%02d", day));

        m.addAttribute("modydto", dto);
        return "modifyInfo";
    }
    @PostMapping("/custModify")
    @ResponseBody
    public ResponseEntity<?> modifyCustomer(@RequestBody Map<String, Object> payload, HttpServletRequest request) throws Exception {
        try {
            HttpSession session = request.getSession();

            String custName = (String) payload.get("cust-name");
            String custMpNo = (String) payload.get("cust-mpno");
            String custEmail = (String) payload.get("cust-email");
            String custAcno = (String) payload.get("cust-acno");

            Map<String, String> birthdate = (Map<String, String>) payload.get("birthdate");
            String birthYear = birthdate.get("year");
            String birthMonth = birthdate.get("month");
            String birthDay = birthdate.get("day");
            String birthString = birthYear + "-" + birthMonth + "-" + birthDay; // 생년월일을 문자열 형태로 조합합니다.

            // 문자열을 Date 객체로 변환합니다.
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date birth = sdf.parse(birthString);

            CustDto dto = custDao.selectUser((String) session.getAttribute("id"));

            dto.setName(custName);
            dto.setMpNo(custMpNo);
            dto.setEmail(custEmail);
            dto.setAcno(custAcno);
            dto.setBirth(birth); // dto에 생년월일을 설정합니다.
            custDao.updateUser(dto);

            return ResponseEntity.ok(dto);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("An error occurred while updating the customer data.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("deleteCust")
    public String deleteCust(CustDto dto,Model m , HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession(); // 세션을 받아온다.
        String custId = (String) session.getAttribute("id");
        custService.withdrawal(custId);
        pointService.updatePoint(custId); //포인트이력 N 으로
        session.invalidate();

        return "redirect:/";
    }




}
