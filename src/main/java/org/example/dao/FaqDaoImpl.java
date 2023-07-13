package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.FaqDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("faqDAO")
public class FaqDaoImpl implements FaqDao {
    @Autowired
    SqlSession session;

    private String namespace = "org.example.dao.faqMapper.";

    @Override
    public FaqDto select(String bbsoNo){
        return session.selectOne(namespace+"select",bbsoNo);
    }
    @Override
    public int count(){
        return session.selectOne(namespace+"count");
    }
    @Override
    public int insert(FaqDto dto) {
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
    public List<FaqDto> selectAll(){
        return session.selectList(namespace+"selectAll");
    }
    @Override
    public List<FaqDto> selectPage(Map map){
        return session.selectList(namespace+"selectPage",map);
    }
    @Override
    public int update(FaqDto dto){
        return session.update(namespace+"update", dto);
    }
}
