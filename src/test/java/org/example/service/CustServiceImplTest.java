package org.example.service;

import org.example.dao.CustDao;
import org.example.domain.CustDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CustServiceImplTest {

    @Autowired
    private CustService custService;

    @Autowired
    private CustDao custDao;

    @Test
    public void getCustList() throws Exception {
        assertTrue(custService.getCustList()!=null);
        System.out.println("custService.getCustList() = " + custService.getCustList());
        System.out.println("custDao.count() = " + custDao.count());
    }

    @Test
    public void findCustId()  throws Exception {
    }

    @Test
    public void loginCust() throws Exception {
        //버려질것같다 이코드
    }

    @Test
    public void registerCust()  throws Exception { // 테스트회원 100개 넣기
        //custDao.deleteAll();
        //assertTrue(custDao.count()==0);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
        Date date = formatter.parse("2023/07/06");

        for (int i = 4; i <= 220; i++) {
        CustDto custDto = new CustDto();
        custDto.setCustId("asdfaaa"+i);
        custDto.setPwd("1234");
        custDto.setName("문희석"+i);
        custDto.setMpNo("01012341234");
        custDto.setCustTp("1");
        custDto.setGrade("GR01");
        custDto.setStus("정상");
        custDto.setRcmdr("아직");
        custDto.setBirth(date);
        custDto.setEmail("aaa@aaa.com");
        custDto.setRegDate(LocalDateTime.now());
        custDto.setAcno("121212-01-121212");
        custDto.setLginDttm(LocalDateTime.now());
        custDto.setGender("남");
        custDto.setRegn("대한민국");
        custDto.setFstReg(LocalDateTime.now());
        custDto.setFstRegr("User001");
        custDto.setLastUpd(LocalDateTime.now());
        custDto.setLastUpdr("User001");
        custService.registerCust(custDto);
        }

    }

    @Test
    public void modifyselect()  throws Exception {
        //id주면 dto반환
    }

    @Test
    public void withdrawal() throws Exception  {
        //탈퇴
    }

    @Test
    public void temporaryPwd()  throws Exception {
        //임시비번발급
    }

    @Test
    public void temporaryPwdReturn()  throws Exception {
        //임시비번 디비업데이트쳐줌
    }
}