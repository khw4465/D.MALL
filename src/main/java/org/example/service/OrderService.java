package org.example.service;

import org.example.domain.CustDto;
import org.example.domain.DlvAddrDto;

import java.util.List;

public interface OrderService {
    CustDto getCust(String custId) throws Exception;

    DlvAddrDto getOneAddr(String custId, int addrNo) throws Exception;

    List<DlvAddrDto> getDlvAddr(String custId) throws Exception;

    int addDlvAddr(DlvAddrDto dto) throws Exception;

    int modifyDlvAddr(DlvAddrDto dto) throws Exception;
}
