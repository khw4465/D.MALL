package org.example.service;

import org.example.domain.CustDto;
import org.example.domain.DlvAddrDto;

import java.util.List;

public interface PayService {
    CustDto getCust(String custId) throws Exception;

    List<DlvAddrDto> getDlvAddr(String custId) throws Exception;

    int addDlvAddr(DlvAddrDto dto) throws Exception;

    int modifyDlvAddr(DlvAddrDto dto) throws Exception;
}
