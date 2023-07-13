package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.faqDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("faqDAO")
public class faqDAOImpl implements faqDAO {
    @Autowired
    SqlSession session;

    private String namespace = "org.example.dao.faqMapper.";

    @Override
    public faqDTO select(String BBSO_NO){
        return session.selectOne(namespace+"select",BBSO_NO);
    }
    @Override
    public int count(){
        return session.selectOne(namespace+"count");
    }
    @Override
    public int insert(faqDTO dto) {
        return session.insert(namespace+"insert",dto);
    }
    @Override
    public int deleteAll(){
        return session.delete(namespace+"deleteAll");
    }
    @Override
    public int deleteForAdmin(String BBSO_NO){
        Map map = new HashMap();
        map.put("BBSO_NO", BBSO_NO);
        return session.delete(namespace+"delete",map);
    }
    @Override
    public List<faqDTO> selectAll(){
        return session.selectList(namespace+"selectAll");
    }
    @Override
    public List<faqDTO> selectPage(Map map){
        return session.selectList(namespace+"selectPage",map);
    }
    @Override
    public int update(faqDTO dto){
        return session.update(namespace+"update", dto);
    }
}
