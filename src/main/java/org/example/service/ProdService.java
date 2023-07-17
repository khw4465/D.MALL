package org.example.service;

import org.example.domain.NotcSearchCondition;
import org.example.domain.ProdDto;

import java.util.List;

public interface ProdService {

    int productRegister(ProdDto prodDto) throws Exception;

    ProdDto getProdDetail(String prodCd) throws Exception;
    List<ProdDto> getprodSearchResult(NotcSearchCondition sc) throws Exception;
    int getprodCount(NotcSearchCondition sc) throws Exception;

}
