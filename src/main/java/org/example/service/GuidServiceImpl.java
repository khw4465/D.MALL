package org.example.service;

import org.example.dao.GuidDao;
import org.example.domain.GuidDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class GuidServiceImpl implements GuidService{
    @Autowired
    GuidDao guidDAO;

    @Override
    public int getCount(){
        return guidDAO.count();
    }

    @Override
    public int remove(String bbsoNo){
        return guidDAO.deleteForAdmin(bbsoNo);
    }

    @Override
    public int write(GuidDto dto){
        return guidDAO.insert(dto);
    }

    @Override
    public List<GuidDto> getList(){
        return guidDAO.selectAll();
    }

    @Override
    public GuidDto read(String bbsoNo){
        GuidDto dto = guidDAO.select(bbsoNo);
        return dto;
    }

    @Override
    public List<GuidDto> getPage(Map map){
        return guidDAO.selectPage(map);
    }

    @Override
    public int modify(GuidDto dto){
        return guidDAO.update(dto);
    }
}
