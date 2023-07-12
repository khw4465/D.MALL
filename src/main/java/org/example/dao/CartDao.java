package org.example.dao;

import org.example.domain.CartDto;
import org.example.domain.OrderDto;

import java.util.List;
import java.util.Map;

public interface CartDao {
    CartDto select(String custId, String prodCd) throws Exception;

    List<CartDto> selectAll(String custId) throws Exception;

    int count(String custId) throws Exception;

    int insert(CartDto dto) throws Exception;

    int delete(Map<String, String> map) throws Exception;

    int deleteAll(String custId) throws Exception;

    int update(Map map) throws Exception;
    OrderDto ordHist(String custId) throws Exception;
}
