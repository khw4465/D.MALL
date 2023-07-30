package org.example.controller;

import com.mysql.cj.Session;
import org.example.dao.PointDao;
import org.example.domain.CustDto;
import org.example.domain.CustPageHandler;
import org.example.domain.pointDto;
import org.example.service.PointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/point")
public class PointController {
    PointDao pointDao;
    PointService pointService;
    public PointController(PointDao pointDao, PointService pointService) {
        this.pointDao = pointDao;
        this.pointService = pointService;
    }
    @GetMapping("/custSelectAll")
    public String selectCustPoint(CustDto custDto, Model m, HttpServletRequest request,
                                  @RequestParam(defaultValue = "1") Integer page,
                                  @RequestParam(defaultValue = "10") Integer pageSize) throws Exception {
        HttpSession session = request.getSession();  // 세션을 받아온다.
        String custId= (String) session.getAttribute("id");  // 회원아이디 뽑아내기
        // 회원의 포인트를 가져와야함.
        if(custId == null){
            return "login";
        }
        // 마이페이지 진입시 포인트 보여야함 ( 접속한 회원의 id 꺼)
        pointDto pointList = pointService.selectPointOne(custId);
        // custid주고 포인트목록 불러와서 모델에 저장
        m.addAttribute("pointResult",pointList);
        // 포인트 누를시 특정회원의 포인트상세 나옴.

        try {
            //int totalCnt = pointDao.count(custId); //다오
            int totalCnt = pointService.countPoint(custId);
            //페이지핸들러를 위한 포인트이력 개수 카운트
            
            m.addAttribute("totalCnt",totalCnt);

            CustPageHandler handler = new CustPageHandler(totalCnt,page,pageSize);

            // map에 offset,pageSize,회원아이디 입력

            Map map = new HashMap();
            map.put("offset", (page-1)*pageSize);
            map.put("pageSize",pageSize);
            map.put("custId", custId);
           // List<pointDto> pointlist = pointDao.selectPage(map); //다오
            List<pointDto> pointlist = pointService.selectPointPage(map); //변수명 수정해야함
            // 페이지핸들러와 회원의 포인트이력 모두 뽑아서 모델에 저장
            m.addAttribute("pointlist",pointlist);
            m.addAttribute("ph",handler);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "custPointList";
    }


}
