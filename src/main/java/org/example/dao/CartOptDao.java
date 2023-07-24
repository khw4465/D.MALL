package org.example.dao;

import org.example.domain.CartDto;
import org.example.domain.CartOptDto;

import java.util.List;
import java.util.Map;

public interface CartOptDao {
    CartOptDto select(Map<String, String> map) throws Exception;

    List<CartOptDto> selectProd(String custId, String prodCd) throws Exception;

    List<CartOptDto> selectAll(String custId) throws Exception;

    int count(String custId) throws Exception;

    int countProd(String custId) throws Exception;

    int insert(CartOptDto dto) throws Exception;

    int delete(Map<String, String> map) throws Exception;

    int deleteProd(Map<String, String> map) throws Exception;

    int deleteAll(String custId) throws Exception;

    int update(Map map) throws Exception;

    CartDto summeryOpt(Map<String, String> map) throws Exception;
}
