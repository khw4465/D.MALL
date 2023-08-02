package org.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.example.domain.OrderDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class OrderListDaoImpl implements OrderListDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "org.example.dao.OrderMapper.";
    @Override
    public OrderDto select(Map map) throws Exception {      // 회원이 주문한 목록의 주문번호로 1개의 주문내역 반환
        return session.selectOne(namespace + "select", map);
    }
    @Override
    public OrderDto getLastOrd(String custId) throws Exception {
        return session.selectOne(namespace + "lastOrder", custId);
    }
    @Override
    public List<OrderDto> selectByMonth(Map map) throws Exception {     // 현재부터 N개월 전까지의 주문내역 리스트 반환
        return session.selectList(namespace + "selectAllByMonth", map);
    }
    @Override
    public List<OrderDto> selectByDate(Map map) throws Exception {      // 특정 기간을 지정해서 조회하여 리스트 반환
        return session.selectList(namespace + "selectAllByDate", map);
    }
    @Override
    public List<OrderDto> getAllOrd(Map map) throws Exception {
        return session.selectList(namespace + "getAllOrd", map);
    }
    @Override
    public int count() throws Exception {
        return session.selectOne(namespace + "count");
    }
    @Override
    public int insert(OrderDto dto) throws Exception {
        return session.insert(namespace + "insert", dto);
    }
    @Override
    public int updOrdStatus(OrderDto dto) throws Exception {    // 주문확정, 취소, 반품으로 상태를 업데이트하기 위한 메서드
        return session.update(namespace + "update", dto);
    }

//    @Override
//    public List<OrderDto> selectAllPage() throws Exception {
//        return session.selectList(namespace + "selectAll");
//    }
//
    @Override
    public List<OrderDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace + "selectPage", map);
    }
}
