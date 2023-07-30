package org.example.dao;

import org.example.domain.CustDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
public class CustDaoImpl implements CustDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "org.example.dao.custMapper.";
    @Override
    public CustDto selectUser(String id) throws Exception {
        return session.selectOne(namespace+"select", id);
    }
    @Override
    public int insertUser(CustDto custDto) throws Exception {
        return session.insert(namespace+"insert",custDto);
    }
    @Override
    public int deleteUser(String id) throws Exception {
        return session.delete(namespace+"delete",id);
    }
    @Override
    public int updateUser(CustDto custDto) throws Exception {
        return session.update(namespace+"update",custDto);
    }
    @Override

    public List<CustDto> selectAllUser() throws Exception {
        return session.selectList(namespace+"selectAll");
    }
    @Override
    public int deleteAll() throws Exception {
        return session.delete(namespace+"deleteAll");
    }
    @Override
    public int count() throws Exception {
        return session.selectOne(namespace+"count");
    }
    @Override
    public String findid(CustDto custDto) throws Exception {
        return session.selectOne(namespace+"findid",custDto);
    }

    @Override
    public CustDto modifyselect(String id) throws Exception {
        return session.selectOne(namespace+"modifyselect",id);
    }

    @Override
    public CustDto temporaryPwd(CustDto dto) throws Exception {
        return session.selectOne(namespace+"temporaryPwd",dto);
    }

    @Override
    public int temporaryPwdReturn(CustDto dto) throws Exception {
        return session.update(namespace+"temporaryPwdReturn",dto);
    }

    @Override
    public int custSms(CustDto dto) throws Exception {
        return session.update(namespace+"custSms",dto);
    }

    @Override
    public List<CustDto> selectAllCustPage(Map map) throws Exception {
        return session.selectList(namespace+"selectPage",map);
    }


}
