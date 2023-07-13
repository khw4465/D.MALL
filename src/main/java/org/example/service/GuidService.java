package org.example.service;

import org.example.domain.guidDTO;

import java.util.List;
import java.util.Map;

public interface GuidService {
    int getCount();

    int remove(String BBSO_NO);

    int write(guidDTO dto);

    List<guidDTO> getList();

    guidDTO read(String BBSO_NO);

    List<guidDTO> getPage(Map map);

    int modify(guidDTO dto);

}
