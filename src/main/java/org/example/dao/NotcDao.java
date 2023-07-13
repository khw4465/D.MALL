package org.example.dao;

import org.example.domain.NotcDto;
import org.example.domain.NotcSearchCondition;

import java.util.List;
import java.util.Map;

public interface NotcDao {
    NotcDto select(String bbsoNo) throws Exception;

    int count();

    int insert(NotcDto dto) throws Exception;

    int deleteAll();

    int deleteForAdmin(String bbsoNo);

    int update(NotcDto dto);

    List<NotcDto> selectAll();

    List<NotcDto> selectPage(Map map);

    int increaseViewcnt(Integer notccnt);


    public List<NotcDto> searchSelectPage(NotcSearchCondition sc) throws Exception;


    public int searchResultcnt(NotcSearchCondition sc) throws Exception;
}
