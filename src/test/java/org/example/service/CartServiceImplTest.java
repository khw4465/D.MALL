package org.example.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CartServiceImplTest {

    @Autowired
    CartService cartService;
    @Test
    public void getCartList() throws Exception {

        System.out.println(cartService.getCartList("asdf"));
    }

    @Test
    public void remove() throws Exception {
        System.out.println(cartService.remove("asdf", "P00101"));
    }

    @Test
    public void removeAll() throws Exception {
        System.out.println(cartService.removeAll("asdf"));
    }

//    @Test
//    public void increaseQty() throws Exception {
//        System.out.println(cartService.increaseQty("asdf","P00101", 1));
//    }
//
//    @Test
//    public void decreaseQty() throws Exception {
//        System.out.println(cartService.decreaseQty("asdf","P00101", -1));
//    }
}