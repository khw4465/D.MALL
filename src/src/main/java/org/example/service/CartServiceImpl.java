package org.example.service;

import org.example.dao.CartDao;
import org.example.dao.CustDao;
//import org.example.dao.ProdDao;
import org.example.domain.CartDto;
//import org.example.domain.ProdDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public abstract class CartServiceImpl implements CartService{
//    @Autowired
//    CartDao cartDao;
//    @Autowired
//    ProdDao prodDao;
//    @Autowired
//    CustDao custDao;

//    @Override
//    public List<CartDto> getCartList(String custId) throws Exception {  // 장바구니 아에디에 담긴 상품들을 list형식으로 반환
////        String cartId = getCartId(custId);
////        return cartDao.selectAll(cartId);
//        return null;
//    }
//    @Override
//    public ProdDto getProdInfo(String prodCd) throws Exception{ // 상품 코드를 넣으면 상품 정보를 반환하는 메서드
//        return prodDao.select(prodCd);
//    }
//    @Override
//    public String getCartId(String custId) throws Exception{  // 회원 아이디를 넣으면 회원의 장바구니 아이디를 반환하는 메서드
//        return custDao.getCartId(custId);
//    }
//    @Override
//    public int remove(Map<String, String> map) throws Exception{
//        return cartDao.delete(map);
//    }
//    @Override
//    public int removeAll(String custId) throws Exception{
//        return cartDao.deleteAll(custId);
//    }
//    @Override
//    public int increaseQty(String custId, String prodCd) throws Exception{    // 개수 ++
//        Map<String,String> map = new HashMap<>();
//        String cartId =getCartId(custId);
//        map.put("cartId", cartId);        // mapper에 map으로 넣어줄 때 key, value가 들어가는 게 아니라 value 값만 들어간다.
//        map.put("prodCd", prodCd);
//
//        return cartDao.increase(map);
//    }
//    @Override
//    public int decreaseQty(String custId, String prodCd) throws Exception{    // 개수 --
//        Map<String,String> map = new HashMap<>();
//        String cartId =getCartId(custId);
//        map.put("cartId", cartId);
//        map.put("prodCd", prodCd);
//        return cartDao.decrease(map);
//    }
}
