package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.GuidDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("guidDAO")
public class GuidDaoImpl implements GuidDao {
    @Autowired
    SqlSession session;

    private String namespace = "org.example.dao.guidMapper.";

    @Override
    public GuidDto select(String bbsoNo){
        return session.selectOne(namespace+"select",bbsoNo);
    }

    @Override
    public int count(){
        return session.selectOne(namespace+"count");
    }

    @Override
    public int insert(GuidDto dto){
        return session.insert(namespace+"insert",dto);
    }

    @Override
    public int deleteAll(){
        return session.delete(namespace+"deleteAll");
    }

    @Override
    public int deleteForAdmin(String bbsoNo){
        Map map = new HashMap();
        map.put("bbsoNo", bbsoNo);
        return session.delete(namespace+"delete",map);
    }

    @Override
    public List<GuidDto> selectAll(){
        return session.selectList(namespace+"selectAll");
    }

    @Override
    public List<GuidDto> selectPage(Map map){
        return session.selectList(namespace+"selectPage",map);
    }

    @Override
    public int update(GuidDto dto){
        return session.update(namespace+"update", dto);
    }

}
