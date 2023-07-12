package org.example.service;

import org.example.dao.CartDao;
import org.example.dao.OrderListDao;
import org.example.domain.OrderDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderListServiceImpl implements OrderListService {
    @Autowired
    OrderListDao orderListDao;
    @Autowired
    CartDao cartDao;
    @Override
    public OrderDto getOrder(String ordCd, String custId) throws Exception {
        Map map = new HashMap();
        map.put("ordCd", ordCd);
        map.put("custId", custId);
        return orderListDao.select(map);
    }

    @Override
    public List<OrderDto> getOrdMonth(String custId, int i) throws Exception {
        Map map = new HashMap();
        map.put("custId", custId);
        map.put("i", i);
        return orderListDao.selectByMonth(map);
    }
    @Override
    public List<OrderDto> getSelDate(String custId, LocalDate startDate, LocalDate endDate) throws Exception{
        Map map = new HashMap();
        map.put("custId", custId);
        map.put("startDate", startDate);
        map.put("endDate", endDate);
        return orderListDao.selectByDate(map);
    }
    @Override
    public int count(String custId) throws Exception {
        return orderListDao.count(custId);
    }
    @Override
    public int addOrder(String ordCd, String custId, String dlvAddrId, String dlvMsg) throws Exception {
        OrderDto dto = cartDao.ordHist(custId);
        OrderDto dto1 = new OrderDto(ordCd, dto.getCustId(), dto.getProdName(), dto.getTotProdCnt(), dto.getTotPrc(), dto.getTotQty(), dlvAddrId, dlvMsg);
        return orderListDao.insert(dto1);
    }
    @Override
    public int modifyStatus(OrderDto dto) throws Exception {
        return orderListDao.updOrdStatus(dto);
    }
}
