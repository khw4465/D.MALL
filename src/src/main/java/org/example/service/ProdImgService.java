package org.example.service;

import org.example.domain.ProdImgDto;

public interface ProdImgService {
    //상품등록페이지에서 상품이미지등록
    int register(ProdImgDto prodImgDto) throws Exception;
}
