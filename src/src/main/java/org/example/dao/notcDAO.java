package org.example.dao;

import org.example.domain.notcDTO;

import java.util.List;
import java.util.Map;

public interface notcDAO {
    notcDTO select(String BBSO_NO) throws Exception;

    int count();

    int insert(notcDTO dto) throws Exception;

    int deleteAll();

    int deleteForAdmin(String BBSO_NO);

    int update(notcDTO dto);

    List<notcDTO> selectAll();

    List<notcDTO> selectPage(Map map);

    int increaseViewCnt(Integer NOTC_CNT);
}
