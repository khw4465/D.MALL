package org.example.service;

import org.example.domain.CustDto;
import org.example.domain.CustStatsDto;
import org.example.domain.LoginHistoryDTO;

import java.util.List;
import java.util.Map;

public interface CustLoginHistService {
    LoginHistoryDTO select(String id) throws Exception;

    int LoginHistInsert(LoginHistoryDTO loginHistoryDTO)throws Exception;

    List<LoginHistoryDTO> selectAllLoginHist() throws Exception;

    int LoginHistCount(String id) throws Exception;

    LoginHistoryDTO HistCountSelect(String id)throws Exception;

    int HistCountUpdate(LoginHistoryDTO loginHistoryDTO)throws Exception;








}
