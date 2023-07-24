package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.CustStatsDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustStatsDaoImpl implements CustStatsDao{
    @Autowired
    private SqlSession session;
    private static String namespace = "org.example.dao.custStatsMapper.";

    @Override
    public List<CustStatsDto> selectStats() throws Exception {
        return session.selectList(namespace+"stats");
    }
}
