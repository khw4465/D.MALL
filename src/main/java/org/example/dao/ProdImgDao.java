package org.example.dao;

import org.example.domain.ProdDto;
import org.example.domain.ProdImgDto;

import java.util.List;

public interface ProdImgDao {

    ProdImgDto select(String imgCd) throws Exception;

    List<ProdImgDto> selectAll() throws Exception;

    int insert(ProdImgDto prodImgDto) throws Exception;

}
