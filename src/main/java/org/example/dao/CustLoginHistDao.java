package org.example.dao;

import org.example.domain.CustStatsDto;
import org.example.domain.LoginHistoryDTO;
import org.example.domain.pointDto;

import java.util.List;
import java.util.Map;

public interface CustLoginHistDao {
    LoginHistoryDTO select(String custId) throws Exception;
    int insert(LoginHistoryDTO loginHistoryDTO) throws Exception;
    List<LoginHistoryDTO> selectAll() throws Exception;
    int count(String custId) throws Exception;
    LoginHistoryDTO FailCountSelect(String custId) throws Exception;
    int FailCountUpdate(LoginHistoryDTO loginHistoryDTO) throws Exception;
    List<LoginHistoryDTO> selectPage(Map map)throws Exception;

    int countAll() throws Exception;

}
