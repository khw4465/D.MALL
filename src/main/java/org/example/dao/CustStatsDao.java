package org.example.dao;

import org.example.domain.CustStatsDto;

import java.util.List;

public interface CustStatsDao {
    List<CustStatsDto> selectStats() throws Exception;
}
