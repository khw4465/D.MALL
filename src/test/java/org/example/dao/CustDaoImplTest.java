package org.example.dao;

import org.example.domain.CustDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.validation.constraints.AssertTrue;

import java.text.SimpleDateFormat;
import java.util.Date;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CustDaoImplTest {
    @Autowired
    private CustDao custDao;

    // 일부러 예외 걸어서 터지는지 확인해야함
    @Test
    public void selectUser() throws Exception { // 성공
 //키충돌 예외 발생했을때 성공하는 테스트
        custDao.deleteAll();
        assertTrue(custDao.count()==0);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
        Date date = formatter.parse("2023/07/06");

        CustDto custDto = new CustDto();
        custDto.setCustId("admin");//들어감
        custDto.setPwd("admin123");//들어감
        custDto.setName("문희석");//들어감
        custDto.setMpNo("01012341234"); //들어감
        custDto.setCustTp("1");
        custDto.setGrade("GR01");
        custDto.setStus("정상");
        custDto.setRcmdr("아직"); //들어감
        custDto.setBirth(date);
        custDto.setEmail("aaa@aaa.com");//들어감
        custDto.setRegDate(date);
        custDto.setAcNo("121212-01-121212");
        custDto.setLginDttm(date);
        custDto.setGender("남");
        custDto.setRegn("대한민국");
        custDto.setFstReg(date);
        custDto.setFstRegr("User001");
        custDto.setLastUpd(date);
        custDto.setLastUpdr("User001");

        custDao.insertUser(custDto);
        assertTrue(custDao.count()==1);

        custDto.setCustId("admin1");
        custDto.setPwd("admin123");
        custDto.setName("문희석");
        custDto.setMpNo("01012341234");
        custDto.setCustTp("1");
        custDto.setGrade("GR01");
        custDto.setStus("정상");
        custDto.setRcmdr("아직");
        custDto.setBirth(date);
        custDto.setEmail("aaa@aaa.com");
        custDto.setRegDate(date);
        custDto.setAcNo("121212-01-121212");
        custDto.setLginDttm(date);
        custDto.setGender("남");
        custDto.setRegn("대한민국");
        custDto.setFstReg(date);
        custDto.setFstRegr("User001");
        custDto.setLastUpd(date);
        custDto.setLastUpdr("User001");

        custDao.insertUser(custDto);
        assertTrue(custDao.count()==2);

//        assertTrue(custDao.count()==28);
//        //유저조회
//        custDao.selectUser("asdf");
//        //userDao.selectAll();
//        System.out.println("userDao.count() = " + custDao.count());
//        assertTrue(custDao.count()==28);

        custDto.setCustId("hsm1020s");
        custDto.setPwd("1234");
        custDto.setName("문희석");
        custDto.setMpNo("01012345678");
        custDto.setCustTp("1");
        custDto.setGrade("GR01");
        custDto.setStus("정상");
        custDto.setRcmdr("아직");
        custDto.setBirth(date);
        custDto.setEmail("hsm1020s@naver.com");
        custDto.setRegDate(date);
        custDto.setAcNo("121212-01-121212");
        custDto.setLginDttm(date);
        custDto.setGender("남");
        custDto.setRegn("대한민국");
        custDto.setFstReg(date);
        custDto.setFstRegr("User001");
        custDto.setLastUpd(date);
        custDto.setLastUpdr("User001");

        custDao.insertUser(custDto);
        assertTrue(custDao.count()==3);
    }

    @Test
    public void insertUser() throws Exception{ // 성공
        //custDao.deleteAll();
        assertTrue(custDao.count()==0);

//        //유저등록
//        assertTrue(custDao.count()==28);
//        CustDto custDto = new CustDto();
//        custDto.setCustId("asdf111111");
//        custDto.setPwd("1234");
//        custDto.setName("가나나");
//        custDto.setRcmdr("가가");
//        custDto.setEmail("aaa@aaa.com");
//        custDao.insertUser(custDto);
//        assertTrue(custDao.count()==29);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
        Date date = formatter.parse("2023/07/06");

        CustDto custDto = new CustDto();
        custDto.setCustId("admin");
        custDto.setPwd("admin123");
        custDto.setName("문희석");
        custDto.setMpNo("01012341234");
        custDto.setCustTp("1");
        custDto.setGrade("GR01");
        custDto.setStus("정상");
        custDto.setRcmdr("아직");
        custDto.setBirth(date);
        custDto.setEmail("aaa@aaa.com");
        custDto.setRegDate(date);
        custDto.setAcNo("121212-01-121212");
        custDto.setLginDttm(date);
        custDto.setGender("남");
        custDto.setRegn("대한민국");
        custDto.setFstReg(date);
        custDto.setFstRegr("User001");
        custDto.setLastUpd(date);
        custDto.setLastUpdr("User001");

        custDao.insertUser(custDto);
        assertTrue(custDao.count()==1);
    }

    @Test
    public void deleteUser() throws Exception{ // 성공
        custDao.deleteAll();
        assertTrue(custDao.count()==0);

//        assertTrue(custDao.count()==29);
//        custDao.deleteUser("asdf111111");
//        assertTrue(custDao.count()==28);
    }

    @Test
    public void updateUser() throws Exception{ //성공
        custDao.deleteAll();
        assertTrue(custDao.count()==0);

        //딜 인 비교 같아야함  // 업데이트 비교  // 셀렉트

//        CustDto custDto = new CustDto();
//        custDto.setPwd("h123");
//        custDto.setName("h123");
//        custDto.setMpNo("h123");
//        custDto.setEmail("h123");
//        custDto.setAcNo("h123");
//        custDto.setCustId("asdf19");
//        custDao.updateUser(custDto);
    }

    @Test
    public void selectAllUser() throws Exception { //성공
        int a =10;
        int b =30;
        custDao.deleteAll();
        assertTrue(custDao.count()==0);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
        Date date = formatter.parse("2023/07/06");

        for (int i = a; i < b; i++) {
            CustDto custDto = new CustDto();
            custDto.setCustId("asdf"+i);
            custDto.setPwd("1234");
            custDto.setName("문희석"+i);
            custDto.setMpNo("01012341234");
            custDto.setCustTp("1");
            custDto.setGrade("GR01");
            custDto.setStus("정상");
            custDto.setRcmdr("아직");
            custDto.setBirth(date);
            custDto.setEmail("aaa@aaa.com");
            custDto.setRegDate(date);
            custDto.setAcNo("121212-01-121212");
            custDto.setLginDttm(date);
            custDto.setGender("남");
            custDto.setRegn("대한민국");
            custDto.setFstReg(date);
            custDto.setFstRegr("User001");
            custDto.setLastUpd(date);
            custDto.setLastUpdr("User001");
            custDao.insertUser(custDto);
        }
        System.out.println("custDao.selectAll() = " + custDao.selectAllUser());
        assertTrue(custDao.count()==b-a);

    }

    @Test
    public void deleteAll() throws Exception{ //성공
        assertTrue(custDao.count()==0);
        custDao.deleteAll();
        assertTrue(custDao.count()==0);
    }

    @Test
    public void count() throws Exception { // 성공
        assertTrue(custDao.count()==0);
        custDao.deleteAll();
        assertTrue(custDao.count()==0);
        System.out.println("userDao.count() = " + custDao.count());
    }

    @Test
    public void findid() throws Exception{  // 로직 수정해야함
        // 로직 수정중이라 테스트는 아직 못함.
        custDao.deleteAll();
        assertTrue(custDao.count()==0);

//        CustDto dto = new CustDto();
//        dto.setName("123");
//        dto.setEmail("aaa@aaa.com");
//        // dto에 이름과 이메일 넣으면 findid 동작해서 asdf1 뱉어내야한다
//        System.out.println("userDao.findid(dto) = " + custDao.findid(dto));
    }

    @Test
    public void modifyselect() { // 정보수정할떄 기존의 정보를 미리 보여주는거
      //테스트코드 작성해야함
        // 로직 수정중이라 테스트는 아직 못함.

    }
    @Test
    public void temporaryPwd() {
        // 로직 수정중이라 테스트는 아직 못함.
        // 임시 비밀번호 발급해줄때 정보
        // 7/5일 2시 기준 디비 수정해줘야함.

    }
}