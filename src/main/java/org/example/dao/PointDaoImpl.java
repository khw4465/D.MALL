package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.pointDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class PointDaoImpl implements PointDao{
    @Autowired
    private SqlSession session;

    private static String namespace = "org.example.dao.pointMapper.";

    @Override
    public List<pointDto> select(String id) throws Exception {
        return session.selectList(namespace+"select",id);
    }

    @Override
    public int insert(pointDto pointDto) throws Exception {
        return session.insert(namespace+"insert",pointDto);
    }

    @Override
    public int update(pointDto pointDto) throws Exception {
        return session.update(namespace+"update",pointDto);
    }

    @Override
    public List<pointDto> selectAll() throws Exception {
        return session.selectList(namespace+"selectAll");
    }

    @Override
    public int count(String id) throws Exception {
        return session.selectOne(namespace+"count",id);
    }

    @Override
    public List<pointDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace+"selectPage", map);
    }

    @Override
    public int selectPointId(String id) throws Exception {
        return session.selectOne(namespace+"count",id);
    }


}
