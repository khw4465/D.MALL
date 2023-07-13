package org.example.service;

import org.example.domain.GuidDto;

import java.util.List;
import java.util.Map;

public interface GuidService {
    int getCount();

    int remove(String bbsoNo);

    int write(GuidDto dto);

    List<GuidDto> getList();

    GuidDto read(String bbsoNo);

    List<GuidDto> getPage(Map map);

    int modify(GuidDto dto);

}
