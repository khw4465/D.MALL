package org.example.service;

import org.example.dao.CustDao;
import org.example.domain.CustDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service

public class CustServiceImpl implements CustService{
    //@Autowired
    CustDao custDao;

    public CustServiceImpl(CustDao custDao) { //생성자주입
        this.custDao = custDao;
    }

    @Override
    public List<CustDto> getCustList() throws Exception {
        //   throw new Exception("test");
        return custDao.selectAllUser(); // 관리자화면에 사용할 전체 유저 불러오기
    }
        // 업데이트용 셀렉트일경우 걸수도있음.
    @Override
    @Transactional(rollbackFor = Exception.class) //  예외가 터지면 롤백친다.
    public String findCustId(CustDto custDto) throws Exception {
        //   throw new Exception("test");
        return custDao.findid(custDto);
    }

    @Override
    @Transactional(rollbackFor = Exception.class) //  예외가 터지면 롤백친다.
    public CustDto loginCust(String id) throws Exception {
        //   throw new Exception("test");
        return custDao.selectUser(id);
        //안씀 (나중에 쓰게 만들어야함)
    }

    @Override
    @Transactional(rollbackFor = Exception.class) //  예외가 터지면 롤백친다.
    public int registerCust(CustDto custDto) throws Exception {
        //   throw new Exception("test");
        return custDao.insertUser(custDto);
    }

    @Override
    @Transactional(rollbackFor = Exception.class) //  예외가 터지면 롤백친다.
    public CustDto modifyselect(String id) throws Exception {
        //   throw new Exception("test");
        return custDao.modifyselect(id);
    }

    @Override
    @Transactional(rollbackFor = Exception.class) //  예외가 터지면 롤백친다.
    public int withdrawal(String id) throws Exception {
        //   throw new Exception("test");
        return custDao.deleteUser(id);
    }

    @Override
    @Transactional(rollbackFor = Exception.class) //  예외가 터지면 롤백친다.
    public CustDto temporaryPwd(CustDto custDto) throws Exception {
        //   throw new Exception("test");
        return custDao.temporaryPwd(custDto);
    }

    @Override
    @Transactional(rollbackFor = Exception.class) //  예외가 터지면 롤백친다.
    public int temporaryPwdReturn(CustDto custDto) throws Exception {
        //   throw new Exception("test");
        return custDao.temporaryPwdReturn(custDto);
    }

    @Override
    public int custSms(CustDto custDto) throws Exception {
        return custDao.custSms(custDto);
    }




}
