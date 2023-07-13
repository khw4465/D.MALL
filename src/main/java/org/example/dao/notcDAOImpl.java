package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.NotcDTO;
import org.example.domain.notcSearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class notcDAOImpl implements notcDAO {
    @Autowired
    private SqlSession session;

    private String namespace = "org.example.dao.notcMapper.";


    @Override
    public NotcDTO select(String BBSO_NO) throws Exception{
        return session.selectOne(namespace+"select",BBSO_NO);
    }

    @Override
    public int count(){
        return session.selectOne(namespace+"count");
    }

    @Override
    public int insert(NotcDTO dto) throws Exception{
        return session.insert(namespace+"insert", dto);
    }

    @Override
    public int deleteAll(){
        return session.delete(namespace+"deleteAll");
    }

    @Override
    public int deleteForAdmin(String BBSO_NO){
        Map map = new HashMap();
        map.put("BBSO_NO", BBSO_NO);
        return session.delete(namespace+"delete", map);
    }

    @Override
    public int update(NotcDTO dto){
        return session.update(namespace+"update", dto);
    }

    @Override
    public List<NotcDTO> selectAll(){
        return session.selectList(namespace+"selectAll");
    }

    @Override
    public List<NotcDTO> selectPage(Map map){
        return session.selectList(namespace+"selectPage",map);
    }
    @Override
    public int increaseViewCnt(Integer NOTC_CNT){
        return session.update(namespace+"increaseViewCnt",NOTC_CNT);
    }

    @Override
    public List<NotcDTO> searchSelectPage(notcSearchCondition sc) throws Exception{
        System.out.println("DAO = " + session.selectList(namespace+"searchSelectPage", sc));
        return session.selectList(namespace + "searchSelectPage", sc);
    }

    @Override
    public int searchResultCnt(notcSearchCondition sc) throws Exception{
        return session.selectOne(namespace+"searchResultCnt",sc);
    }
}
