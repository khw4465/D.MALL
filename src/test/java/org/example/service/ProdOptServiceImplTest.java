package org.example.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ProdOptServiceImplTest {
    @Autowired
    ProdOptService prodOptService;
    @Test
    public void getOpt() throws Exception {
        System.out.println(prodOptService.getOpt("P010101", "1"));
    }

    @Test
    public void getOptList() throws Exception {
        System.out.println(prodOptService.getOptList("P010202"));
    }
}