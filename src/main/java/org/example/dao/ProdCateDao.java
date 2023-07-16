package org.example.dao;

import org.example.domain.CustDto;
import org.example.domain.ProdCateDto;

import java.util.List;

public interface ProdCateDao {

    ProdCateDto select(int cateCd) throws Exception;
    // 특정 cate코드를 입력하면 dto반환

    List<ProdCateDto> selectAll() throws Exception;
    // cate코드 모두출력

}
