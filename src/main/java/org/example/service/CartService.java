package org.example.service;

import org.example.domain.CartDto;
import org.example.domain.OrderDto;

import java.util.List;
import java.util.Set;

public interface CartService {
    List<CartDto> getCartList(String custId) throws  Exception;

    int remove(String custId, String prodCd) throws Exception;

    int removeAll(String custId) throws Exception;

    int modifyQty(int prodQty, int totProdPrice,String custId, String prodCd) throws Exception;

    OrderDto getOrdHist(String custId) throws Exception;

//    int decreaseQty(String custId, String prodCd, int prodQty) throws Exception;
}
