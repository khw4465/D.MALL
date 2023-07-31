package org.example.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class DlvAddrServiceImplTest {
    @Autowired
    DlvAddrService dlvAddrService;
    @Test
    public void getCust() throws Exception{
        System.out.println(dlvAddrService.getCust("asdf"));
    }

    @Test
    public void getOneAddr() throws Exception{
        System.out.println(dlvAddrService.getOneAddr("asdf",1));
        System.out.println(dlvAddrService.getOneAddr("asdf",2));
        System.out.println(dlvAddrService.getOneAddr("asdf",3));
        System.out.println(dlvAddrService.getOneAddr("asdf",4));
        System.out.println(dlvAddrService.getOneAddr("asdf",5));
    }
    @Test
    public void getCnt() throws Exception {
        System.out.println(dlvAddrService.getDlvCnt("asdf"));
    }
    @Test
    public void getDlvAddr() throws Exception {
        System.out.println(dlvAddrService.getDlvAddr("asdf"));
    }

    @Test
    public void addDlvAddr() {
    }

    @Test
    public void modifyDlvAddr() {
    }
}