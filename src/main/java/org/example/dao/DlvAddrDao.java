package org.example.dao;

import org.example.domain.DlvAddrDto;

import java.util.List;

public interface DlvAddrDao {
    DlvAddrDto select(String custId, int addrNo) throws Exception;

    List<DlvAddrDto> selectAll(String custId) throws Exception;

    int count(String custId) throws Exception;

    int insert(DlvAddrDto dto) throws Exception;

    int update(DlvAddrDto dto) throws Exception;

    int delete(String custId, int addrNo) throws Exception;

    int deleteAll(String custId) throws Exception;
}
