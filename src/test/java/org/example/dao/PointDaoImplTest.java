package org.example.dao;

import org.example.domain.pointDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.time.LocalDateTime;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class PointDaoImplTest {

    @Autowired
    private PointDao pointDao;

    @Test
    public void select() throws Exception{
        //System.out.println("pointDao.select(\"asdf\") = " + pointDao.select(1));
    }

    @Test
    public void insert() throws Exception{

//        pointDto point = new pointDto();
//        for (int i = 13; i <219 ; i++) {
//            point.setPntId(i);
//            point.setCustId("asdf");
//            point.setStus("적립");
//            point.setChngPnt(100);
//            point.setPoint(pointDao.selectPointId(String.valueOf((i-1)))+100);
//            point.setDttm(LocalDateTime.now());
//            point.setExpiDttm(LocalDateTime.now().plusDays(5));
//            point.setChgCn("로그인 축하");
//            point.setPntCd("1"); //포인트 사유코드
//            pointDao.insert(point);
//        }
        System.out.println("\"hello\" = " + "hello");
        pointDto point = new pointDto();
        for (int i = 234; i <235 ; i++) {
            point.setPntId(i);
            point.setCustId("admin");
            point.setStus("적립");
            point.setChngPnt(100);
            point.setPoint(pointDao.selectPointId(String.valueOf((i-1)))+100);
            point.setDttm(LocalDateTime.now());
            point.setExpiDttm(LocalDateTime.now().plusDays(5));
            point.setChgCn("로그인 축하");
            point.setPntCd("1"); //포인트 사유코드
            pointDao.insert(point);
        }

    }

    @Test
    public void update() throws Exception{
        pointDto point = new pointDto();
        point.setPntId(12);
        point.setCustId("asdf");
        point.setStus("적립1");
        point.setChngPnt(100);
        point.setPoint(1000);
        point.setDttm(LocalDateTime.now());
        point.setExpiDttm(LocalDateTime.now().plusDays(5));
        point.setChgCn("로그인 축하");
        point.setRemark("Some remarks");
        point.setPntCd("1"); // 포인트 사유코드
        pointDao.update(point);

    }

    @Test
    public void selectAll() throws Exception{
        System.out.println("pointDao.selectAll() = " + pointDao.selectAll());
    }

    @Test
    public void count() throws Exception {
        System.out.println("PointDao.count() = " + pointDao.count("asdf"));
    }
}