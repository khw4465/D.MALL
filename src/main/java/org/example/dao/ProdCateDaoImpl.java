package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.ProdCateDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Repository
public class ProdCateDaoImpl implements ProdCateDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "org.example.dao.ProdCateMapper.";

    @Override
    public ProdCateDto select(int cateCd) throws Exception {
        return session.selectOne(namespace+"select",cateCd);
    }

    @Override
    public List<ProdCateDto> selectAll() throws Exception {
        return session.selectList(namespace+"selectAll");
    }
    @Override
    public List<String> getCateCd() throws Exception {
        Set<String> cateCds = new HashSet<>();
        List<String> cateCdsList = session.selectList(namespace+"getCateCd");
        List<String> cateCdsList2 = new ArrayList<>();
        for(String cateCd : cateCdsList){
            cateCds.add(cateCd);
        }
        for(String cateCd : cateCds) {
            cateCdsList2.add(cateCd);
        }
        return cateCdsList2;
    }
    @Override
    public List<List<ProdCateDto>> getMainCate() throws Exception {
        List<List<ProdCateDto>> prodCateLists = new ArrayList<>();

        List<String> cateCds = getCateCd();
        for(String mainCate : cateCds){
            List<ProdCateDto> prodCateList = session.selectList(namespace + "getMainCate", mainCate);
            prodCateLists.add(prodCateList);
        }
        return prodCateLists;
    }

}
