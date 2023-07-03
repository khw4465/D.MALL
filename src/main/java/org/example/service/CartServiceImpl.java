package org.example.service;

import org.example.dao.CartDao;
import org.example.domain.CartDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CartServiceImpl implements CartService {
    @Autowired
    CartDao cartDao;

    @Override
    public List<CartDto> getCartList(String custId) throws Exception {  // 장바구니 아에디에 담긴 상품들을 list형식으로 반환
        return cartDao.selectAll(custId);
    }
    @Override
    public int remove(String custId, String prodCd) throws Exception{
        Map<String, String> map = new HashMap<>();
        map.put(custId, prodCd);
        return cartDao.delete(map);
    }
    @Override
    public int removeAll(String custId) throws Exception{
        return cartDao.deleteAll(custId);
    }
    @Override
    public int increaseQty(String custId, String prodCd) throws Exception{    // 개수 ++
        Map<String,String> map = new HashMap<>();
        map.put("custId", custId);       // mapper에 map으로 넣어줄 때 key, value가 들어가는 게 아니라 value 값만 들어간다.
        map.put("prodCd", prodCd);

        return cartDao.increase(map);
    }
    @Override
    public int decreaseQty(String custId, String prodCd) throws Exception{    // 개수 --
        Map<String,String> map = new HashMap<>();
        map.put("custId", custId);
        map.put("prodCd", prodCd);

        return cartDao.decrease(map);
    }
}
