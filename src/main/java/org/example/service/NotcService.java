package org.example.service;

import org.example.domain.NotcDTO;
import org.example.domain.notcSearchCondition;

import java.util.List;
import java.util.Map;

public interface NotcService {
    int getCount();

    int remove(String BBSO_NO);

    int write(NotcDTO dto) throws Exception;

    List<NotcDTO> getList() throws Exception;

    NotcDTO read(String BBSO_NO) throws Exception;

    List<NotcDTO> getPage(Map map);

    int modify(NotcDTO dto);

     List<NotcDTO> getSearchResultPage(notcSearchCondition sc) throws Exception;

     int getSearchResultCnt(notcSearchCondition sc) throws Exception;

}
