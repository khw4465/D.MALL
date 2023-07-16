package org.example.dao;

import org.example.domain.ProdDto;
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
public class ProdDaoImplTest {
    @Autowired
    ProdDao prodDao;

    @Test
    public void select() throws Exception {
        System.out.println("prodDao.select(\"10101\") = " + prodDao.select("10101"));
    }

    @Test
    public void selectAll() throws Exception {
        System.out.println("prodDao.selectAll() = " + prodDao.selectAll());
    }

    @Test
    public void insert() throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = sdf.parse("2023-07-15");
        ProdDto prodDto = new ProdDto("P020107", 202, "02", "차", "어쩌구", "저쩌구", 3000, "100", (float)3.5, "10", "Y", 100, "Y", "Y", "Y", "Y", 1, date, date, date, date, "비고", date, "User001", date, "User001");
        prodDao.insert(prodDto);
    }
}