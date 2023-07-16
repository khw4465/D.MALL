package org.example.dao;

import org.example.domain.CartDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CartDaoImplTest {
    @Autowired
    private CartDao cartDao;
    @Test
    public void selectTest() throws Exception {
        // 전체삭제
        cartDao.deleteAll("asdf");
        // asdf 장바구니에 상품 P00101 추가
        CartDto dto = new CartDto("asdf", "P00101","맛있닭 프로 닭가슴살 120g", 1, 2000);
        cartDao.insert(dto);
        // asdf 장바구니에 상품 P00102 추가
        CartDto dto2 = new CartDto("asdf", "P00102","맛있닭 저염·프로 닭가슴살 혼합 100~120g", 1, 3000);
        cartDao.insert(dto2);

        System.out.println(cartDao.select("asdf", "P00101"));
        System.out.println(cartDao.select("asdf", "P00102"));

    }

    @Test
    public void selectAllTest() throws Exception {
        // 전체삭제
        cartDao.deleteAll("asdf");

        // asdf에 상품 4개 추가
        CartDto dto1 = new CartDto("asdf", "P00101","맛있닭 프로 닭가슴살 120g", 1, 2000);
        CartDto dto2 = new CartDto("asdf", "P00102","맛있닭 저염·프로 닭가슴살 혼합 100~120g", 1, 3000);
        CartDto dto3 = new CartDto("asdf", "P00201","맛있닭 닭가슴살 스테이크 오리지널 100g ", 1, 2000);
        CartDto dto4 = new CartDto("asdf", "P00202","맛있닭 닭가슴살 스테이크 갈릭맛 100g", 1, 3000);
        //중복상품 추가
//        CartDto dto5 = new CartDto("asdf", "P00101","맛있닭 프로 닭가슴살 120g", 1, 2000);
        cartDao.insert(dto1);
        cartDao.insert(dto2);
        cartDao.insert(dto3);
        cartDao.insert(dto4);
//        cartDao.insert(dto5);

        assertTrue(cartDao.count("asdf") == 5);
        System.out.println(cartDao.selectAll("asdf"));
    }

    @Test
    public void countTest() throws Exception {
        // 전체삭제
        cartDao.deleteAll("asdf");

        assertTrue(cartDao.count("asdf") == 0);

        // 1개 추가
        CartDto dto1 = new CartDto("asdf", "P00101","맛있닭 프로 닭가슴살 120g", 1, 2000);
        cartDao.insert(dto1);

        assertTrue(cartDao.count("asdf") == 1);

        // 1개 더 추가
        CartDto dto2 = new CartDto("asdf", "P00102","맛있닭 저염·프로 닭가슴살 혼합 100~120g", 1, 3000);
        cartDao.insert(dto2);

        assertTrue(cartDao.count("asdf") == 2);

        // 1개 삭제
        Map<String, String> map = new HashMap<>();
        map.put("custId", "asdf");
        map.put("prodCd", "P00102");
        cartDao.delete(map);

        assertTrue(cartDao.count("asdf") == 1);
    }

    @Test
    public void insertTest() throws Exception {
        // 전체삭제
        cartDao.deleteAll("asdf");

        // 4개 상품 추가할때마다 검사
        CartDto dto1 = new CartDto("asdf", "P00101","맛있닭 프로 닭가슴살 120g", 1, 2000);
        CartDto dto2 = new CartDto("asdf", "P00102","맛있닭 저염·프로 닭가슴살 혼합 100~120g", 1, 3000);
        CartDto dto3 = new CartDto("asdf", "P00201","맛있닭 닭가슴살 스테이크 오리지널 100g ", 1, 2000);
        CartDto dto4 = new CartDto("asdf", "P00202","맛있닭 닭가슴살 스테이크 갈릭맛 100g", 1, 3000);
        assertTrue(cartDao.insert(dto1) == 1);
        assertTrue(cartDao.insert(dto2) == 1);
        assertTrue(cartDao.insert(dto3) == 1);
        assertTrue(cartDao.insert(dto4) == 1);

        // 최종 카운트 검사
        assertTrue(cartDao.count("asdf") == 4);
    }

    @Test
    public void deleteTest() throws Exception {
        // 전체삭제
        cartDao.deleteAll("asdf");
        // 상품 2개 추가
        CartDto dto1 = new CartDto("asdf", "P00101","맛있닭 프로 닭가슴살 120g", 1, 2000);
        CartDto dto2 = new CartDto("asdf", "P00102","맛있닭 저염·프로 닭가슴살 혼합 100~120g", 1, 3000);
        assertTrue(cartDao.insert(dto1) == 1);
        assertTrue(cartDao.insert(dto2) == 1);

        // 추가 후 개수 카운트
        assertTrue(cartDao.count("asdf") == 2);
        // P00101 삭제
        Map<String, String> map1 = new HashMap<>();
        map1.put("custId", "asdf");
        map1.put("prodCd", "P00101");
        assertTrue(cartDao.delete(map1) == 1);
        // 삭제 후 개수 카운트
        assertTrue(cartDao.count("asdf") == 1);
        // P00102 삭제
        Map<String, String> map2 = new HashMap<>();
        map2.put("custId", "asdf");
        map2.put("prodCd", "P00102");
        assertTrue(cartDao.delete(map2) == 1);
        // 두개 다 삭제 후 카운트
        assertTrue(cartDao.count("asdf") == 0);
    }

    @Test
    public void deleteAllTest() throws Exception {
        // 전체삭제
        cartDao.deleteAll("asdf");

        // 전체삭제 확인을 위해 상품을 넣어준다
        CartDto dto1 = new CartDto("asdf", "P00101","맛있닭 프로 닭가슴살 120g", 1, 2000);
        CartDto dto2 = new CartDto("asdf", "P00102","맛있닭 저염·프로 닭가슴살 혼합 100~120g", 1, 3000);
        assertTrue(cartDao.insert(dto1) == 1);
        assertTrue(cartDao.insert(dto2) == 1);

        // 카운트
        assertTrue(cartDao.count("asdf") == 2);
        // 전체삭제
        assertTrue(cartDao.deleteAll("asdf") == 2);
        // 전체삭제 후 0개
        assertTrue(cartDao.count("asdf") == 0);
    }

//    @Test
//    public void increaseTest() throws Exception {
//        // 전체삭제
//        cartDao.deleteAll("asdf");
//        // prodQty(상품의 개수)를 1개로 설정하고 상품을 추가해준다
//        CartDto dto1 = new CartDto("asdf", "P00101","맛있닭 프로 닭가슴살 120g", 1, 2000);
//        assertTrue(cartDao.insert(dto1) == 1);
//
//        // 상품의 개수를 getProdQty()로 가져온다.
//        CartDto prod1 = cartDao.select("asdf", "P00101");
//        assertTrue(prod1.getProdQty() == 1);
//
//        // 상품을 map에 담아 개수를 1 증가시킴
//        Map<String, String> map = new HashMap<>();
//        map.put("custId", "asdf");
//        map.put("prodCd", "P00101");
//        assertTrue(cartDao.increase(map) == 1);     // 성공하면 1 반환
//
//        // 상품의 개수를 다시 조회
//        CartDto prod2 = cartDao.select("asdf", "P00101");
//        assertTrue(prod2.getProdQty() == 2);
//    }
//
//    @Test
//    public void decreaseTest() throws Exception {
//        // 전체삭제
//        cartDao.deleteAll("asdf");
//        // prodQty(상품의 개수)를 1개로 설정하고 상품을 추가해준다
//        CartDto dto1 = new CartDto("asdf", "P00101","맛있닭 프로 닭가슴살 120g", 1, 2000);
//        assertTrue(cartDao.insert(dto1) == 1);
//
//        // 상품의 개수를 getProdQty()로 가져온다.
//        CartDto prod1 = cartDao.select("asdf", "P00101");
//        assertTrue(prod1.getProdQty() == 1);
//
//        // 상품을 map에 담아 개수를 1 증가시킴
//        Map<String, String> map1 = new HashMap<>();
//        map1.put("custId", "asdf");
//        map1.put("prodCd", "P00101");
//        assertTrue(cartDao.increase(map1) == 1);     // 성공하면 1 반환
//
//        // 상품의 개수를 다시 조회
//        CartDto prod2 = cartDao.select("asdf", "P00101");
//        assertTrue(prod2.getProdQty() == 2);
//
//        // 상품의 개수를 1 감소시킴
//        Map<String, String> map2 = new HashMap<>();
//        map2.put("custId", "asdf");
//        map2.put("prodCd", "P00101");
//        assertTrue(cartDao.decrease(map2) == 1);    // 성공시 1 반환
//        // 개수를 다시 조회
//        CartDto prod3 = cartDao.select("asdf", "P00101");
//        assertTrue(prod3.getProdQty() == 1);
//    }
    @Test
    public void getHistTest() throws Exception{
        // asdf가 장바구니에 있는 물건들을 구매 한 후의 예상주문내역
        System.out.println(cartDao.ordHist("asdf"));
    }
}