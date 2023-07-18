package org.example.dao;

import org.example.domain.ProdDto;
import org.example.domain.ProdImgDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.SimpleDateFormat;
import java.util.Date;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ProdImgDaoImplTest {

    @Autowired
    ProdImgDao prodImgDao;

    @Test
    public void select()throws Exception {
        System.out.println("prodImgDao.select(\"1\") = " + prodImgDao.select("1"));
    }

    @Test
    public void selectAll() throws Exception {
        System.out.println("prodImgDao.selectAll() = " + prodImgDao.selectAll());
    }

//    @Test
//    public void insert() throws Exception {
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        Date date = sdf.parse("2023-07-15");
//
//        ProdImgDto prodImgDto = new ProdImgDto("111","101","추","닭가슴살추가이미지","webapp/resources/img",800,600,"jpg",480000,"Y","Y","비고",date,"User002",date,"User002");
//        prodImgDao.insert(prodImgDto);
//    }

    @Test
    public void selectImage() throws Exception {
        System.out.println(prodImgDao.selectImage("P010202"));
    }
}