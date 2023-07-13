package org.example.dao;

import org.example.domain.NotcDTO;
import org.example.domain.notcSearchCondition;

import java.util.List;
import java.util.Map;

public interface notcDAO {
    NotcDTO select(String BBSO_NO) throws Exception;

    int count();

    int insert(NotcDTO dto) throws Exception;

    int deleteAll();

    int deleteForAdmin(String BBSO_NO);

    int update(NotcDTO dto);

    List<NotcDTO> selectAll();

    List<NotcDTO> selectPage(Map map);

    int increaseViewCnt(Integer NOTC_CNT);


    public List<NotcDTO> searchSelectPage(notcSearchCondition sc) throws Exception;


    public int searchResultCnt(notcSearchCondition sc) throws Exception;
}
