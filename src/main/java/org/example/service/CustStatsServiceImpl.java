package org.example.service;

import org.checkerframework.checker.units.qual.A;
import org.example.dao.CustStatsDao;
import org.example.domain.CustStatsDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustStatsServiceImpl implements CustStatsService{

    @Autowired
    CustStatsDao custStatsDao;

    @Override
    public List<CustStatsDto> selectAllLoginStats() throws Exception {
        return custStatsDao.selectStats();
    }
}
