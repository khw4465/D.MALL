package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.NotcDto;
import org.example.domain.NotcSearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class NotcDaoImpl implements NotcDao {
    @Autowired
    private SqlSession session;

    private String namespace = "org.example.dao.notcMapper.";


    @Override
    public NotcDto select(Integer bbsoNo) throws Exception{
        return session.selectOne(namespace+"select",bbsoNo);
    }

    @Override
    public int count(){
        return session.selectOne(namespace+"count");
    }

    @Override
    public int insert(NotcDto dto) throws Exception{
        return session.insert(namespace+"insert", dto);
    }

    @Override
    public int deleteAll(){
        return session.delete(namespace+"deleteAll");
    }

    @Override
    public int deleteForAdmin(Integer bbsoNo){
        return session.delete(namespace+"deleteForAdmin", bbsoNo);
    }

    @Override
    public int update(NotcDto dto){
        return session.update(namespace+"update", dto);
    }

    @Override
    public List<NotcDto> selectAll(){
        return session.selectList(namespace+"selectAll");
    }

    @Override
    public List<NotcDto> selectPage(Map map){
        return session.selectList(namespace+"selectPage",map);
    }
    @Override
    public int increaseViewCnt(Integer bbsoNo){
        return session.update(namespace+"increaseViewCnt",bbsoNo);
    }

    @Override
    public List<NotcDto> searchSelectPage(NotcSearchCondition sc) throws Exception{
        return session.selectList(namespace + "searchSelectPage", sc);
    }

    @Override
    public int searchResultCnt(NotcSearchCondition sc) throws Exception{
        return session.selectOne(namespace+"searchResultCnt",sc);
    }
}
