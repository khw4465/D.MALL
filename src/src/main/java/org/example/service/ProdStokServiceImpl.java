package org.example.service;


import org.example.dao.ProdStokDao;
import org.example.domain.ProdStokDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProdStokServiceImpl implements ProdStokService {
    @Autowired
    ProdStokDao prodStokDao;

    //DB에 들어있는 전체상품개수 조회
    @Override
    public int getCount() throws Exception {
        return prodStokDao.count();
    }

    //DB에 들어있는 전체상품 삭제
    @Override
    public int removeAll() throws Exception {
        return prodStokDao.deleteAll();
    }

    //상품등록페이지에서 최초로 상품재고 등록
    @Override
    public int register(ProdStokDto prodStokDto) throws Exception {
        return prodStokDao.insert(prodStokDto);
    }

}