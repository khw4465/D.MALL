package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.ProdImgDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProdImgDaoImpl implements ProdImgDao {
    @Autowired
    private SqlSession session;

    private static String namespace="org.example.dao.ProdImgMapper.";

    @Override
    public ProdImgDto select(String imgCd) throws Exception {
        return session.selectOne(namespace+"select",imgCd);
    }

    @Override
    public List<ProdImgDto> selectAll() throws Exception {
        return session.selectList(namespace+"selectAll");
    }

    @Override
    public int insert(ProdImgDto prodImgDto) throws Exception {
        return session.insert(namespace+"insert",prodImgDto);
    }
}
