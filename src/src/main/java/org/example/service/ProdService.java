package org.example.service;

import org.example.domain.ProdDto;

import java.util.List;

public interface ProdService {
    //DB에 들어있는 전체상품개수 조회
    int getClsCount(ProdDto prodDto) throws Exception;

    //DB에 들어있는 전체상품개수 조회
    int getCount() throws Exception;

    //DB에 들어있는 전체상품 삭제
    int removeAll() throws Exception;

    //관리자회원이 본인이 등록한 상품 삭제
    int removeProd(String prodDto, String custId) throws Exception;

    //상품등록페이지에서 상품등록
    int register(ProdDto prodDto) throws Exception;

    //DB에 들어있는 전체상품 리스트 불러오기
    List<ProdDto> getListAll() throws Exception;

    //해당카테고리 전체 상품리스트 불러오기
    List<ProdDto> getListClsAll() throws Exception;

    //상품기본리스트 불러오기
    List<ProdDto> getListBasic(String clsCd) throws Exception;

    //상품상세리스트 불러오기
    List<ProdDto> getListDetail(String clsCd) throws Exception;

    //상품정보 불러오기(상품상세페이지)
    ProdDto prod_info(String prodCd) throws Exception;
}
