package org.example.service;

import org.example.dao.*;
import org.example.domain.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ProdImgServiceImpl implements ProdImgService {
    @Autowired
    ProdImgDao prodImgDao;

    //상품등록페이지에서 상품이미지등록
    @Override
    public int register(ProdImgDto prodImgDto) throws Exception {
        return prodImgDao.insert(prodImgDto);
    }
}