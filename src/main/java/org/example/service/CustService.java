package org.example.service;

import org.example.domain.CustDto;

import java.util.List;

public interface CustService {
    List<CustDto> getCustList() throws Exception;

    String findCustId(CustDto custDto) throws Exception; //회원아이디 찾아주기

    CustDto loginCust(String id) throws Exception;
    int registerCust(CustDto custDto) throws Exception;



}
