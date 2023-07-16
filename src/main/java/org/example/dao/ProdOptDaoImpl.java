package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.ProdCateDto;
import org.example.domain.ProdDcDto;
import org.example.domain.ProdOptDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProdOptDaoImpl implements ProdOptDao{

    @Autowired
    private SqlSession session;
    private static String namespace = "org.example.dao.ProdOptMapper.";

    @Override
    public ProdOptDto select(String optCd) throws Exception {
        return session.selectOne(namespace+"select",optCd);
    }

    @Override
    public List<ProdOptDto> selectAll() throws Exception {
        return session.selectList(namespace+"selectAll");
    }
}
