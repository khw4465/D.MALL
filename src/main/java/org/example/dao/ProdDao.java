package org.example.dao;

import org.example.domain.ProdDcDto;
import org.example.domain.ProdDto;

import java.util.List;

public interface ProdDao {

    ProdDto select(String prodCd) throws Exception;
    // 특정 prodCd 를 입력하면 ProdDto 반환

    List<ProdDto> selectAll() throws Exception;

    int insert(ProdDto prodDto) throws Exception;


}
