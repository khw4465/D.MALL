package org.example.dao;

import org.example.domain.faqDTO;

import java.util.List;
import java.util.Map;

public interface faqDAO {
    faqDTO select(String BBSO_NO);

    int count();

    int insert(faqDTO dto);

    int deleteAll();

    int deleteForAdmin(String BBSO_NO);

    List<faqDTO> selectAll();

    List<faqDTO> selectPage(Map map);

    int update(faqDTO dto);
}
