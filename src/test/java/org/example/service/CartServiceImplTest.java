package org.example.service;

import org.example.dao.CartOptDao;
import org.example.domain.CartOptDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CartServiceImplTest {
    @Autowired
    CartService cartService;
    @Autowired
    CartOptDao cartOptDao;
    @Test
    public void getCartList() throws Exception {
        System.out.println(cartService.getCartList("asdf"));
    }

    @Test
    public void getAllOptList() throws Exception {
        System.out.println(cartService.getAllOptList("asdf"));
    }

    @Test
    public void addCart() throws Exception {
        cartService.removeAll("asdf");

        List<CartOptDto> list1 = new ArrayList<>();
        List<CartOptDto> list2 = new ArrayList<>();
        List<CartOptDto> list3 = new ArrayList<>();
        List<CartOptDto> list4 = new ArrayList<>();
        CartOptDto dto1 = new CartOptDto("asdf","P010101","맛있닭 프로 닭가슴살 120g","1","10팩",1,10000);
        CartOptDto dto2 = new CartOptDto("asdf","P010101","맛있닭 프로 닭가슴살 120g","2","30팩",1,30000);
        CartOptDto dto3 = new CartOptDto("asdf","P010101","맛있닭 프로 닭가슴살 120g","3","50팩",1,50000);
        list1.add(dto1);
        list1.add(dto2);
        list1.add(dto3);
        cartService.addCart("asdf", list1);

        CartOptDto dto4 = new CartOptDto("asdf","P010102","맛있닭 저염·프로 닭가슴살 혼합 100~120g","1","10팩",1,10000);
        CartOptDto dto5 = new CartOptDto("asdf","P010102","맛있닭 저염·프로 닭가슴살 혼합 100~120g","2","30팩",1,30000);
        CartOptDto dto6 = new CartOptDto("asdf","P010102","맛있닭 저염·프로 닭가슴살 혼합 100~120g","3","50팩",1,50000);
        list2.add(dto4);
        list2.add(dto5);
        list2.add(dto6);
        cartService.addCart("asdf", list2);

        CartOptDto dto7 = new CartOptDto("asdf","P010201","맛있닭 닭가슴살 스테이크 오리지널 100g","1","10팩",1,10000);
        CartOptDto dto8 = new CartOptDto("asdf","P010201","맛있닭 닭가슴살 스테이크 오리지널 100g","2","30팩",1,30000);
        CartOptDto dto9 = new CartOptDto("asdf","P010201","맛있닭 닭가슴살 스테이크 오리지널 100g","3","50팩",1,50000);
        list3.add(dto7);
        list3.add(dto8);
        list3.add(dto9);
        cartService.addCart("asdf", list3);

        CartOptDto dto10 = new CartOptDto("asdf","P010202","맛있닭 닭가슴살 스테이크 갈릭맛 100g","1","10팩",1,10000);
        CartOptDto dto11 = new CartOptDto("asdf","P010202","맛있닭 닭가슴살 스테이크 갈릭맛 100g","2","30팩",1,30000);
        CartOptDto dto12 = new CartOptDto("asdf","P010202","맛있닭 닭가슴살 스테이크 갈릭맛 100g","3","50팩",1,50000);
        list4.add(dto10);
        list4.add(dto11);
        list4.add(dto12);
        cartService.addCart("asdf", list4);

        cartService.getAllOptList("asdf");
    }

    @Test
    public void removeOpt() throws Exception {
        cartService.removeOpt("asdf","P010101", "3");
        cartService.removeOpt("asdf","P010102", "3");
        cartService.removeOpt("asdf","P010201", "3");
        cartService.removeOpt("asdf","P010202", "3");

        System.out.println("전체" + cartService.getAllOptList("asdf"));

        System.out.println("1번" + cartOptDao.summeryOpt("asdf", "P010101"));
        System.out.println("2번" + cartOptDao.summeryOpt("asdf", "P010102"));
        System.out.println("3번" + cartOptDao.summeryOpt("asdf", "P010201"));
        System.out.println("4번" + cartOptDao.summeryOpt("asdf", "P010202"));
    }

    @Test
    public void removeProd() throws Exception {
    }

    @Test
    public void removeAll() throws Exception {
        cartService.removeAll("asdf");
    }

    @Test
    public void modifyQty() throws Exception {
        cartService.modifyQty(5,50000,"asdf","P010101","1");

        System.out.println();
        System.out.println(cartService.getAllOptList("asdf"));
        System.out.println();
        System.out.println(cartService.getCartList("asdf"));
    }

    @Test
    public void getOrdHist() throws Exception {
        System.out.println(cartService.getOrdHist("asdf"));
    }
}