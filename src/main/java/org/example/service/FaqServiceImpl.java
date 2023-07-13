package org.example.service;

import org.example.dao.FaqDao;
import org.example.domain.FaqDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class FaqServiceImpl implements FaqService {
    @Autowired
    FaqDao faqDao;

    @Override
    public int getCount(){
        return faqDao.count();
    }

    @Override
    public int remove(String bbsoNo){
        return faqDao.deleteForAdmin(bbsoNo);
    }

    @Override
    public int write(FaqDto dto){
        return faqDao.insert(dto);
    }

    @Override
    public FaqDto read(String bbsoNo){
        FaqDto dto = faqDao.select(bbsoNo);
        return dto;
    }

    @Override
    public List<FaqDto> getList(){
        return faqDao.selectAll();
    }

    @Override
    public List<FaqDto> getPage(Map map){
        return faqDao.selectPage(map);
    }

    @Override
    public int modify(FaqDto dto){
        return faqDao.update(dto);
    }

}
