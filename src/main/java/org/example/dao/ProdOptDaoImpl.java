package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.ProdOptDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ProdOptDaoImpl implements ProdOptDao{

    @Autowired
    private SqlSession session;
    private static String namespace = "org.example.dao.ProdOptMapper.";

    @Override
    public ProdOptDto select(Map map) throws Exception {
        return session.selectOne(namespace+"select",map);
    }

    @Override
    public List<ProdOptDto> selectAll() throws Exception {
        return session.selectList(namespace+"selectAll");
    }
    @Override
    public List<ProdOptDto> selectOpt(String prodCd) throws Exception {
        return session.selectList(namespace + "selectOpt", prodCd);
    }
}
