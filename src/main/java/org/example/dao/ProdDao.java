package org.example.dao;

import org.example.domain.NotcSearchCondition;
import org.example.domain.ProdDcDto;
import org.example.domain.ProdDto;
import org.example.domain.ProdSearchCondition;

import java.util.List;

public interface ProdDao {

    ProdDto select(String prodCd) throws Exception;
    // 특정 prodCd 를 입력하면 ProdDto 반환

    List<ProdDto> selectAll() throws Exception;

    int insert(ProdDto prodDto) throws Exception;

    // 상품 검색에 사용 하는 메서드
    List<ProdDto> prodSearch (ProdSearchCondition psc) throws Exception;

    // 상품 검색에 사용 하는 메서드
//    int prodCount(ProdSearchCondition psc) throws Exception;

}
