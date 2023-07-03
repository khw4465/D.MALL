package org.example.service;

import org.example.domain.ProdDto;
import org.example.domain.ProdOptValDto;

import java.util.List;

public interface ProdOptValService {
    //DB에 들어있는 전체 옵션상품개수 조회
    int getCount() throws Exception;

    //DB에 들어있는 전체상품 삭제
    int removeAll() throws Exception;

    //관리자회원이 본인이 등록한 상품 삭제
    int removeProd(String prodDto, String custId) throws Exception;

    //상품등록페이지에서 상품등록
    int register(ProdOptValDto prodOptValDto) throws Exception;

    //DB에 들어있는 전체상품 리스트 불러오기
    List<ProdDto> getListAll() throws Exception;
}
