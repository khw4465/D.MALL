package org.example.service;

import org.example.domain.notcDTO;

import java.util.List;
import java.util.Map;

public interface NotcService {
    int getCount();

    int remove(String BBSO_NO);

    int write(notcDTO dto) throws Exception;

    List<notcDTO> getList() throws Exception;

    notcDTO read(String BBSO_NO, Integer NOTC_CNT) throws Exception;

    List<notcDTO> getPage(Map map);

    int modify(notcDTO dto);
}
