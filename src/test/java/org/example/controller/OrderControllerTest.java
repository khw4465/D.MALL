package org.example.controller;

import org.example.service.CartService;
import org.example.service.OrderListService;
import org.example.service.DlvAddrService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class OrderControllerTest {
    @Autowired
    DlvAddrService dlvAddrService;
    @Autowired
    OrderListService orderListService;
    @Autowired
    CartService cartService;

    @Test
    public void orderList() throws Exception {
        String ordCd = "asdf1234";  // ord.jsp에서 tid를 주문코드로 얻어옴


        orderListService.addOrder(ordCd,"asdf111",1,"dlvMsg");
    }
}