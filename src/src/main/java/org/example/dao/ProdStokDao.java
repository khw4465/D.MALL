package org.example.dao;

import org.example.domain.*;

public interface ProdStokDao {
    //DB에 들어있는 전체상품재고데이터수
    int count() throws Exception // T selectOne(String statement)
    ;

    //DB에 들어있는 전체상품재고데이터 삭제
    int deleteAll() // int delete(String statement)
    ;

    //상품등록페이지에서 최초로 상품재고등록하기
    int insert(ProdStokDto dto) throws Exception // int insert(String statement, Object parameter)
    ;
}
