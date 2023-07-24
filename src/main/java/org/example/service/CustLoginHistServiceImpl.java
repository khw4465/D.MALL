package org.example.service;

import org.example.dao.CustLoginHistDao;
import org.example.domain.CustStatsDto;
import org.example.domain.LoginHistoryDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Service
public class CustLoginHistServiceImpl implements CustLoginHistService{
    CustLoginHistDao custLoginHistDao;

    public CustLoginHistServiceImpl(CustLoginHistDao custLoginHistDao) {
        this.custLoginHistDao = custLoginHistDao;
    }

    @Override
    public LoginHistoryDTO select(String id) throws Exception {
        return custLoginHistDao.select(id);
    }

    @Override
    public int LoginHistInsert(LoginHistoryDTO loginHistoryDTO) throws Exception {
        return custLoginHistDao.insert(loginHistoryDTO);
    }

    @Override
    public List<LoginHistoryDTO> selectAllLoginHist() throws Exception {
        return custLoginHistDao.selectAll();
    }

    @Override
    public int LoginHistCount(String id) throws Exception {
        return custLoginHistDao.count(id);
    }

    @Override
    public LoginHistoryDTO HistCountSelect(String id) throws Exception {
        return custLoginHistDao.FailCountSelect(id);
    }

    @Override
    public int HistCountUpdate(LoginHistoryDTO loginHistoryDTO) throws Exception {
        //custLoginHistDao.FailCountSelect(loginHistoryDTO.getCustId());
        return custLoginHistDao.FailCountUpdate(loginHistoryDTO);
    } //수정해야함


}
