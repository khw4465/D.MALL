package org.example.service;

import org.example.domain.ProdDto;

public interface ProdService {

    int productRegister(ProdDto prodDto) throws Exception;

    ProdDto getProdDetail(String prodCd) throws Exception;
}
