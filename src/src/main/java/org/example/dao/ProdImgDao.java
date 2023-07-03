package org.example.dao;

import org.example.domain.ProdImgDto;

public interface ProdImgDao {
    //상품등록페이지에서 상품등록하기
    int insert(ProdImgDto dto) throws Exception // int insert(String statement, Object parameter)
    ;
}
