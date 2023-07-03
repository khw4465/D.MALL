package org.example.domain;

import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Date;

@Component
public class RecentViewProdDto {

    private String custId; // 회원아이디
    private String prodCd; // 상품코드
    private LocalDateTime recentViewDttm; // 최근본날짜
    private LocalDateTime fstReg; // 최초등록일시
    private String fstRegr; // 최초등록자식별번호
    private LocalDateTime lastUpd; // 최종수정일시
    private String lastUpdr; // 최종수정자식별번호
    private Date fst_reg; //최초등록일시
    private String fst_regr; //최초등록자식별번호
    private Date last_upd; //최종수정일시
    private String last_updr; //최종수정자식별번호

    public String getCustId() {
        return custId;
    }

    public void setCustId(String custId) {
        this.custId = custId;
    }

    public String getProdCd() {
        return prodCd;
    }

    public void setProdCd(String prodCd) {
        this.prodCd = prodCd;
    }

    public LocalDateTime getRecentViewDttm() {
        return recentViewDttm;
    }

    public void setRecentViewDttm(LocalDateTime recentViewDttm) {
        this.recentViewDttm = recentViewDttm;
    }

    public LocalDateTime getFstReg() {
        return fstReg;
    }

    public void setFstReg(LocalDateTime fstReg) {
        this.fstReg = fstReg;
    }

    public String getFstRegr() {
        return fstRegr;
    }

    public void setFstRegr(String fstRegr) {
        this.fstRegr = fstRegr;
    }

    public LocalDateTime getLastUpd() {
        return lastUpd;
    }

    public void setLastUpd(LocalDateTime lastUpd) {
        this.lastUpd = lastUpd;
    }

    public String getLastUpdr() {
        return lastUpdr;
    }

    public void setLastUpdr(String lastUpdr) {
        this.lastUpdr = lastUpdr;
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
        return "RecentViewProdDto{" +
                "custId='" + custId + '\'' +
                ", prodCd='" + prodCd + '\'' +
                ", recentViewDttm=" + recentViewDttm +
                ", fstReg=" + fstReg +
                ", fstRegr='" + fstRegr + '\'' +
                ", lastUpd=" + lastUpd +
                ", lastUpdr='" + lastUpdr + '\'' +
                ", fst_reg=" + fst_reg +
                ", fst_regr='" + fst_regr + '\'' +
                ", last_upd=" + last_upd +
                ", last_updr='" + last_updr + '\'' +
                '}';
    }
}
