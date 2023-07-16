package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.ProdDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProdDaoImpl implements ProdDao{
    @Autowired
    private SqlSession session;

    private static String namespace="org.example.dao.ProdMapper.";

    @Override
    public ProdDto select(String prodCd) throws Exception {
        return session.selectOne(namespace+"select",prodCd);
    }

    @Override
    public List<ProdDto> selectAll() throws Exception {
        return session.selectList(namespace+"selectAll");
    }

    @Override
    public int insert(ProdDto prodDto) throws Exception {
        return session.insert(namespace+"insert",prodDto);
    }
}
