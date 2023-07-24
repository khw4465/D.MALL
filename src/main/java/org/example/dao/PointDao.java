package org.example.dao;

import org.example.domain.pointDto;

import java.util.List;
import java.util.Map;

public interface PointDao {
    List<pointDto> select(String id) throws Exception;

    int insert(pointDto pointDto) throws Exception;

    int update(pointDto pointDto) throws Exception;

    List<pointDto> selectAll() throws Exception;

    int count(String id) throws Exception;

    List<pointDto> selectPage(Map map)throws Exception;

    int selectPointId(String id)throws Exception;


}
