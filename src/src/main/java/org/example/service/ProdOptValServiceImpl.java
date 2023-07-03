package org.example.service;

import org.example.dao.*;
import org.example.domain.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ProdOptValServiceImpl implements ProdOptValService {
    @Autowired
    ProdOptValDao prodOptValDao;

    //DB에 들어있는 전체 옵션상품개수 조회
    @Override
    public int getCount() throws Exception {
        return prodOptValDao.count();
    }

    //DB에 들어있는 전체상품 삭제
    @Override
    public int removeAll() throws Exception {
        return prodOptValDao.deleteAll();
    }

    //관리자회원이 본인이 등록한 상품 삭제
    @Override
    public int removeProd(String prodDto, String custId) throws Exception {
        return prodOptValDao.delete(prodDto, custId);
    }

    //상품등록페이지에서 상품등록
    @Override
    public int register(ProdOptValDto prodOptValDto) throws Exception {
        return prodOptValDao.insert(prodOptValDto);
    }

    //DB에 들어있는 전체상품 리스트 불러오기
    @Override
    public List<ProdDto> getListAll() throws Exception {
        return prodOptValDao.selectAll();
    }
}