package org.example.service;

import org.example.domain.NotcDto;
import org.example.domain.NotcSearchCondition;

import java.util.List;
import java.util.Map;

public interface NotcService {
    int getCount();

    int remove(Integer bbsoNo);

    int write(NotcDto dto) throws Exception;

    List<NotcDto> getList() throws Exception;

    NotcDto read(Integer bbsoNo) throws Exception;

    List<NotcDto> getPage(Map map);

    int modify(NotcDto dto);

    List<NotcDto> getSearchResultPage(NotcSearchCondition sc) throws Exception;

    int getSearchResultCnt(NotcSearchCondition sc) throws Exception;

}
