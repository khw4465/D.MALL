package org.example.dao;

import org.example.domain.FaqDto;

import java.util.List;
import java.util.Map;

public interface FaqDao {
    FaqDto select(String bbsoNo);

    int count();

    int insert(FaqDto dto);

    int deleteAll();

    int deleteForAdmin(String bbsoNo);

    List<FaqDto> selectAll();

    List<FaqDto> selectPage(Map map);

    int update(FaqDto dto);
}
