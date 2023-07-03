package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ProdDaoImpl implements ProdDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.fastcampus.ch4.dao.ProdMapper.";

    //DB에 들어있는 해당카테고리 상품 개수
    @Override
    public int countCls(ProdDto dto) throws Exception {
        return session.selectOne(namespace+"countCls", dto);
    } // T selectOne(String statement)

    //DB에 들어있는 전체상품개수
    @Override
    public int count() throws Exception {
        return session.selectOne(namespace+"count");
    } // T selectOne(String statement)

    //DB에 들어있는 전체상품 삭제
    @Override
    public int deleteAll() {
        return session.delete(namespace+"deleteAll");
    } // int delete(String statement)

    //관리자회원이 본인이 등록한 상품 삭제
    @Override
    public int delete(String prodCd, String custId) throws Exception {
        Map map = new HashMap();
        map.put("prodCd", prodCd);
        map.put("custId", custId);
        return session.delete(namespace+"deleteForAdmin", map);
    } // int delete(String statement, Object parameter)

    //상품등록페이지에서 상품등록하기
    @Override
    public int insert(ProdDto dto) throws Exception {
        return session.insert(namespace+"insert", dto);
    } // int insert(String statement, Object parameter)

    //상품조회페이지에서 전체상품 불러오기
    @Override
    public List<ProdDto> selectAll() throws Exception {
        return session.selectList(namespace+"selectAll");
    } // List<E> selectList(String statement)

    //상품관리페이지에서 해당 카테고리 전체상품 불러오기
    @Override
    public List<ProdDto> selectClsAll() throws Exception {
        return session.selectList(namespace+"selectAllCls");
    } // List<E> selectList(String statement)

    //상품리스트 기본페이지에서 사용할 select
    @Override
    public List<ProdDto> selectBasic(String clsCd) throws Exception {
        return session.selectOne(namespace + "selectBasic", clsCd);
    } // T selectOne(String statement, Object parameter)

    //상품리스트 상세페이지에서 사용할 select
    @Override
    public List<ProdDto> selectDetail(String clsCd) throws Exception {
        return session.selectOne(namespace + "selectListDetail", clsCd);
    } // T selectOne(String statement, Object parameter)

    //상품상세페이지에서 사용할 select
    @Override
    public ProdDto selectProdDetail(String prodCd) throws Exception {
        return session.selectOne(namespace + "selectProdDetail", prodCd);
    } // T selectOne(String statement, Object parameter)

}