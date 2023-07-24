package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.CartDto;
import org.example.domain.CartOptDto;
import org.example.domain.OrderDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CartOptDaoImpl implements CartOptDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "org.example.dao.CartOptMapper.";

    @Override
    public CartOptDto select(Map<String, String> map) throws Exception{
        return session.selectOne(namespace + "select", map);
    }
    @Override
    public List<CartOptDto> selectProd(String custId, String prodCd) throws Exception {
        Map<String, String> map = new HashMap<>();
        map.put("custId", custId);
        map.put("prodCd", prodCd);
        return session.selectList(namespace + "selectProd", map);
    }
    @Override
    public List<CartOptDto> selectAll(String custId) throws Exception{
        return session.selectList(namespace + "selectAll", custId);
    }
    @Override
    public int count(String custId) throws Exception{
        return session.selectOne(namespace + "count", custId);
    }
    @Override
    public int countProd(String custId) throws Exception {
        return session.selectOne(namespace + "countProd", custId);
    }
    @Override
    public int insert(CartOptDto dto) throws Exception{
        return session.insert(namespace + "insert", dto);
    }
    @Override
    public int delete(Map<String, String> map) throws Exception{
        return session.delete(namespace + "delete", map);
    }
    @Override
    public int deleteProd(Map<String, String> map) throws Exception {
        return session.delete(namespace + "deleteProd", map);
    }
    @Override
    public int deleteAll(String custId) throws Exception{
        return session.delete(namespace + "deleteAll", custId);
    }
    @Override
    public int update(Map map) throws Exception{
        return session.update(namespace + "update", map);
    }
    @Override
    public CartDto summeryOpt(Map<String, String> map) throws Exception {
        // 장바구니에 담긴 하나의 상품에 대한 다양한 옵션목록을 합쳐 요약해 놓는 메서드

        return session.selectOne(namespace + "getProdOptList", map);
    }
}
