package org.example.service;

import org.example.dao.CartDao;
import org.example.dao.CartOptDao;
import org.example.domain.CartDto;
import org.example.domain.CartOptDto;
import org.example.domain.OrderDto;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class CartServiceImpl implements CartService {
    CartDao cartDao;
    CartOptDao cartOptDao;
    public CartServiceImpl(CartDao cartDao, CartOptDao cartOptDao) {
        this.cartDao = cartDao;
        this.cartOptDao = cartOptDao;
    }

    @Override
    public List<CartDto> getCartList(String custId) throws Exception{       // 상품의 목록을 가져오는 메서드 (옵션 X)
        return cartDao.selectAll(custId);
    }
    @Override
    public List<String> getProdList(String custId) throws Exception {
        List<String> prodCds = new ArrayList<>();               // 상품 코드를 담는 리스트 생성
        List<CartDto> cartData = cartDao.selectAll(custId);     // 장바구니의 상품을 가져옴
        for (CartDto cartDto : cartData) {                      // 상품에서 상품코드만 뽑아 리스트에 넣음
            if(!prodCds.contains(cartDto.getProdCd())) {        // 중복제거
                prodCds.add(cartDto.getProdCd());
            }
        }
        return prodCds;
    }
    @Override
    public List<CartOptDto> getProdOptList(String custId, String prodCd) throws Exception {
        return cartOptDao.selectProd(custId, prodCd);
    }
    @Override
    public List<List<CartOptDto>> getAllOptList(String custId) throws Exception {     // 장바구니에 담긴 모든 상품의 옵션 목록을 가져옴
        List<String> prodCds = getProdList(custId);

        List<List<CartOptDto>> allList = new ArrayList<>();     // 한 상품에대한 옵션리스트를 전체 리스트안에 넣기 위해 생성

        for (String prodCd : prodCds) {                         // 상품코드 리스트에서 하나씩 가져옴
            List<CartOptDto> optList = cartOptDao.selectProd(custId, prodCd);       // 해당 상품 옵션을 가져옴
            allList.add(optList);
        }

        return allList;
    }
    @Override
    public int addCart(String custId, List<CartOptDto> list) throws Exception {

        for(CartOptDto cartOptDto : list) {         // 상품 상세에서 리스트에 옵션별로 담은 뒤
            cartOptDao.insert(cartOptDto);          // 반복문을 통해 cartOpt 테이블에 넣어줌
        }

        String prodCd = list.get(0).getProdCd();    // 옵션리스트에서 그 상품의 코드를 가져온다.
        Map<String, String> map = new HashMap<>();
        map.put("custId", custId);
        map.put("prodCd", prodCd);
        CartDto dto = cartOptDao.summeryOpt(map);    // cartOpt에 담긴 해당 상품의 데이터를 한줄로 묶어준다.
        return cartDao.insert(dto);                 // 장바구니에 입력
    }
    @Override
    public int removeOpt(String custId, String prodCd, String optCd) throws Exception {     // 상품의 옵션 하나만 삭제하는 메서드
        Map map = new HashMap();
        map.put("custId", custId);
        map.put("prodCd", prodCd);
        map.put("optCd", optCd);
        int i = cartOptDao.delete(map);                                   // 한 상품의 원하는 옵션을 삭제

        CartDto cartDto = cartOptDao.summeryOpt(map);                     // 한 상품안에 들은 옵션을 다시 요약

        if(cartDto == null){ cartDao.delete(map); }                       // 옵션이 다 삭제되면 상품도 장바구니에서 삭제
        else {
            int prodQty = cartDto.getProdQty();                           // 다시 요약한 상품의 수량 체크
            int totProdPrice = cartDto.getTotProdPrice();                 // 다시 요약한 상품의 가격 체크

            map.put("prodQty", prodQty);
            map.put("totProdPrice", totProdPrice);                        // 수량과 가격을 다시 맵에 담아서

            cartDao.update(map);                                          // 장바구니 테이블 수정
        }
        return i;
    }
    @Override
    public int removeProd(String custId, List<String> prodCds) throws Exception{   // 체크박스로 선택된 상품을 지우는 메서드
        for(String prodCd : prodCds){
            Map<String, String> map = new HashMap<>();      // 맵에 담아서 전달
            map.put("custId", custId);
            map.put("prodCd", prodCd);

            cartOptDao.deleteProd(map);     // Cart_Opt 테이블에서 그 상품에 관한 모든 옵션목록 삭제
            cartDao.delete(map);            // Cart에서 상품 삭제
        }

        return prodCds.size();              // 삭제된 상품 수 반환
    }
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int removeAll(String custId) throws Exception{
//           throw new Exception("test");
        cartOptDao.deleteAll(custId);        // Cart_Opt 에서 전체 삭제
        return cartDao.deleteAll(custId);    // Cart 에서 전체 삭제
    }
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int modifyQty(int optQty, String custId, String prodCd, String optCd) throws Exception{    // 개수 ++
        Map map = new HashMap<>();
        map.put("optQty", optQty);
        map.put("custId", custId);       // mapper에 map으로 넣어줄 때 key, value가 들어가는 게 아니라 value 값만 들어간다.
        map.put("prodCd", prodCd);
        map.put("optCd", optCd);
//           throw new Exception("test");
        int i = cartOptDao.update(map);

        CartDto cartDto = cartOptDao.summeryOpt(map);
        int prodQty = cartDto.getProdQty();
        int totProdPrice = cartDto.getTotProdPrice();

        map.put("prodQty", prodQty);
        map.put("totProdPrice", totProdPrice);

        cartDao.update(map);
        return i;
    }
    @Override
    public OrderDto getOrdHist(String custId) throws Exception {
        return cartDao.ordHist(custId);
    }
}
