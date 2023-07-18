package org.example.service;

import org.example.dao.ProdImgDao;
import org.example.domain.ProdImgDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProdImgServiceImpl implements ProdImgService {
    @Autowired
    ProdImgDao prodImgDao;

    @Override
    public ProdImgDto getOneImg(String prodCd) throws Exception{
        return prodImgDao.select(prodCd);
    }
    @Override
    public List<ProdImgDto> getAllImg(String prodCd) throws Exception{
        return prodImgDao.selectImage(prodCd);
    }
}
