package org.example.service;

import org.example.domain.OrderDto;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

public interface OrderService {
    OrderDto getOrder(String ordCd, String custId) throws Exception;

    List<OrderDto> getOrdMonth(String custId, int i) throws Exception;

    List<OrderDto> getSelDate(String custId, LocalDate startDate, LocalDate endDate) throws Exception;

    int count(String custId) throws Exception;

    int addOrder(OrderDto dto) throws Exception;

    int ModifyStatus(OrderDto dto) throws Exception;
}
