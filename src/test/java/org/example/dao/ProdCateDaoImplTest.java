package org.example.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ProdCateDaoImplTest {
    @Autowired
    ProdCateDao prodCateDao;

    @Test
    public void select() throws Exception{
        System.out.println("prodCateDao.select(101) = " + prodCateDao.select(101));
    }

    @Test
    public void selectAll() throws Exception{
        System.out.println("prodCateDao.selectAll() = " + prodCateDao.selectAll());
    }

    @Test
    public void getCateCd() throws Exception {
        System.out.println(prodCateDao.getCateCd());
    }
    @Test
    public void getMainCate() throws Exception{
        System.out.println("prodCate = "+prodCateDao.getMainCate());
    }
}