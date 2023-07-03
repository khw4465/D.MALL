package org.example.dao;

import org.example.domain.CartDto;

import java.util.List;
import java.util.Map;

public interface CartDao {
    CartDto select(String cartId) throws Exception;

    List<CartDto> selectAll(String cartId) throws Exception;

    int count() throws Exception;

    int insert(CartDto dto) throws Exception;

    int delete(Map map) throws Exception;

    int deleteAll(String cartId) throws Exception;

    int increase(Map<String, String> map) throws Exception;

    int decrease(Map<String, String> map) throws Exception;
}
