package org.example.dao;

import org.example.domain.CateMainDto;

import java.util.List;

public interface CateMainDao {
    List<String> getCateCd() throws Exception;

    List<CateMainDto> selectAll() throws Exception;
}
