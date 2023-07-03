package org.example.dao;

import org.example.domain.*;

import java.util.List;

public interface ProdDao {
    //DB에 들어있는 전체상품개수
    int count() throws Exception // T selectOne(String statement)
    ;

    //DB에 들어있는 전체상품개수
    int countCls(ProdDto dto) throws Exception // T selectOne(String statement)
    ;

    //DB에 들어있는 전체상품 삭제
    int deleteAll() // int delete(String statement)
    ;

    //관리자회원이 본인이 등록한 상품 삭제
    int delete(String prodCd, String custId) throws Exception // int delete(String statement, Object parameter)
    ;

    //상품등록페이지에서 상품등록하기
    int insert(ProdDto dto) throws Exception // int insert(String statement, Object parameter)
    ;

    //상품조회페이지에서 전체상품 불러오기
    List<ProdDto> selectAll() throws Exception // List<E> selectList(String statement)
    ;

    //상품관리페이지에서 해당 카테고리 전체상품 불러오기
    List<ProdDto> selectClsAll() throws Exception // List<E> selectList(String statement)
    ;

    //상품리스트 기본페이지에서 사용할 select
    List<ProdDto> selectBasic(String clsCd) throws Exception // T selectOne(String statement, Object parameter)
    ;

    //상품리스트 상세페이지에서 사용할 select
    List<ProdDto> selectDetail(String clsCd) throws Exception // T selectOne(String statement, Object parameter)
    ;

    //상품상세페이지에서 사용할 select

    ProdDto selectProdDetail(String prodCd) throws Exception // T selectOne(String statement, Object parameter)
    ;
}
