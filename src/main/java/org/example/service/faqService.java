package org.example.service;

import org.example.domain.faqDTO;

import java.util.List;
import java.util.Map;

public interface faqService {
    int getCount();

    int remove(String BBSO_NO);

    int write(faqDTO dto);

    faqDTO read(String BBSO_NO);

    List<faqDTO> getList();

    List<faqDTO> getPage(Map map);

    int modify(faqDTO dto);
}
