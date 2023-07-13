package org.example.domain;

import java.sql.Date;

public class NotcDto {

    private String bbsoNo;
    private String ttl;
    private String cn;
    private String wrtd;
    private String wrtr;
    private Integer notccnt;
    private String cate;
    private Date fstReg;
    private String fstRegr;
    private Date lastUpd;
    private String lastUpdr;
    private String useYn;

    public NotcDto(){}

    // DATE빠진 생성자
    public NotcDto(String bbsoNo, String ttl, String cn, String wrtd, String wrtr, Integer notccnt, String cate, String fstRegr, String lastUpdr, String useYn) {
        this.bbsoNo = bbsoNo;
        this.ttl = ttl;
        this.cn = cn;
        this.wrtd = wrtd;
        this.wrtr = wrtr;
        this.notccnt = notccnt;
        this.cate = cate;
        this.fstRegr = fstRegr;
        this.lastUpdr = lastUpdr;
        this.useYn = useYn;
    }

    public NotcDto(String bbsoNo, String ttl, String cn, String wrtd, String wrtr, Integer notccnt, String cate, Date fstReg, String fstRegr, Date lastUpd, String lastUpdr, String useYn) {
        this.bbsoNo = bbsoNo;
        this.ttl = ttl;
        this.cn = cn;
        this.wrtd = wrtd;
        this.wrtr = wrtr;
        this.notccnt = notccnt;
        this.cate = cate;
        this.fstReg = fstReg;
        this.fstRegr = fstRegr;
        this.lastUpd = lastUpd;
        this.lastUpdr = lastUpdr;
        this.useYn = useYn;
    }

    public String getbbsoNo() {
        return bbsoNo;
    }

    public void setbbsoNo(String bbsoNo) {
        this.bbsoNo = bbsoNo;
    }

    public String getttl() {
        return ttl;
    }

    public void setttl(String ttl) {
        this.ttl = ttl;
    }

    public String getcn() {
        return cn;
    }

    public void setcn(String cn) {
        this.cn = cn;
    }

    public String getwrtd() {
        return wrtd;
    }

    public void setwrtd(String wrtd) {
        this.wrtd = wrtd;
    }

    public String getwrtr() {
        return wrtr;
    }

    public void setwrtr(String wrtr) {
        this.wrtr = wrtr;
    }

    public int getnotccnt() {
        return notccnt;
    }

    public void setnotccnt(int notccnt) {
        this.notccnt = notccnt;
    }

    public String getcate() {
        return cate;
    }

    public void setcate(String cate) {
        this.cate = cate;
    }

    public Date getfstReg() {
        return fstReg;
    }

    public void setfstReg(Date fstReg) {
        this.fstReg = fstReg;
    }

    public String getfstRegr() {
        return fstRegr;
    }

    public void setfstRegr(String fstRegr) {
        this.fstRegr = fstRegr;
    }

    public Date getlastUpd() {
        return lastUpd;
    }

    public void setlastUpd(Date lastUpd) {
        this.lastUpd = lastUpd;
    }

    public String getlastUpdr() {
        return lastUpdr;
    }

    public void setlastUpdr(String lastUpdr) {
        this.lastUpdr = lastUpdr;
    }

    public String getuseYn() {
        return useYn;
    }

    public void setuseYn(String useYn) {
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
                ", notccnt=" + notccnt +
                ", cate='" + cate + '\'' +
                ", fstReg=" + fstReg +
                ", fstRegr='" + fstRegr + '\'' +
                ", lastUpd=" + lastUpd +
                ", lastUpdr='" + lastUpdr + '\'' +
                ", useYn='" + useYn + '\'' +
                '}';
    }
}
