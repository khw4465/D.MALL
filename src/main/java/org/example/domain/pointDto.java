package org.example.domain;

import java.time.LocalDateTime;
import java.util.Objects;

public class pointDto {
    private int pntId;
    private String custId;
    private String stus;
    private int chngPnt;
    private int point;
    private LocalDateTime dttm;
    private LocalDateTime expiDttm;
    private String chgCn;
    private String remark;
    private String pntCd;
    private LocalDateTime fstReg;
    private String fstRegr;
    private LocalDateTime lastUpd;
    private String lastUpdr;

    public pointDto(){};
    public pointDto(int pntId, String custId, String stus, int chngPnt, int point, LocalDateTime dttm, LocalDateTime expiDttm, String chgCn, String remark, String pntCd, LocalDateTime fstReg, String fstRegr, LocalDateTime lastUpd, String lastUpdr) {
        this.pntId = pntId;
        this.custId = custId;
        this.stus = stus;
        this.chngPnt = chngPnt;
        this.point = point;
        this.dttm = dttm;
        this.expiDttm = expiDttm;
        this.chgCn = chgCn;
        this.remark = remark;
        this.pntCd = pntCd;
        this.fstReg = fstReg;
        this.fstRegr = fstRegr;
        this.lastUpd = lastUpd;
        this.lastUpdr = lastUpdr;
    }

    @Override
    public String toString() {
        return "pointDto{" +
                "pntId=" + pntId +
                ", custId='" + custId + '\'' +
                ", stus='" + stus + '\'' +
                ", chngPnt=" + chngPnt +
                ", point=" + point +
                ", dttm=" + dttm +
                ", expiDttm=" + expiDttm +
                ", chgCn='" + chgCn + '\'' +
                ", remark='" + remark + '\'' +
                ", pntCd='" + pntCd + '\'' +
                ", fstReg=" + fstReg +
                ", fstRegr='" + fstRegr + '\'' +
                ", lastUpd=" + lastUpd +
                ", lastUpdr='" + lastUpdr + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        pointDto pointDto = (pointDto) o;
        return pntId == pointDto.pntId && chngPnt == pointDto.chngPnt && point == pointDto.point && Objects.equals(custId, pointDto.custId) && Objects.equals(stus, pointDto.stus) && Objects.equals(chgCn, pointDto.chgCn) && Objects.equals(remark, pointDto.remark) && Objects.equals(pntCd, pointDto.pntCd) && Objects.equals(fstRegr, pointDto.fstRegr) && Objects.equals(lastUpdr, pointDto.lastUpdr);
    }

    @Override
    public int hashCode() {
        return Objects.hash(pntId, custId, stus, chngPnt, point, chgCn, remark, pntCd, fstRegr, lastUpdr);
    }

    public int getPntId() {
        return pntId;
    }

    public void setPntId(int pntId) {
        this.pntId = pntId;
    }

    public String getCustId() {
        return custId;
    }

    public void setCustId(String custId) {
        this.custId = custId;
    }

    public String getStus() {
        return stus;
    }

    public void setStus(String stus) {
        this.stus = stus;
    }

    public int getChngPnt() {
        return chngPnt;
    }

    public void setChngPnt(int chngPnt) {
        this.chngPnt = chngPnt;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public LocalDateTime getDttm() {
        return dttm;
    }

    public void setDttm(LocalDateTime dttm) {
        this.dttm = dttm;
    }

    public LocalDateTime getExpiDttm() {
        return expiDttm;
    }

    public void setExpiDttm(LocalDateTime expiDttm) {
        this.expiDttm = expiDttm;
    }

    public String getChgCn() {
        return chgCn;
    }

    public void setChgCn(String chgCn) {
        this.chgCn = chgCn;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getPntCd() {
        return pntCd;
    }

    public void setPntCd(String pntCd) {
        this.pntCd = pntCd;
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
}
