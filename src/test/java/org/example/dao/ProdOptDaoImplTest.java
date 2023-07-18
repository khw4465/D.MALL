package org.example.dao;

import org.example.domain.OrderDto;
import org.example.domain.ProdOptDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ProdOptDaoImplTest {
    @Autowired
    ProdOptDao prodOptDao;

    @Test
    public void select() throws Exception {
        Map map = new HashMap<>();
        map.put("prodCd", "P010101");
        map.put("optCd", "2");
        System.out.println("prodOptDao.select(\"1\") = " + prodOptDao.select(map));
    }

    @Test
    public void selectAll() throws Exception {
        System.out.println("prodOptDao.selectAll() = " + prodOptDao.selectAll());
    }
    @Test
    public void selectOpt() throws Exception {
        List<ProdOptDto> dto = prodOptDao.selectOpt("P010101");
        System.out.println(dto.get(0).getOptName() + "," + dto.get(1).getOptName() + "," + dto.get(2).getOptName());
    }
}