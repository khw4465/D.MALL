package org.example.dao;

import org.example.domain.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import java.util.*;

@Repository
public class ProdStokDaoImpl implements ProdStokDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.fastcampus.ch4.dao.ProdStokMapper.";

    //DB에 들어있는 전체상품재고데이터수
    @Override
    public int count() throws Exception {
        return session.selectOne(namespace+"count");
    } // T selectOne(String statement)

    //DB에 들어있는 전체상품재고데이터 삭제
    @Override
    public int deleteAll() {
        return session.delete(namespace+"deleteAll");
    } // int delete(String statement)

    //상품등록페이지에서 최초로 상품재고등록하기
    @Override
    public int insert(ProdStokDto dto) throws Exception {
        return session.insert(namespace+"insert", dto);
    } // int insert(String statement, Object parameter)

}