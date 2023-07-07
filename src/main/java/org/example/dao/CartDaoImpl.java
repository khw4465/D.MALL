package org.example.dao;

import org.example.domain.CartDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CartDaoImpl implements CartDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "org.example.dao.CartMapper.";

    @Override
    public CartDto select(String custId, String prodCd) throws Exception{
        Map<String, String> map = new HashMap<>();
        map.put("custId", custId);
        map.put("prodCd", prodCd);
        return session.selectOne(namespace + "select", map);
    }
    @Override
    public List<CartDto> selectAll(String custId) throws Exception{
        return session.selectList(namespace + "selectAll", custId);
    }
    @Override
    public int count(String custId) throws Exception{
        return session.selectOne(namespace + "count", custId);
    }
    @Override
    public int insert(CartDto dto) throws Exception{
        return session.insert(namespace + "insert", dto);
    }
    @Override
    public int delete(Map<String,String> map) throws Exception{
        return session.delete(namespace + "delete", map);
    }
    @Override
    public int deleteAll(String custId) throws Exception{
        return session.delete(namespace + "deleteAll", custId);
    }
    @Override
    public int increase(Map<String, String> map) throws Exception{
        return session.update(namespace + "increase", map);
    }
    @Override
    public int decrease(Map<String, String> map) throws Exception{
        return session.update(namespace + "decrease", map);
    }
}
