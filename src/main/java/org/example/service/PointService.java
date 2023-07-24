package org.example.service;

import org.example.domain.pointDto;

import java.util.List;

public interface PointService {
    List<pointDto> selectPoint(String id) throws Exception;
    int insertPoint(pointDto pointDto) throws Exception;
    int updatePoint(pointDto pointDto) throws Exception;
    List<pointDto> selectAllPoint() throws Exception;
    int countPoint(String id) throws Exception;
}
