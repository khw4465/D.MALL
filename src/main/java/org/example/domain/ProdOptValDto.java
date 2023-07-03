package org.example.domain;

import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.Date;

@Component
public class ProdOptValDto {
    private String prodCd; // 상품코드
    private String sn; // 일련번호
    private String optName1; // 상품옵션명1
    private String optName2; // 상품옵션명2
    private String optName3; // 상품옵션명3
    private String optVal1; // 상품옵션값1
    private String optValUnit1; // 상품옵션값1 단위
    private String optVal2; // 상품옵션값2
    private String optValUnit2; // 상품옵션값2 단위
    private String optVal3; // 상품옵션값3
    private String optValUnit3; // 상품옵션값3 단위
    private BigDecimal qty; // 상품 수량
    private String qtyUnit; // 상품 수량 단위
    private String prcIncDec; // 가격의 증가, 감소 여부
    private BigDecimal optPrc; // 상품옵션별 가격(숫자)
    private String useYn; // 사용여부
    private String remark; // 비고
    private Date fst_reg; //최초등록일시
    private String fst_regr; //최초등록자식별번호
    private Date last_upd; //최종수정일시
    private String last_updr; //최종수정자식별번호

    public String getProdCd() {
        return prodCd;
    }

    public void setProdCd(String prodCd) {
        this.prodCd = prodCd;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public String getOptName1() {
        return optName1;
    }

    public void setOptName1(String optName1) {
        this.optName1 = optName1;
    }

    public String getOptName2() {
        return optName2;
    }

    public void setOptName2(String optName2) {
        this.optName2 = optName2;
    }

    public String getOptName3() {
        return optName3;
    }

    public void setOptName3(String optName3) {
        this.optName3 = optName3;
    }

    public String getOptVal1() {
        return optVal1;
    }

    public void setOptVal1(String optVal1) {
        this.optVal1 = optVal1;
    }

    public String getOptValUnit1() {
        return optValUnit1;
    }

    public void setOptValUnit1(String optValUnit1) {
        this.optValUnit1 = optValUnit1;
    }

    public String getOptVal2() {
        return optVal2;
    }

    public void setOptVal2(String optVal2) {
        this.optVal2 = optVal2;
    }

    public String getOptValUnit2() {
        return optValUnit2;
    }

    public void setOptValUnit2(String optValUnit2) {
        this.optValUnit2 = optValUnit2;
    }

    public String getOptVal3() {
        return optVal3;
    }

    public void setOptVal3(String optVal3) {
        this.optVal3 = optVal3;
    }

    public String getOptValUnit3() {
        return optValUnit3;
    }

    public void setOptValUnit3(String optValUnit3) {
        this.optValUnit3 = optValUnit3;
    }

    public BigDecimal getQty() {
        return qty;
    }

    public void setQty(BigDecimal qty) {
        this.qty = qty;
    }

    public String getQtyUnit() {
        return qtyUnit;
    }

    public void setQtyUnit(String qtyUnit) {
        this.qtyUnit = qtyUnit;
    }

    public String getPrcIncDec() {
        return prcIncDec;
    }

    public void setPrcIncDec(String prcIncDec) {
        this.prcIncDec = prcIncDec;
    }

    public BigDecimal getOptPrc() {
        return optPrc;
    }

    public void setOptPrc(BigDecimal optPrc) {
        this.optPrc = optPrc;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getFst_reg() {
        return fst_reg;
    }

    public void setFst_reg(Date fst_reg) {
        this.fst_reg = fst_reg;
    }

    public String getFst_regr() {
        return fst_regr;
    }

    public void setFst_regr(String fst_regr) {
        this.fst_regr = fst_regr;
    }

    public Date getLast_upd() {
        return last_upd;
    }

    public void setLast_upd(Date last_upd) {
        this.last_upd = last_upd;
    }

    public String getLast_updr() {
        return last_updr;
    }

    public void setLast_updr(String last_updr) {
        this.last_updr = last_updr;
    }

    @Override
    public String toString() {
        return "ProdOptValDto{" +
                "prodCd='" + prodCd + '\'' +
                ", sn='" + sn + '\'' +
                ", optName1='" + optName1 + '\'' +
                ", optName2='" + optName2 + '\'' +
                ", optName3='" + optName3 + '\'' +
                ", optVal1='" + optVal1 + '\'' +
                ", optValUnit1='" + optValUnit1 + '\'' +
                ", optVal2='" + optVal2 + '\'' +
                ", optValUnit2='" + optValUnit2 + '\'' +
                ", optVal3='" + optVal3 + '\'' +
                ", optValUnit3='" + optValUnit3 + '\'' +
                ", qty=" + qty +
                ", qtyUnit='" + qtyUnit + '\'' +
                ", prcIncDec='" + prcIncDec + '\'' +
                ", optPrc=" + optPrc +
                ", useYn='" + useYn + '\'' +
                ", remark='" + remark + '\'' +
                ", fst_reg=" + fst_reg +
                ", fst_regr='" + fst_regr + '\'' +
                ", last_upd=" + last_upd +
                ", last_updr='" + last_updr + '\'' +
                '}';
    }
}