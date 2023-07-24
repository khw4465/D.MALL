package org.example.domain;

import java.sql.Date;

public class NotcDto {

    private Integer bbsoNo;
    private String ttl;
    private String cn;
    private String wrtd;
    private String wrtr;
    private int notcCnt;
    private String cate;
    private Date fstReg;
    private String fstRegr;
    private Date lastUpd;
    private String lastUpdr;
    private String useYn;

    public NotcDto() {
    }

    // DATE빠진 생성자
    public NotcDto(Integer bbsoNo, String ttl, String cn, String wrtd, String wrtr, int notcCnt, String cate, String fstRegr, String lastUpdr, String useYn) {
        this.bbsoNo = bbsoNo;
        this.ttl = ttl;
        this.cn = cn;
        this.wrtd = wrtd;
        this.wrtr = wrtr;
        this.notcCnt = notcCnt;
        this.cate = cate;
        this.fstRegr = fstRegr;
        this.lastUpdr = lastUpdr;
        this.useYn = useYn;
    }

    public NotcDto(Integer bbsoNo, String ttl, String cn, String wrtd, String wrtr, int notcCnt, String cate, Date fstReg, String fstRegr, Date lastUpd, String lastUpdr, String useYn) {
        this.bbsoNo = bbsoNo;
        this.ttl = ttl;
        this.cn = cn;
        this.wrtd = wrtd;
        this.wrtr = wrtr;
        this.notcCnt = notcCnt;
        this.cate = cate;
        this.fstReg = fstReg;
        this.fstRegr = fstRegr;
        this.lastUpd = lastUpd;
        this.lastUpdr = lastUpdr;
        this.useYn = useYn;
    }

    public Integer getBbsoNo() {
        return bbsoNo;
    }

    public void setBbsoNo(Integer bbsoNo) {
        this.bbsoNo = bbsoNo;
    }

    public String getTtl() {
        return ttl;
    }

    public void setTtl(String ttl) {
        this.ttl = ttl;
    }

    public String getCn() {
        return cn;
    }

    public void setCn(String cn) {
        this.cn = cn;
    }

    public String getWrtd() {
        return wrtd;
    }

    public void setWrtd(String wrtd) {
        this.wrtd = wrtd;
    }

    public String getWrtr() {
        return wrtr;
    }

    public void setWrtr(String wrtr) {
        this.wrtr = wrtr;
    }

    public int getNotcCnt() {
        return notcCnt;
    }

    public void setNotcCnt(int notcCnt) {
        this.notcCnt = notcCnt;
    }

    public String getCate() {
        return cate;
    }

    public void setCate(String cate) {
        this.cate = cate;
    }

    public Date getFstReg() {
        return fstReg;
    }

    public void setFstReg(Date fstReg) {
        this.fstReg = fstReg;
    }

    public String getFstRegr() {
        return fstRegr;
    }

    public void setFstRegr(String fstRegr) {
        this.fstRegr = fstRegr;
    }

    public Date getLastUpd() {
        return lastUpd;
    }

    public void setLastUpd(Date lastUpd) {
        this.lastUpd = lastUpd;
    }

    public String getLastUpdr() {
        return lastUpdr;
    }

    public void setLastUpdr(String lastUpdr) {
        this.lastUpdr = lastUpdr;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    @Override
    public String toString() {
        return "NotcDto{" +
                "bbsoNo='" + bbsoNo + '\'' +
                ", ttl='" + ttl + '\'' +
                ", cn='" + cn + '\'' +
                ", wrtd='" + wrtd + '\'' +
                ", wrtr='" + wrtr + '\'' +
                ", notcCnt=" + notcCnt +
                ", cate='" + cate + '\'' +
                ", fstReg=" + fstReg +
                ", fstRegr='" + fstRegr + '\'' +
                ", lastUpd=" + lastUpd +
                ", lastUpdr='" + lastUpdr + '\'' +
                ", useYn='" + useYn + '\'' +
                '}';
    }
}
