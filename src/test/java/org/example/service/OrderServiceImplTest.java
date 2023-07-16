package org.example.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class OrderServiceImplTest {
    @Autowired
    OrderService orderService;
    @Test
    public void getCust() {
    }

    @Test
    public void getOneAddr() throws Exception{
        System.out.println(orderService.getOneAddr("asdf",1));
        System.out.println(orderService.getOneAddr("asdf",2));
        System.out.println(orderService.getOneAddr("asdf",3));
        System.out.println(orderService.getOneAddr("asdf",4));
        System.out.println(orderService.getOneAddr("asdf",5));
    }

    @Test
    public void getDlvAddr() {
    }

    @Test
    public void addDlvAddr() {
    }

    @Test
    public void modifyDlvAddr() {
    }
}