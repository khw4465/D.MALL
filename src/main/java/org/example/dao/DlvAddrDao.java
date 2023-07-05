package org.example.dao;

import org.example.domain.DlvAddrDto;

public interface DlvAddrDao {
    DlvAddrDto select(String custId) throws Exception;

    int insert(DlvAddrDto dto) throws Exception;

    int update(DlvAddrDto dto) throws Exception;
}
