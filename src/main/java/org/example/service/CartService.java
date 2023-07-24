package org.example.service;

import org.example.domain.CartDto;
import org.example.domain.CartOptDto;
import org.example.domain.OrderDto;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

public interface CartService {
    List<CartDto> getCartList(String custId) throws  Exception;

    List<String> getProdList(String custId) throws Exception;

    List<CartOptDto> getProdOptList(String custId, String prodCd) throws Exception;

    List<List<CartOptDto>> getAllOptList(String custId) throws Exception;

    int addCart(String custId, List<CartOptDto> list) throws Exception;

    int removeOpt(String custId, String prodCd, String optCd) throws Exception;

    int removeProd(String custId, List<String> prodCd) throws Exception;

    @Transactional(rollbackFor = Exception.class)
    int removeAll(String custId) throws Exception;

    @Transactional(rollbackFor = Exception.class)
    int modifyQty(int prodQty, String custId, String prodCd, String optCd) throws Exception;

    OrderDto getOrdHist(String custId) throws Exception;
}
