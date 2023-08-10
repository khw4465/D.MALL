package org.example.service;

import org.example.dao.NotcDao;
import org.example.domain.NotcDto;
import org.example.domain.NotcSearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class NotcServiceImpl implements NotcService {
    @Autowired
    NotcDao notcDao;

    @Override
    public int getCount(){
        return notcDao.count();
    }

    @Override
    public int remove(Integer bbsoNo){
        return notcDao.deleteForAdmin(bbsoNo);
    }

    @Override
    public int write(NotcDto dto) throws Exception{
        return notcDao.insert(dto);
    }

    @Override
    public List<NotcDto> getList() throws Exception{
        return notcDao.selectAll();
    }

    @Override
    public NotcDto read(Integer bbsoNo) throws Exception{
        NotcDto dto = notcDao.select(bbsoNo);
        notcDao.increaseViewCnt(bbsoNo);
        return dto;
    }

    @Override
    public List<NotcDto> getPage(Map map){
        return notcDao.selectPage(map);
    }

    @Override
    public int modify(NotcDto dto){
        return notcDao.update(dto);
    }

    @Override
    public List<NotcDto> getSearchResultPage(NotcSearchCondition sc) throws Exception{
        return notcDao.searchSelectPage(sc);
    }

    @Override
    public int getSearchResultCnt(NotcSearchCondition sc) throws Exception{
        return notcDao.searchResultCnt(sc);
    }
}
