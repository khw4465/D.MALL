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
    public OrderDto getLastOrd(String custId) throws Exception {
        return orderListDao.getLastOrd(custId);
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
    public List<OrderDto> getAllOrder(Map map) throws Exception {
        return orderListDao.getAllOrd(map);
    }
    @Override
    public int count() throws Exception {
        return orderListDao.count();
    }
    @Override
    public int addOrder(String ordCd, String custId, String custName, int totDcPrc, int dlvAddrId, String dlvMsg) throws Exception {
        OrderDto dto = cartDao.ordHist(custId);
        OrderDto dto1 = new OrderDto(ordCd, dto.getCustId(), custName, dto.getMainProdCd(), dto.getProdName(), dto.getTotProdCnt(), dto.getTotPrc(), dto.getTotQty(), totDcPrc, dlvAddrId, dto.getDlvPrc(), dlvMsg, dto.getFinPrc()-totDcPrc);
        return orderListDao.insert(dto1);
    }
    @Override
    public int modifyStatus(OrderDto dto) throws Exception {
        return orderListDao.updOrdStatus(dto);
    }


    @Override
    public List<OrderDto> getPage(Map map) throws Exception{
        return orderListDao.selectPage(map);
    }

    // 최근 일주일동안의 일별 판매금액 통계
    @Override
    public List<Map<String, Object>> getStat() throws Exception {
        return orderListDao.getStat();
    }
}
