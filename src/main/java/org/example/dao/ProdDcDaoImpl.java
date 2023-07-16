package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.ProdCateDto;
import org.example.domain.ProdDcDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProdDcDaoImpl implements ProdDcDao{
    @Autowired
    private SqlSession session;

    private static String namespace = "org.example.dao.ProdDcMapper.";

    @Override
    public ProdDcDto select(String dcCd) throws Exception {
        return session.selectOne(namespace+"select",dcCd);
    }

    @Override
    public List<ProdDcDto> selectAll() throws Exception {
        return session.selectList(namespace+"selectAll");
    }
}
