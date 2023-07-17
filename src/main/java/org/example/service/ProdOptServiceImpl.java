package org.example.service;

import org.example.dao.ProdOptDao;
import org.example.domain.ProdOptDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProdOptServiceImpl implements ProdOptService {
    @Autowired
    ProdOptDao prodOptDao;

    @Override
    public ProdOptDto getOpt(String prodCd, String optCd) throws Exception {
        Map map = new HashMap();
        map.put("prodCd", prodCd);
        map.put("optCd", optCd);
        return prodOptDao.select(map);
    }
    @Override
    public List<ProdOptDto> getOptList(String prodCd) throws Exception {
        return prodOptDao.selectOpt(prodCd);
    }
}
