package org.example.domain;

import org.checkerframework.checker.units.qual.C;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;


@Component
public class ProdCateDto {
    private String cateCd; // 분류코드
    private String cateName; // 분류카테고리명
    private String useYn; // 사용여부
    private String cateLv; // 분류레벨(대/중/소)
    private String cateDesc; // 분류카테고리설명
    private String thumImgPath; // 썸네일이미지경로
    private BigDecimal sortOdr; // 정렬순서
    private String remark; // 비고

}
