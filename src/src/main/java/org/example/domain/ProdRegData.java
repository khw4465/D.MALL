package org.example.domain;

import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.Arrays;

@Component
public class ProdRegData {
    ///여기서부터 상품테이블
    private String salesDttmYn; //판매기간 적용여부
    private String disDttmYn; //할인기간 적용여부
    private String prodStartCd; //상품코드 시작번호
    private String clsCd; //분류코드
    private String prodName; //상품명
    private String custId; //회원아이디
    private BigDecimal basePrc; //상품기본가격
    private BigDecimal disPrc; //상품할인가격
    private String disYn; //할인 유무
    private String optYn; //옵션적용여부
    private String dcUnit; //할인단위
    private BigDecimal dcVal; //할인값
    private String[] dataDateTime; //날짜&시간 데이터(할인시작/종료년월일시분, 판매시작/종료 년월일시분// )

    /////////////////////////////////////////////////////////////
    //여기서부터 옵션테이블
    private String[] optName; //상품옵션명
    private String[] optVal1; // 상품옵션값1
    private String[] optVal2; // 상품옵션값2
    private String[] optVal3; // 상품옵션값3
    private String[] optQty; // 상품 옵션별 수량
    private String[] optPrc; //상품 옵션별 가격
    // ///////////////////////////////////////////////////////////
    // 여기서부터 상품재고테이블
    private BigDecimal prodStok; //옵션미적용시 상품 재고
    ////////////////////////

    //상품 이미지 테이블
    private String imgTname; //상품 대표이미지

    private String[] imgDname; //상품 상세 이미지

    public String getImgTname() {
        return imgTname;
    }

    public void setImgTname(String imgTname) {
        this.imgTname = imgTname;
    }

    public String[] getImgDname() {
        return imgDname;
    }

    public void setImgDname(String[] imgDname) {
        this.imgDname = imgDname;
    }

    public String getSalesDttmYn() {
        return salesDttmYn;
    }

    public void setSalesDttmYn(String salesDttmYn) {
        this.salesDttmYn = salesDttmYn;
    }

    public String getDisDttmYn() {
        return disDttmYn;
    }

    public void setDisDttmYn(String disDttmYn) {
        this.disDttmYn = disDttmYn;
    }

    public String getProdStartCd() {
        return prodStartCd;
    }

    public void setProdStartCd(String prodStartCd) {
        this.prodStartCd = prodStartCd;
    }

    public String getClsCd() {
        return clsCd;
    }

    public void setClsCd(String clsCd) {
        this.clsCd = clsCd;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public String getCustId() {
        return custId;
    }

    public void setCustId(String custId) {
        this.custId = custId;
    }

    public BigDecimal getBasePrc() {
        return basePrc;
    }

    public void setBasePrc(BigDecimal basePrc) {
        this.basePrc = basePrc;
    }

    public BigDecimal getDisPrc() {
        return disPrc;
    }

    public void setDisPrc(BigDecimal disPrc) {
        this.disPrc = disPrc;
    }

    public String getDisYn() {
        return disYn;
    }

    public void setDisYn(String disYn) {
        this.disYn = disYn;
    }

    public String getOptYn() {
        return optYn;
    }

    public void setOptYn(String optYn) {
        this.optYn = optYn;
    }

    public String getDcUnit() {
        return dcUnit;
    }

    public void setDcUnit(String dcUnit) {
        this.dcUnit = dcUnit;
    }

    public BigDecimal getDcVal() {
        return dcVal;
    }

    public void setDcVal(BigDecimal dcVal) {
        this.dcVal = dcVal;
    }

    public String[] getDataDateTime() {
        return dataDateTime;
    }

    public void setDataDateTime(String[] dataDateTime) {
        this.dataDateTime = dataDateTime;
    }

    public String[] getOptName() {
        return optName;
    }

    public void setOptName(String[] optName) {
        this.optName = optName;
    }

    public String[] getOptVal1() {
        return optVal1;
    }

    public void setOptVal1(String[] optVal1) {
        this.optVal1 = optVal1;
    }

    public String[] getOptVal2() {
        return optVal2;
    }

    public void setOptVal2(String[] optVal2) {
        this.optVal2 = optVal2;
    }

    public String[] getOptVal3() {
        return optVal3;
    }

    public void setOptVal3(String[] optVal3) {
        this.optVal3 = optVal3;
    }

    public String[] getOptQty() {
        return optQty;
    }

    public void setOptQty(String[] optQty) {
        this.optQty = optQty;
    }

    public String[] getOptPrc() {
        return optPrc;
    }

    public void setOptPrc(String[] optPrc) {
        this.optPrc = optPrc;
    }

    public BigDecimal getProdStok() {
        return prodStok;
    }

    public void setProdStok(BigDecimal prodStok) {
        this.prodStok = prodStok;
    }

    @Override
    public String toString() {
        return "ProdRegData{" +
                "salesDttmYn='" + salesDttmYn + '\'' +
                ", disDttmYn='" + disDttmYn + '\'' +
                ", prodStartCd='" + prodStartCd + '\'' +
                ", clsCd='" + clsCd + '\'' +
                ", prodName='" + prodName + '\'' +
                ", custId='" + custId + '\'' +
                ", basePrc=" + basePrc +
                ", disPrc=" + disPrc +
                ", disYn='" + disYn + '\'' +
                ", optYn='" + optYn + '\'' +
                ", dcUnit='" + dcUnit + '\'' +
                ", dcVal=" + dcVal +
                ", dataDateTime=" + Arrays.toString(dataDateTime) +
                ", optName=" + Arrays.toString(optName) +
                ", optVal1=" + Arrays.toString(optVal1) +
                ", optVal2=" + Arrays.toString(optVal2) +
                ", optVal3=" + Arrays.toString(optVal3) +
                ", optQty=" + Arrays.toString(optQty) +
                ", optPrc=" + Arrays.toString(optPrc) +
                ", prodStok=" + prodStok +
                ", imgTname='" + imgTname + '\'' +
                ", imgDname=" + Arrays.toString(imgDname) +
                '}';
    }
}