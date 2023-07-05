package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.DlvAddrDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DlvAddrDaoImpl implements DlvAddrDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "org.example.dao.DlvAddrMapper.";

    @Override
    public DlvAddrDto select(String custId) throws Exception {
        return session.selectOne(namespace + "select", custId);
    }
    @Override
    public int insert(DlvAddrDto dto) throws Exception {
        return session.insert(namespace + "insert", dto);
    }
    @Override
    public int update(DlvAddrDto dto) throws Exception {
        return session.update(namespace + "update", dto);
    }
}
