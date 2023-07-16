package org.example.dao;

import org.example.domain.ProdCateDto;
import org.example.domain.ProdDcDto;

import java.util.List;

public interface ProdDcDao {

    ProdDcDto select(String dcCd) throws Exception;
    // 특정 cate코드를 입력하면 dto반환

    List<ProdDcDto> selectAll() throws Exception;

}
