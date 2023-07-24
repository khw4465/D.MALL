package org.example.dao;

import org.example.domain.NotcDto;
import org.example.domain.NotcSearchCondition;

import java.util.List;
import java.util.Map;

public interface NotcDao {
    NotcDto select(Integer bbsoNo) throws Exception;

    int count();

    int insert(NotcDto dto) throws Exception;

    int deleteAll();

    int deleteForAdmin(Integer bbsoNo);

    int update(NotcDto dto);

    List<NotcDto> selectAll();

    List<NotcDto> selectPage(Map map);

    int increaseViewCnt(Integer bbsoNo);


    public List<NotcDto> searchSelectPage(NotcSearchCondition sc) throws Exception;


    public int searchResultCnt(NotcSearchCondition sc) throws Exception;
}
