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
    public String addPost(HttpServletRequest request,String toURL, HttpSession session, Model m,
                          @Valid CustDto custDto, BindingResult result, String pwd, String pwd2)
            throws Exception {
        String nationInfo = request.getHeader("Accept-Language");
        String deviceInfo = request.getHeader("User-Agent");
        // 회원가입시 로그인상태가 되는데 로그인이력 남기기 위한 코드
        LoginHistoryDTO loginHistoryDTO = new LoginHistoryDTO();
        loginHistoryDTO.setCustId(custDto.getCustId()); // 아이디
        loginHistoryDTO.setDttm(LocalDateTime.now()); // 발생시간
        loginHistoryDTO.setIp(request.getRemoteAddr()); //IP 로컬일때는 0 0 0 0 임
        loginHistoryDTO.setNatn(nationInfo); // 국가 추론
        loginHistoryDTO.setMhrLS(deviceInfo); // 기기(기계) 추론
        loginHistoryDTO.setScssYn("Y"); //로그인성공여부
        loginHistoryDTO.setFailCnt(0); //로그인실패카운트

        // 로그인이력에 국가 넣을떄 ko,en-US;q=0.9,en;q=0.8,ko-KR;q=0.7
        // 이렇게 긴 코드가 들어가는데, 맨 앞자리 2개만 추출해서 저장하는 코드
        loginHistNationCodeSetting(request, loginHistoryDTO,nationInfo,m);

        //사용자기기 추출 메서드
        deviceExtract(request, m, loginHistoryDTO,deviceInfo);

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
            custDto.setRegDate(LocalDateTime.now());
            m.addAttribute("user", custDto);

//            custDao.insertUser(custDto); // 회원가입
            Date Date2 = new Date(); // 현재 날짜와 시간을 가져옵니다.
            custDto.setBirth(Date2); // 기본날짜 설정 땜빵 (널포인터예방)
            custService.registerCust(custDto); // 회원가입

            // toURL = toURL == null || toURL.equals("") ? "/" : toURL;
            // return "redirect:" + toURL;
            return "registerCustInfo";
        } catch (Exception e) {
            throw new RuntimeException(e); //e. 찍으면 return 써줘야하네
        } finally {
            RegisterSettingPoint(custDto,m); // 포인트 초기화 메서드
            custLoginHistService.LoginHistInsert(loginHistoryDTO);
            //최신이력 한줄 가져와서 포인트 초기화

            // 회원가입정보 띄워줄 모델들 저장.
            m.addAttribute("custDtoInfo",custDto); // 회원정보
            // m.addAttribute("loginHistoryDTOInfo",loginHistoryDTO); //로그인이력
            session.invalidate(); // 회원가입후 바로 로그아웃시키기
        }
    }

    private static void loginHistNationCodeSetting(HttpServletRequest request, LoginHistoryDTO loginHistoryDTO,String nationInfo,Model m) {
        String acceptLanguage = nationInfo;
        if (acceptLanguage != null && !acceptLanguage.isEmpty()) {
            String[] languages = acceptLanguage.split(",");
            if (languages.length > 0) {
                String firstLanguage = languages[0];
                if (firstLanguage.length() >= 2) {
                    String firstTwoChars = firstLanguage.substring(0, 2);
                    loginHistoryDTO.setNatn(firstTwoChars);
                    m.addAttribute("nationInfo",firstTwoChars);
                }
            }
        }
    }

    private static void deviceExtract(HttpServletRequest request, Model m, LoginHistoryDTO loginHistoryDTO,String deviceInfo) {
        String device = deviceInfo;
        String userDevice ="";
        if (device != null && !device.isEmpty()) {
            int startIndex = device.indexOf('(');
            int endIndex = device.indexOf(')');
            if (startIndex != -1 && endIndex != -1 && startIndex < endIndex) {
                userDevice = device.substring(startIndex + 1, endIndex);
                loginHistoryDTO.setMhrLS(userDevice); // 기기(기계) 추론
                m.addAttribute("deviceInfo",userDevice);
            }
            // 사용자 로그인기기가 윈도우 또는 맥일때 대비해서 모델에 저장 메서드
            deviceCheck(m, userDevice);
        }
    }

    private static void deviceCheck(Model m, String userDevice) {
        if(userDevice.contains("Windows")){
            m.addAttribute("Windows","Windows");
        } else if (userDevice.contains("Macintosh")) {
            m.addAttribute("Macintosh","Macintosh");
        }
    }

    private void RegisterSettingPoint(CustDto custDto,Model m) throws Exception {
        pointDto point = new pointDto();
        // pointService.selectLatestPointHist(); //가져옴 0804 주석처리
        //point.setPntId(pointService.selectLatestPointHist().getPntId()+1); //기본값 세팅
        point.setCustId(custDto.getCustId());
        point.setStus("가입축하");
        point.setChngPnt(3000);
        point.setPoint(3000);
        point.setDttm(LocalDateTime.now());
        point.setChgCn("가입축하 포인트");
        m.addAttribute("pointInfo",3000);
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