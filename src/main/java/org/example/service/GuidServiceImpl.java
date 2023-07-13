package org.example.service;

import org.example.dao.GuidDAO;
import org.example.domain.guidDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class GuidServiceImpl implements GuidService{
    @Autowired
    GuidDAO guidDAO;

    @Override
    public int getCount(){
        return guidDAO.count();
    }

    @Override
    public int remove(String BBSO_NO){
        return guidDAO.deleteForAdmin(BBSO_NO);
    }

    @Override
    public int write(guidDTO dto){
        return guidDAO.insert(dto);
    }

    @Override
    public List<guidDTO> getList(){
        return guidDAO.selectAll();
    }

    @Override
    public guidDTO read(String BBSO_NO){
        guidDTO dto = guidDAO.select(BBSO_NO);
        return dto;
    }

    @Override
    public List<guidDTO> getPage(Map map){
        return guidDAO.selectPage(map);
    }

    @Override
    public int modify(guidDTO dto){
        return guidDAO.update(dto);
    }
}
