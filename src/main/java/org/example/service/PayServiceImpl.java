package org.example.service;

import org.example.dao.CustDao;
import org.example.dao.DlvAddrDao;
import org.example.domain.CustDto;
import org.example.domain.DlvAddrDto;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PayServiceImpl implements PayService {
    CustDao custDao;
    DlvAddrDao dlvAddrDao;
    public PayServiceImpl(CustDao custDao, DlvAddrDao dlvAddrDao) {
        this.custDao = custDao;
        this.dlvAddrDao = dlvAddrDao;
    }

    @Override
    public CustDto getCust(String custId) throws Exception {
        return custDao.selectUser(custId);
    }
    @Override
    public List<DlvAddrDto> getDlvAddr(String custId) throws Exception {
        List<DlvAddrDto> list = new ArrayList<>();
        DlvAddrDto dto = dlvAddrDao.select(custId);
        list.add(dto);
        return list;
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
