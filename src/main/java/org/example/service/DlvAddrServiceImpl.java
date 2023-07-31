package org.example.service;

import org.example.dao.CustDao;
import org.example.dao.DlvAddrDao;
import org.example.domain.CustDto;
import org.example.domain.DlvAddrDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DlvAddrServiceImpl implements DlvAddrService {
    CustDao custDao;
    DlvAddrDao dlvAddrDao;
    public DlvAddrServiceImpl(CustDao custDao, DlvAddrDao dlvAddrDao) {
        this.custDao = custDao;
        this.dlvAddrDao = dlvAddrDao;
    }

    @Override
    public CustDto getCust(String custId) throws Exception {
        return custDao.selectUser(custId);
    }
    @Override
    public DlvAddrDto getOneAddr(String custId, int addrNo) throws Exception {
        return dlvAddrDao.select(custId, addrNo);
    }
    @Override
    public List<DlvAddrDto> getDlvAddr(String custId) throws Exception {
        return dlvAddrDao.selectAll(custId);
    }
    @Override
    public int getDlvCnt(String custId) throws Exception {
        return dlvAddrDao.count(custId);
    }
    @Override
    public int addDlvAddr(DlvAddrDto dto) throws Exception {
        return dlvAddrDao.insert(dto);
    }
    @Override
    public int modifyDlvAddr(DlvAddrDto dto) throws Exception {
        return dlvAddrDao.update(dto);
    }
}
