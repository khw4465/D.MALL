package org.example.service;

import org.example.dao.notcDAO;
import org.example.domain.notcDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class NotcServiceImpl implements NotcService {
    @Autowired
    notcDAO notcDao;

    @Override
    public int getCount(){
        return notcDao.count();
    }

    @Override
    public int remove(String BBSO_NO){
        return notcDao.deleteForAdmin(BBSO_NO);
    }

    @Override
    public int write(notcDTO dto) throws Exception{
        return notcDao.insert(dto);
    }

    @Override
    public List<notcDTO> getList() throws Exception{
        return notcDao.selectAll();
    }

    @Override
    public notcDTO read(String BBSO_NO, Integer NOTC_CNT) throws Exception{
        notcDTO dto = notcDao.select(BBSO_NO);
        notcDao.increaseViewCnt(NOTC_CNT);
        return dto;
    }

    @Override
    public List<notcDTO> getPage(Map map){
        return notcDao.selectPage(map);
    }

    @Override
    public int modify(notcDTO dto){
        return notcDao.update(dto);
    }
}
