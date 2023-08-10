package org.example.dao;

import org.example.domain.ProdCateDto;
import org.example.domain.ProdOptDto;

import java.util.List;
import java.util.Map;

public interface ProdOptDao {
    ProdOptDto select(Map map) throws Exception;
    // 특정 cate코드를 입력하면 dto반환

    List<ProdOptDto> selectAll() throws Exception;

    List<ProdOptDto> selectOpt(String prodCd) throws Exception;
    int insert(ProdOptDto prodOptDto) throws Exception;
}
