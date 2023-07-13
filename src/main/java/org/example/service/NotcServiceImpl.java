package org.example.service;

import org.example.dao.notcDAO;
import org.example.domain.NotcDTO;
import org.example.domain.notcSearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
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
    public int write(NotcDTO dto) throws Exception{
        return notcDao.insert(dto);
    }

    @Override
    public List<NotcDTO> getList() throws Exception{
        return notcDao.selectAll();
    }

    @Override
    public NotcDTO read(String BBSO_NO) throws Exception{
        NotcDTO dto = notcDao.select(BBSO_NO);
//        notcDao.increaseViewCnt(BBSO_NO);
        return dto;
    }

    @Override
    public List<NotcDTO> getPage(Map map){
        return notcDao.selectPage(map);
    }

    @Override
    public int modify(NotcDTO dto){
        return notcDao.update(dto);
    }

    @Override
    public List<NotcDTO> getSearchResultPage(notcSearchCondition sc) throws Exception{
//        System.out.println("sc = " + sc);
        System.out.println("NotcService = " + notcDao.searchSelectPage(sc));
        return notcDao.searchSelectPage(sc);
    }

    @Override
    public int getSearchResultCnt(notcSearchCondition sc) throws Exception{
        return notcDao.searchResultCnt(sc);
    }
}
