package org.example.domain;

import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.Date;

@Component
public class
ProdPrcHistDto {
    private String prcHistNo; // 상품가격변동이력번호
    private String prodCd; // 상품코드
    private BigDecimal updPrc; // 변경후가격
    private String resnChg; // 변경사유
    private String chgDttm; // 변경일시
    private String custId; // 회원아이디
    private String remark; // 비고
    private Date fst_reg; //최초등록일시
    private String fst_regr; //최초등록자식별번호
    private Date last_upd; //최종수정일시
    private String last_updr; //최종수정자식별번호

    public String getPrcHistNo() {
        return prcHistNo;
    }

    public void setPrcHistNo(String prcHistNo) {
        this.prcHistNo = prcHistNo;
    }

    public String getProdCd() {
        return prodCd;
    }

    public void setProdCd(String prodCd) {
        this.prodCd = prodCd;
    }

    public BigDecimal getUpdPrc() {
        return updPrc;
    }

    public void setUpdPrc(BigDecimal updPrc) {
        this.updPrc = updPrc;
    }

    public String getResnChg() {
        return resnChg;
    }

    public void setResnChg(String resnChg) {
        this.resnChg = resnChg;
    }

    public String getChgDttm() {
        return chgDttm;
    }

    public void setChgDttm(String chgDttm) {
        this.chgDttm = chgDttm;
    }

    public String getCustId() {
        return custId;
    }

    public void setCustId(String custId) {
        this.custId = custId;
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
        return "ProdPrcHistDto{" +
                "prcHistNo='" + prcHistNo + '\'' +
                ", prodCd='" + prodCd + '\'' +
                ", updPrc=" + updPrc +
                ", resnChg='" + resnChg + '\'' +
                ", chgDttm='" + chgDttm + '\'' +
                ", custId='" + custId + '\'' +
                ", remark='" + remark + '\'' +
                ", fst_reg=" + fst_reg +
                ", fst_regr='" + fst_regr + '\'' +
                ", last_upd=" + last_upd +
                ", last_updr='" + last_updr + '\'' +
                '}';
    }
}
