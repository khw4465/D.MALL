package org.example.service;

import org.example.domain.OrderDto;

import java.time.LocalDate;
import java.util.List;

public interface OrderListService {
    OrderDto getOrder(String ordCd, String custId) throws Exception;

    OrderDto getLastOrd(String custId) throws Exception;

    List<OrderDto> getOrdMonth(String custId, int i) throws Exception;

    List<OrderDto> getSelDate(String custId, LocalDate startDate, LocalDate endDate) throws Exception;

    int count(String custId) throws Exception;

    int addOrder(String ordCd, String custId, int dlvAddrId, String dlvMsg) throws Exception;

    int modifyStatus(OrderDto dto) throws Exception;
}
