package org.example.service;

import org.example.dao.PointDao;
import org.example.domain.pointDto;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PointServiceImpl implements PointService{

    //@Autowired
    PointDao pointDao;

    public PointServiceImpl(PointDao pointDao) {
        this.pointDao = pointDao; // 생성자주입
    }

    @Override
    public List<pointDto> selectPoint(String id) throws Exception {
        return pointDao.select(id);
    }

    @Override
    public int insertPoint(pointDto pointDto) throws Exception {
        return pointDao.insert(pointDto);
    }

    @Override
    public int updatePoint(pointDto pointDto) throws Exception {
        return pointDao.update(pointDto);
    }

    @Override
    public List<pointDto> selectAllPoint() throws Exception {
        return pointDao.selectAll();
    }

    @Override
    public int countPoint(String id) throws Exception {
        return pointDao.count(id);
    }

    @Override
    public List<pointDto> selectPointPage(Map map) throws Exception {
        return pointDao.selectPage(map);
    }

    @Override
    public pointDto selectPointOne(String id) throws Exception {
        return pointDao.selectOne(id);
    }

}
