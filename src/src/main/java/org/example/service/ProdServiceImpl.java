package org.example.service;

import org.example.dao.*;
import org.example.domain.ProdDto;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ProdServiceImpl implements ProdService {
    @Autowired
    ProdDao prodDao;

    //DB에 들어있는 전체상품개수 조회
    @Override
    public int getClsCount(ProdDto prodDto) throws Exception {
        return prodDao.countCls(prodDto);
    }


    //DB에 들어있는 전체상품개수 조회
    @Override
    public int getCount() throws Exception {
        return prodDao.count();
    }

    //DB에 들어있는 전체상품 삭제
    @Override
    public int removeAll() throws Exception {
        return prodDao.deleteAll();
    }

    //관리자회원이 본인이 등록한 상품 삭제
    @Override
    public int removeProd(String prodDto, String custId) throws Exception {
        return prodDao.delete(prodDto, custId);
    }

    //상품등록페이지에서 상품등록
    @Override
    public int register(ProdDto prodDto) throws Exception {
        return prodDao.insert(prodDto);
    }

    //DB에 들어있는 전체상품 리스트 불러오기
    @Override
    public List<ProdDto> getListAll() throws Exception {
        return prodDao.selectAll();
    }

    //해당카테고리 전체 상품리스트 불러오기
    @Override
    public List<ProdDto> getListClsAll() throws Exception {
        return prodDao.selectClsAll();
    }

    //상품기본리스트 불러오기
    @Override
    public List<ProdDto> getListBasic(String clsCd) throws Exception {
        return prodDao.selectBasic(clsCd);
    }

    //상품상세리스트 불러오기
    @Override
    public List<ProdDto> getListDetail(String clsCd) throws Exception {
        return prodDao.selectDetail(clsCd);
    }

    //상품정보 불러오기(상품상세페이지)
    @Override
    public ProdDto prod_info(String prodCd) throws Exception {
       return prodDao.selectProdDetail(prodCd);
    }

}