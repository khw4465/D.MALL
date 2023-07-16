package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.ProdCateDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProdCateDaoImpl implements ProdCateDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "org.example.dao.ProdCateMapper.";

    @Override
    public ProdCateDto select(int cateCd) throws Exception {
        return session.selectOne(namespace+"select",cateCd);
    }

    @Override
    public List<ProdCateDto> selectAll() throws Exception {
        return session.selectList(namespace+"selectAll");
    }


}
