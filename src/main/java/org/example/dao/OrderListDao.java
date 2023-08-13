package org.example.dao;

import org.example.domain.OrderDto;

import java.util.List;
import java.util.Map;

public interface OrderListDao {
    OrderDto select(Map map) throws Exception;

    OrderDto getLastOrd(String custId) throws Exception;

    List<OrderDto> selectByMonth(Map map) throws Exception;

    List<OrderDto> selectByDate(Map map) throws Exception;

    List<OrderDto> getAllOrd(Map map) throws Exception;

    List<OrderDto> getAllOrder() throws Exception;

    int count() throws Exception;

    int todayCost() throws Exception;

    int todayCnt() throws Exception;

    int insert(OrderDto dto) throws Exception;

    int updOrdStatus(OrderDto dto) throws Exception;

//    List<OrderDto> selectAllPage() throws Exception;
    List<OrderDto> selectPage(Map map) throws Exception;

    List<Map<String,Object>> getStat() throws Exception;

    Map<String, Double> getSumAvg(int i) throws Exception;
}
