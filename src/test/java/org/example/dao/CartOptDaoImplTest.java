package org.example.dao;

import org.example.domain.CartOptDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CartOptDaoImplTest {
    @Autowired
    CartOptDao cartOptDao;
    @Test
    public void select() throws Exception {
//        System.out.println(cartOptDao.select("asdf", "P010101", "2"));
    }

    @Test
    public void selectProd() throws Exception {
        System.out.println(cartOptDao.selectProd("asdf", "P010202"));
    }

    @Test
    public void selectAll() throws Exception {
        System.out.println(cartOptDao.selectAll("asdf"));
    }

    @Test
    public void count() throws Exception {
        System.out.println(cartOptDao.count("asdf"));
    }

    @Test
    public void countProd() throws Exception {
        System.out.println(cartOptDao.countProd("asdf"));
    }

    @Test
    public void insert() throws Exception {
        cartOptDao.deleteAll("asdf");

        List<CartOptDto> list = new ArrayList<>();
        list.add(new CartOptDto("asdf","P010101","맛있닭 프로 닭가슴살 120g","1","10팩",1,10000));
        list.add(new CartOptDto("asdf","P010101","맛있닭 프로 닭가슴살 120g","2","30팩",1,30000));
        list.add(new CartOptDto("asdf","P010101","맛있닭 프로 닭가슴살 120g","3","50팩",1,50000));
        list.add(new CartOptDto("asdf","P010102","맛있닭 저염·프로 닭가슴살 혼합 100~120g","1","10팩",1,10000));
        list.add(new CartOptDto("asdf","P010102","맛있닭 저염·프로 닭가슴살 혼합 100~120g","2","30팩",1,30000));
        list.add(new CartOptDto("asdf","P010102","맛있닭 저염·프로 닭가슴살 혼합 100~120g","3","50팩",1,50000));
        list.add(new CartOptDto("asdf","P010201","맛있닭 닭가슴살 스테이크 오리지널 100g","1","10팩",1,10000));
        list.add(new CartOptDto("asdf","P010201","맛있닭 닭가슴살 스테이크 오리지널 100g","2","30팩",1,30000));
        list.add(new CartOptDto("asdf","P010201","맛있닭 닭가슴살 스테이크 오리지널 100g","3","50팩",1,50000));
        list.add(new CartOptDto("asdf","P010202","맛있닭 닭가슴살 스테이크 갈릭맛 100g","1","10팩",1,10000));
        list.add(new CartOptDto("asdf","P010202","맛있닭 닭가슴살 스테이크 갈릭맛 100g","2","30팩",1,30000));
        list.add(new CartOptDto("asdf","P010202","맛있닭 닭가슴살 스테이크 갈릭맛 100g","3","50팩",1,50000));
        list.add(new CartOptDto("asdf","P010301","맛있닭 스팀 닭가슴살 오리지널 100g","1","10팩",1,10000));
        list.add(new CartOptDto("asdf","P010301","맛있닭 스팀 닭가슴살 오리지널 100g","2","30팩",1,30000));
        list.add(new CartOptDto("asdf","P010301","맛있닭 스팀 닭가슴살 오리지널 100g","3","50팩",1,50000));
        list.add(new CartOptDto("asdf","P010302","맛있닭 스팀 닭가슴살 마늘맛 100g","1","10팩",1,10000));
        list.add(new CartOptDto("asdf","P010302","맛있닭 스팀 닭가슴살 마늘맛 100g","2","30팩",1,30000));
        list.add(new CartOptDto("asdf","P010302","맛있닭 스팀 닭가슴살 마늘맛 100g","3","50팩",1,50000));
        for (CartOptDto item : list) {
            cartOptDao.insert(item);
        }
    }

    @Test
    public void delete() throws Exception {

    }

    @Test
    public void deleteProd() throws Exception {
    }

    @Test
    public void deleteAll() throws Exception {
        cartOptDao.deleteAll("asdf");
    }

    @Test
    public void update() throws Exception {
    }

    @Test
    public void summeryOpt() throws Exception {
        System.out.println(cartOptDao.summeryOpt("asdf", "P010301"));
    }
}