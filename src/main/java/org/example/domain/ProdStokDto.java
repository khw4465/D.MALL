package org.example.domain;

import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.Date;

@Component
public class ProdStokDto {
    private String prodCd;        // 상품번호
    private BigDecimal prodStok;  // 상품재고
    private BigDecimal safeStok;  // 안전재고
    private String custId;        // 회원아이디
    private String stokLocCd;     // 상품 재고 위치코드
    private String prodDisCd;     // 상품 출고 이력코드
    private String prodRecCd;     // 상품 입고 이력코드
    private String remark;        // 비고
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

    public BigDecimal getProdStok() {
        return prodStok;
    }

    public void setProdStok(BigDecimal prodStok) {
        this.prodStok = prodStok;
    }

    public BigDecimal getSafeStok() {
        return safeStok;
    }

    public void setSafeStok(BigDecimal safeStok) {
        this.safeStok = safeStok;
    }

    public String getCustId() {
        return custId;
    }

    public void setCustId(String custId) {
        this.custId = custId;
    }

    public String getStokLocCd() {
        return stokLocCd;
    }

    public void setStokLocCd(String stokLocCd) {
        this.stokLocCd = stokLocCd;
    }

    public String getProdDisCd() {
        return prodDisCd;
    }

    public void setProdDisCd(String prodDisCd) {
        this.prodDisCd = prodDisCd;
    }

    public String getProdRecCd() {
        return prodRecCd;
    }

    public void setProdRecCd(String prodRecCd) {
        this.prodRecCd = prodRecCd;
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
        return "ProdStokDto{" +
                "prodCd='" + prodCd + '\'' +
                ", prodStok=" + prodStok +
                ", safeStok=" + safeStok +
                ", custId='" + custId + '\'' +
                ", stokLocCd='" + stokLocCd + '\'' +
                ", prodDisCd='" + prodDisCd + '\'' +
                ", prodRecCd='" + prodRecCd + '\'' +
                ", remark='" + remark + '\'' +
                ", fst_reg=" + fst_reg +
                ", fst_regr='" + fst_regr + '\'' +
                ", last_upd=" + last_upd +
                ", last_updr='" + last_updr + '\'' +
                '}';
    }
}
