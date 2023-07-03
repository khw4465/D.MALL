package org.example.dao;

import org.example.domain.*;
import java.util.List;

public interface ProdOptValDao {
    //DB에 들어있는 전체 옵션상품개수

    int count() throws Exception // T selectOne(String statement)
    ;

    //DB에 들어있는 전체 옵션상품 삭제
    int deleteAll() // int delete(String statement)
    ;

    //관리자회원이 본인이 등록한 상품 삭제
    int delete(String prodCd, String custId) throws Exception // int delete(String statement, Object parameter)
    ;

    //상품등록페이지에서 옵션상품등록하기
    int insert(ProdOptValDto dto) throws Exception // int insert(String statement, Object parameter)
    ;

    // 전체 옵션상품 불러오기
    List<ProdDto> selectAll() throws Exception // List<E> selectList(String statement)
    ;

    //해당상품 옵션 불러오기 select
    ProdDto select(String prodCd) throws Exception // T selectOne(String statement, Object parameter)
    ;
}
