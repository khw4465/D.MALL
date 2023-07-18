package org.example.service;

import org.example.domain.NotcSearchCondition;
import org.example.domain.ProdDto;
import org.example.domain.ProdSearchCondition;

import java.util.List;

public interface ProdService {

    int productRegister(ProdDto prodDto) throws Exception;


    List<ProdDto> getprodSearchResult(ProdSearchCondition psc) throws Exception;
//    int getprodCount(ProdSearchCondition psc) throws Exception;
}
