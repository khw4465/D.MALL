package org.example.service;

import org.example.domain.ProdImgDto;

import java.util.List;

public interface ProdImgService {
    ProdImgDto getOneImg(String prodCd) throws Exception;

    List<ProdImgDto> getAllImg(String prodCd) throws Exception;
}
