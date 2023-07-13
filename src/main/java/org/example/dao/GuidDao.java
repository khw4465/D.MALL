package org.example.dao;

import org.example.domain.GuidDto;

import java.util.List;
import java.util.Map;
public interface GuidDao {
    GuidDto select(String bbsoNo);

    int count();

    int insert(GuidDto dto);

    int deleteAll();

    int deleteForAdmin(String bbsoNo);

    List<GuidDto> selectAll();

    List<GuidDto> selectPage(Map map);


    int update(GuidDto dto);
}
