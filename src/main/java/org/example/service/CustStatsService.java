package org.example.service;

import org.example.domain.CustStatsDto;

import java.util.List;

public interface CustStatsService {

    List<CustStatsDto> selectAllLoginStats() throws Exception;

}
