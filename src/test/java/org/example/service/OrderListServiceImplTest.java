package org.example.service;

import org.example.domain.OrderDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.time.LocalDate;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class OrderListServiceImplTest {
    @Autowired
    OrderListService orderListService;

    @Test
    public void getOrderTest() throws Exception{
        System.out.println(orderListService.getOrder("order_30","asdfasdf"));
    }
    @Test
    public void getLastOrd() throws Exception {
        System.out.println(orderListService.getLastOrd("asdf"));
    }
    @Test
    public void getOrdMonthTest() throws Exception {
        System.out.println(orderListService.getOrdMonth("asdf",1));   // 회원 asdf가 1달 내에 주문한 건수
//        System.out.println(orderListService.getOrdMonth("asdf", 2)); // 회원 asdf가 2달 내에 주문한 건수
    }
    @Test
    public void getSelDateTest() throws Exception {
        LocalDate date1 = LocalDate.of(2023, 5,1);
        LocalDate date2 = LocalDate.of(2023, 6,1);
        LocalDate date3 = LocalDate.of(2023, 6,8);
        LocalDate date4 = LocalDate.of(2023, 7,8);
        // 회원 asdfasdf가 5월 1일 ~ 6월 1일 내에 주문한 건수
        assertTrue(orderListService.getSelDate("asdfasdf",date1, date2).size() == 0);
        // 회원 asdfasdf가 6월 8일 ~ 7월 8일 내에 주문한 건수
        assertTrue(orderListService.getSelDate("asdfasdf", date3, date4).size() == 1);
    }
//    @Test
//    public void countTest() throws Exception {
//        assertTrue(orderListService.count("asdf") == 12);  // asdf가 주문한 총 건수
//        assertTrue(orderListService.count("asdfasdf") == 1);  // asdfasdf가 주문한 총 건수
//    }
    @Test
    public void addOrderTest() throws Exception {
        // 주문할 때의 정보들 외에 추가 정보를 받아서 OrderDto에 넣고 출력
        orderListService.addOrder("order123", "asdf", 1, "천천히오세요");
        System.out.println(orderListService.getOrder("order123","asdf"));
    }
    @Test
    public void modifyStatusTest() throws Exception {
        // 처음 상태 = 주문완료
        assertTrue(orderListService.getOrder("order_30", "asdfasdf").getOrdStus().equals("주문완료"));
        // 주문상태를 Y(주문확정)으로 변경
        OrderDto dto1 = new OrderDto("Y", "order_30", "asdfasdf");
        assertTrue(orderListService.modifyStatus(dto1) == 1);

        assertTrue(orderListService.getOrder("order_30", "asdfasdf").getOrdStus().equals("주문확정"));

        // 주문상태를 C(취소완료)으로 변경
        OrderDto dto2 = new OrderDto("C", "order_30", "asdfasdf");
        assertTrue(orderListService.modifyStatus(dto2) == 1);

        assertTrue(orderListService.getOrder("order_30", "asdfasdf").getOrdStus().equals("취소완료"));

        // 주문상태를 R(반품신청)으로 변경
        OrderDto dto3 = new OrderDto("R", "order_30", "asdfasdf");
        assertTrue(orderListService.modifyStatus(dto3) == 1);

        assertTrue(orderListService.getOrder("order_30", "asdfasdf").getOrdStus().equals("반품신청"));

        // 주문상태를 N(주문완료)으로 변경
        OrderDto dto4 = new OrderDto("N", "order_30", "asdfasdf");
        assertTrue(orderListService.modifyStatus(dto4) == 1);

        assertTrue(orderListService.getOrder("order_30", "asdfasdf").getOrdStus().equals("주문완료"));
    }
}