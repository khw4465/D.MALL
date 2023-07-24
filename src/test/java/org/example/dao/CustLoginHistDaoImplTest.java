package org.example.dao;

import org.example.domain.LoginHistoryDTO;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.time.LocalDateTime;
import java.util.*;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CustLoginHistDaoImplTest {

    @Autowired
    private CustLoginHistDao custLoginHistDao;

    // 로그인 기록 만들기 테스트용 DTO
    private LoginHistoryDTO createMockLoginHistoryDTO() {
        LoginHistoryDTO mockLoginHistoryDTO = new LoginHistoryDTO();
        mockLoginHistoryDTO.setLginHistId("TestID");
        mockLoginHistoryDTO.setCustId("TestCustID");
        mockLoginHistoryDTO.setDttm(LocalDateTime.now());

        mockLoginHistoryDTO.setFailCaus(null);

        mockLoginHistoryDTO.setFailCnt(1);

        return mockLoginHistoryDTO;
    }

    @Test
    public void selectLoginHistory()throws Exception {
        LoginHistoryDTO dto = new LoginHistoryDTO();

        System.out.println("custLoginHistDao.selectLoginHistory(\"asdf\") = " + custLoginHistDao.select("asdf"));
    }

    @Test
    public void insertLoginHistory()throws Exception {
        LoginHistoryDTO mockLoginHistoryDTO = createMockLoginHistoryDTO();
        int result = custLoginHistDao.insert(mockLoginHistoryDTO);
        Assert.assertEquals(1, result);
    }

    @Test
    public void selectAllLoginHistory()throws Exception {
        System.out.println("custLoginHistDao.selectAllLoginHistory() = " + custLoginHistDao.selectAll());
    }

    @Test
    public void countLoginHistory() throws Exception {
        System.out.println("custLoginHistDao.countLoginHistory() = " + custLoginHistDao.count("asdf"));
    }

    @Test
    public void resetFailCount() throws Exception{
        LoginHistoryDTO dto = createMockLoginHistoryDTO();
        System.out.println("dto = " + dto);
        System.out.println("dto.getCustId() = " + dto.getCustId());
        custLoginHistDao.insert(dto);
        System.out.println("custLoginHistDao.FailCountSelect(dto) = " + custLoginHistDao.FailCountSelect(dto.getCustId()));


        System.out.println("custLoginHistDao.FailCountUpdate(dto) = " + custLoginHistDao.FailCountUpdate(dto));

    }


}