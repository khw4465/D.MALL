package org.example.service;

import org.example.dao.faqDAO;
import org.example.domain.faqDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class faqServiceImpl implements faqService {
    @Autowired
    faqDAO faqDao;

    @Override
    public int getCount(){
        return faqDao.count();
    }

    @Override
    public int remove(String BBSO_NO){
        return faqDao.deleteForAdmin(BBSO_NO);
    }

    @Override
    public int write(faqDTO dto){
        return faqDao.insert(dto);
    }

    @Override
    public faqDTO read(String BBSO_NO){
        faqDTO dto = faqDao.select(BBSO_NO);
        return dto;
    }

    @Override
    public List<faqDTO> getList(){
        return faqDao.selectAll();
    }

    @Override
    public List<faqDTO> getPage(Map map){
        return faqDao.selectPage(map);
    }

    @Override
    public int modify(faqDTO dto){
        return faqDao.update(dto);
    }

}
