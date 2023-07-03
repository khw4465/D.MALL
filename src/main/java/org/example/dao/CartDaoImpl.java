package org.example.dao;

import org.example.domain.CartDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CartDaoImpl implements CartDao {
    @Autowired
    SqlSession session;
    private static String namespace = "org.example.dao.CartMapper.";

    @Override
    public CartDto select(String cartId) throws Exception{
        return session.selectOne(namespace + "select", cartId);
    }
    @Override
    public List<CartDto> selectAll(String cartId) throws Exception{
        return session.selectList(namespace + "selectAll", cartId);
    }
    @Override
    public int count() throws Exception{
        return session.selectOne(namespace + "count");
    }
    @Override
    public int insert(CartDto dto) throws Exception{
        return session.insert(namespace + "insert", dto);
    }
    @Override
    public int delete(Map map) throws Exception{
        return session.delete(namespace + "delete", map);
    }
    @Override
    public int deleteAll(String cartId) throws Exception{
        return session.delete(namespace + "deleteAll", cartId);
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
