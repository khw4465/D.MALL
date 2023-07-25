package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.CateMainDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CateMainDaoImpl implements CateMainDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "org.example.dao.CateMainMapper.";
    @Override
    public List<String> getCateCd() throws Exception {
        return session.selectList(namespace + "getCateCd");
    }

    @Override
    public List<CateMainDto> selectAll() throws Exception{
        return session.selectList(namespace + "selectAll");
    }
}
