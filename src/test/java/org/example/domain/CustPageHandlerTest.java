package org.example.domain;

import org.example.dao.PointDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CustPageHandlerTest {

    @Autowired
    PointDao pointDao;


    @Test
    public void Test(){
        CustPageHandler ph = new CustPageHandler(250,1);
        ph.print();
        System.out.println("ph = " + ph);
        ph.getBeginPage();
        ph.getEndPage();
    }

    @Test
    public void Tes1t(){
        CustPageHandler ph = new CustPageHandler(250,11);
        ph.print();
        System.out.println("ph = " + ph);
        ph.getBeginPage();
        ph.getEndPage();
    }

}