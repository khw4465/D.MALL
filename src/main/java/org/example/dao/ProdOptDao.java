package org.example.dao;

import org.example.domain.ProdCateDto;
import org.example.domain.ProdOptDto;

import java.util.List;

public interface ProdOptDao {
    ProdOptDto select(String optCd) throws Exception;
    // 특정 cate코드를 입력하면 dto반환

    List<ProdOptDto> selectAll() throws Exception;

}
