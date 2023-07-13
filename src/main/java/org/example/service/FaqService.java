package org.example.service;

import org.example.domain.FaqDto;

import java.util.List;
import java.util.Map;

public interface FaqService {
    int getCount();

    int remove(String bbsoNo);

    int write(FaqDto dto);

    FaqDto read(String bbsoNo);

    List<FaqDto> getList();

    List<FaqDto> getPage(Map map);

    int modify(FaqDto dto);
}
