package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.CustStatsDto;
import org.example.domain.LoginHistoryDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CustLoginHistDaoImpl implements CustLoginHistDao{

    @Autowired
    private SqlSession session;
    private static String namespace = "org.example.dao.loginHistMapper.";

    public LoginHistoryDTO select(String custId) throws Exception{
        return session.selectOne(namespace+"select",custId);
    }

    public int insert(LoginHistoryDTO loginHistoryDTO) throws Exception{
        return session.insert(namespace+"insert",loginHistoryDTO);
    }

    public List<LoginHistoryDTO> selectAll() throws Exception{
        return session.selectList(namespace+"selectAll");
    }

    @Override
    public int count(String custId) throws Exception {
        return session.selectOne(namespace+"count",custId);
    }
    public int countAll() throws Exception {
        return session.selectOne(namespace+"countAll");
    }
    public LoginHistoryDTO FailCountSelect(String custId) throws Exception {
        return session.selectOne(namespace+"resetFailCountSelect",custId);
    }
    public int FailCountUpdate(LoginHistoryDTO loginHistoryDTO) throws Exception {
        return session.update(namespace+"resetFailCountUpdate",loginHistoryDTO);
    }
    public List<LoginHistoryDTO> selectPage(Map map) throws Exception {
        return session.selectList(namespace+"selectPage",map);
    }


}
