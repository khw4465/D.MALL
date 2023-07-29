package org.example.service;

import org.example.domain.pointDto;

import java.util.List;
import java.util.Map;

public interface PointService {
    List<pointDto> selectPoint(String id) throws Exception; //폐기
    int insertPoint(pointDto pointDto) throws Exception;
    int updatePoint(pointDto pointDto) throws Exception;
    List<pointDto> selectAllPoint() throws Exception;
    int countPoint(String id) throws Exception;
    List<pointDto> selectPointPage(Map map)throws Exception;
    pointDto selectPointOne(String id) throws Exception;
}
