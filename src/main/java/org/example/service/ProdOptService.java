package org.example.service;

import org.example.domain.ProdOptDto;

import java.util.List;

public interface ProdOptService {
    ProdOptDto getOpt(String prodCd, String optCd) throws Exception;

    List<ProdOptDto> getOptList(String prodCd) throws Exception;
}
