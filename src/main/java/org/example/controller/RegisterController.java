package org.example.controller;

import org.example.dao.CustDao;
import org.example.domain.CustDto;
import org.example.domain.LoginHistoryDTO;
import org.example.domain.custValidator;
import org.example.domain.pointDto;
import org.example.service.CustLoginHistService;
import org.example.service.CustService;
import org.example.service.CustServiceImpl;
import org.example.service.PointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/register")
public class RegisterController {
    CustDao custDao;
    CustLoginHistService custLoginHistService;
    CustService custService;
    PointService pointService;
    public RegisterController(CustDao custDao, CustLoginHistService custLoginHistService, CustService custService, PointService pointService) {
        this.custDao = custDao;
        this.custLoginHistService = custLoginHistService;
        this.custService = custService;
        this.pointService = pointService;
    }
    // 생성자 주입

    // 회원가입화면 보여준다.
    @GetMapping("/add")
    public String add() {
        return "register";
    }

    // 회원가입 로직
    @PostMapping("/add")
    public String addPost(HttpServletRequest request,String toURL, HttpSession session, Model model,
                          @Valid CustDto custDto, BindingResult result, String pwd, String pwd2) throws Exception {

        // 회원가입시 로그인상태가 되는데 로그인이력 남기기 위한 코드
        LoginHistoryDTO loginHistoryDTO = new LoginHistoryDTO();
        loginHistoryDTO.setCustId(custDto.getCustId()); //아이디
        loginHistoryDTO.setDttm(LocalDateTime.now()); // 발생시간
        loginHistoryDTO.setIp(request.getRemoteAddr()); //IP 로컬일때는 0 0 0 0 임
        loginHistoryDTO.setNatn(request.getHeader("Accept-Language")); // 국가 추론
        loginHistoryDTO.setMhrLS(request.getHeader("User-Agent")); // 기기(기계) 추론
        loginHistoryDTO.setScssYn("Y"); //로그인성공여부
        loginHistoryDTO.setFailCnt(0); //로그인실패카운트

        try {
            if(!(pwd.equals(pwd2))){
                //String msg = "비밀번호가 다릅니다.";
                return "redirect:/register/add"+"111";
            } //회원가입시 비번과 비번확인창의 내용이 다르면 다시 돌려보냄.

            if(result.hasErrors()){
                System.out.println("Validation Error");
                System.out.println("result = " + result);
                return "register";
            } // 벨리데이터 에러가 나면 다시 회원가입화면으로 간다.

            session.setAttribute("id", custDto.getCustId());
            custDto.setCustTp("1"); // 회원의 상태를 1로한다.
            custDto.setStus("정상"); // 나중에 정상인지 아닌지 판단 필요
            custDto.setGrade("초심닭"); // 나중에 등급분리 필요
            model.addAttribute("user", custDto);

//            custDao.insertUser(custDto); // 회원가입
            Date Date2 = new Date(); // 현재 날짜와 시간을 가져옵니다.
            custDto.setBirth(Date2); // 기본날짜 설정 땜빵 (널포인터예방)
            custService.registerCust(custDto); // 회원가입


            toURL = toURL == null || toURL.equals("") ? "/" : toURL;
            return "redirect:" + toURL;
        } catch (Exception e) {
            throw new RuntimeException(e); //e. 찍으면 return 써줘야하네
        } finally {
            RegisterSettingPoint(custDto); // 포인트 초기화 메서드
            custLoginHistService.LoginHistInsert(loginHistoryDTO);
            //최신이력 한줄 가져와서 포인트 초기화
            session.invalidate(); // 회원가입후 바로 로그아웃시키기
        }
    }

    private void RegisterSettingPoint(CustDto custDto) throws Exception {
        pointDto point = new pointDto();
        // pointService.selectLatestPointHist(); //가져옴 0804 주석처리
        //point.setPntId(pointService.selectLatestPointHist().getPntId()+1); //기본값 세팅
        point.setCustId(custDto.getCustId());
        point.setStus("가입축하");
        point.setChngPnt(3000);
        point.setPoint(3000);
        point.setDttm(LocalDateTime.now());
        point.setChgCn("가입축하 포인트");
//        point.setPntYn("Y"); 0807주석
        pointService.insertPoint(point);
    }

    @InitBinder
    public void toDate(WebDataBinder binder){
        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
        binder.registerCustomEditor(Date.class,new CustomDateEditor(df,false));
        binder.setValidator(new custValidator());

        List<Validator> validators = binder.getValidators();
        System.out.println("validators = " + validators);
    }
}