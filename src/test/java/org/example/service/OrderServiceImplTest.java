package org.example.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.time.LocalDate;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class OrderServiceImplTest {
    @Autowired
    OrderService orderService;

    @Test
    public void getOrderTest() throws Exception{
        System.out.println(orderService.getOrder("order_30","asdfasdf"));
    }
    @Test
    public void getOrdMonthTest() throws Exception {
        assertTrue(orderService.getOrdMonth("asdf",1).size() == 0);   // 회원 asdf가 1달 내에 주문한 건수
        assertTrue(orderService.getOrdMonth("asdf", 2).size() == 12); // 회원 asdf가 2달 내에 주문한 건수
    }
    @Test
    public void getSelDateTest() throws Exception {
        LocalDate date1 = LocalDate.of(2023, 5,1);
        LocalDate date2 = LocalDate.of(2023, 6,1);
        LocalDate date3 = LocalDate.of(2023, 6,8);
        LocalDate date4 = LocalDate.of(2023, 7,8);
        // 회원 asdfasdf가 5월 1일 ~ 6월 1일 내에 주문한 건수
        assertTrue(orderService.getSelDate("asdfasdf",date1, date2).size() == 0);
        // 회원 asdfasdf가 6월 8일 ~ 7월 8일 내에 주문한 건수
        assertTrue(orderService.getSelDate("asdfasdf", date3, date4).size() == 1);
    }
    @Test
    public void countTest() throws Exception {
        assertTrue(orderService.count("asdf") == 12);  // asdf가 주문한 총 건수
        assertTrue(orderService.count("asdfasdf") == 1);  // asdfasdf가 주문한 총 건수
    }
    @Test
    public void addOrderTest() throws Exception {

    }
    @Test
    public void modifyStatusTest() throws Exception {

    }
}