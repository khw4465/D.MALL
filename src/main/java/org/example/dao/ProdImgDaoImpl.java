package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProdImgDaoImpl implements ProdImgDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.fastcampus.ch4.dao.ProdImgMapper.";

    //상품등록페이지에서 상품등록하기
    @Override
    public int insert(ProdImgDto dto) throws Exception {
        return session.insert(namespace+"insert", dto);
    } // int insert(String statement, Object parameter)

}