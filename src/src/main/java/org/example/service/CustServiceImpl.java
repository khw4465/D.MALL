package org.example.service;

import org.example.dao.CustDao;
import org.example.domain.CustDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustServiceImpl implements CustService{
    @Autowired
    CustDao custDao;

    @Override
    public List<CustDto> getCustList() throws Exception {
        return custDao.selectAllUser(); // 관리자화면에 사용할 전체 유저 불러오기
    }

    @Override
    public String findCustId(CustDto custDto) throws Exception {
        return custDao.findid(custDto);
    }

    @Override
    public CustDto loginCust(String id) throws Exception {
        return custDao.selectUser(id);
    }

    @Override
    public int registerCust(CustDto custDto) throws Exception {
        return custDao.insertUser(custDto);
    }


}
