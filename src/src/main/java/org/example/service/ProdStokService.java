package org.example.service;

import org.example.domain.ProdStokDto;

public interface ProdStokService {
    //DB에 들어있는 전체상품개수 조회
    int getCount() throws Exception;

    //DB에 들어있는 전체상품 삭제
    int removeAll() throws Exception;

    //상품등록페이지에서 최초로 상품재고 등록
    int register(ProdStokDto prodStokDto) throws Exception;
}
