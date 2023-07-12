package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.DlvAddrDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class DlvAddrDaoImpl implements DlvAddrDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "org.example.dao.DlvAddrMapper.";

    @Override
    public DlvAddrDto select(String custId, int addrNo) throws Exception {   // 회원의 배송지 1개를 가져오는 메서드
        Map map = new HashMap();
        map.put("custId", custId);
        map.put("addrNo", addrNo);
        return session.selectOne(namespace + "select", map);
    }
    @Override
    public List<DlvAddrDto> selectAll(String custId) throws Exception {
        return session.selectList(namespace + "selectAll", custId);
    }
    @Override
    public int count(String custId) throws Exception {
        return session.selectOne(namespace + "count", custId);
    }
    @Override
    public int insert(DlvAddrDto dto) throws Exception {    // 배송지 추가
        return session.insert(namespace + "insert", dto);
    }
    @Override
    public int update(DlvAddrDto dto) throws Exception {    // 배송지 변경
        return session.update(namespace + "update", dto);
    }
    @Override
    public int delete(String custId, int addrNo) throws Exception {
        Map map = new HashMap();
        map.put("custId", custId);
        map.put("addrNo", addrNo);
        return session.delete(namespace + "delete", map);
    }
    @Override
    public int deleteAll(String custId) throws Exception {
        return session.delete(namespace + "count", custId);
    }
}
