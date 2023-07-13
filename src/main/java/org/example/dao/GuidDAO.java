package org.example.dao;

import org.example.domain.guidDTO;

import java.util.List;
import java.util.Map;
public interface GuidDAO {
    guidDTO select(String BBSO_NO);

    int count();

    int insert(guidDTO dto);

    int deleteAll();

    int deleteForAdmin(String BBSO_NO);

    List<guidDTO> selectAll();

    List<guidDTO> selectPage(Map map);


    int update(guidDTO dto);
}
