package org.example.dao;

import org.example.domain.*;
import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import java.util.*;

@Repository
public class ProdOptValDaoImpl implements ProdOptValDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.fastcampus.ch4.dao.ProdOptValMapper.";

    //DB에 들어있는 전체 옵션상품개수
    @Override
    public int count() throws Exception {
        return session.selectOne(namespace+"count");
    } // T selectOne(String statement)

    //DB에 들어있는 전체 옵션상품 삭제
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

    //상품등록페이지에서 옵션상품등록하기
    @Override
    public int insert(ProdOptValDto dto) throws Exception {
        return session.insert(namespace+"insert3", dto);
    } // int insert(String statement, Object parameter)

    // 전체 옵션상품 불러오기
    @Override
    public List<ProdDto> selectAll() throws Exception {
        return session.selectList(namespace+"selectAll");
    } // List<E> selectList(String statement)

    //해당상품 옵션 불러오기 select
    @Override
    public ProdDto select(String prodCd) throws Exception {
        return session.selectOne(namespace + "selectProdOpt", prodCd);
    } // T selectOne(String statement, Object parameter)

}