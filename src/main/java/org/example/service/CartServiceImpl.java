package org.example.service;

import org.example.dao.CartDao;
import org.example.domain.CartDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class CartServiceImpl implements CartService {
    @Autowired
    CartDao cartDao;

    @Override
    public List<CartDto> getCartList(String custId) throws Exception{
        return cartDao.selectAll(custId);
    }
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int remove(String custId, String prodCd) throws Exception{
        Map<String, String> map = new HashMap<>();      // 맵에 담아서 전달
        map.put("custId", custId);
        map.put("prodCd", prodCd);
//           throw new Exception("test");
        return cartDao.delete(map);
    }
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int removeAll(String custId) throws Exception{
//           throw new Exception("test");
        return cartDao.deleteAll(custId);
    }
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int increaseQty(String custId, String prodCd) throws Exception{    // 개수 ++
        Map<String,String> map = new HashMap<>();
        map.put("custId", custId);       // mapper에 map으로 넣어줄 때 key, value가 들어가는 게 아니라 value 값만 들어간다.
        map.put("prodCd", prodCd);
//           throw new Exception("test");
        return cartDao.increase(map);
    }
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int decreaseQty(String custId, String prodCd) throws Exception{    // 개수 --
        Map<String,String> map = new HashMap<>();
        map.put("custId", custId);
        map.put("prodCd", prodCd);
//           throw new Exception("test");
        return cartDao.decrease(map);
    }
}
