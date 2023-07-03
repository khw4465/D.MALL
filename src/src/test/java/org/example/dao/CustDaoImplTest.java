package org.example.dao;

import org.example.domain.CustDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CustDaoImplTest {
    @Autowired
    private CustDao custDao;

    @Test
    public void selectUser() throws Exception {
        //유저조회
        custDao.selectUser("asdf");
        //userDao.selectAll();
        System.out.println("userDao.count() = " + custDao.count());
    }

    @Test
    public void insertUser() throws Exception{
        //유저등록
        CustDto custDto = new CustDto();
        custDto.setCustId("asdf11111");
        custDto.setPwd("1234");
        custDto.setName("가나나");
        custDto.setRcmdr("가가");
        custDto.setEmail("aaa@aaa.com");
        custDao.insertUser(custDto);
    }

    @Test
    public void deleteUser() throws Exception{
    }

    @Test
    public void updateUser() throws Exception{
        CustDto custDto = new CustDto();

        custDto.setPwd("new_d");
        custDto.setName("new_me");
        custDto.setMpNo("new_o");
        custDto.setEmail("new_l");
        custDto.setAcNo("new_o");
        custDto.setCustId("asdf");
        custDao.updateUser(custDto);
    }

    @Test
    public void selectAll() throws Exception {
        System.out.println("custDao.selectAll() = " + custDao.selectAllUser());
    }

    @Test
    public void deleteAll() throws Exception{
    }

    @Test
    public void count() throws Exception {
        System.out.println("userDao.count() = " + custDao.count());
    }

    @Test
    public void findid() throws Exception{
        CustDto dto = new CustDto();
        dto.setName("123");
        dto.setEmail("aaa@aaa.com");
        // dto에 이름과 이메일 넣으면 findid 동작해서 asdf1 뱉어내야한다
        System.out.println("userDao.findid(dto) = " + custDao.findid(dto));
    }
}