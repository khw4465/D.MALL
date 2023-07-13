package org.example.domain;
import java.sql.Date;
public class GuidDto {
    private String bbsoNo;
    private String ttl;
    private String cn;
    private String wrtr;
    private boolean useYn;
    private Date fstReg;
    private String fstRegr;
    private Date lastUpd;
    private String lastUpdr;

    public GuidDto(){}
    public GuidDto(String bbsoNo, String ttl, String cn, String wrtr, boolean useYn, String fstRegr, String lastUpdr) {
        this.bbsoNo = bbsoNo;
        this.ttl = ttl;
        this.cn = cn;
        this.wrtr = wrtr;
        this.useYn = useYn;
        this.fstRegr = fstRegr;
        this.lastUpdr = lastUpdr;
    }
    public String getBbsoNo() {
        return bbsoNo;
    }

    public void setBbsoNo(String bbsoNo) {
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

    public String getWrtr() {
        return wrtr;
    }

    public void setWrtr(String wrtr) {
        this.wrtr = wrtr;
    }

    public boolean isUseYn() {
        return useYn;
    }

    public void setUseYn(boolean useYn) {
        this.useYn = useYn;
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

    @Override
    public String toString() {
        return "GuidDto{" +
                "bbsoNo='" + bbsoNo + '\'' +
                ", ttl='" + ttl + '\'' +
                ", cn='" + cn + '\'' +
                ", wrtr='" + wrtr + '\'' +
                ", useYn=" + useYn +
                ", fstReg=" + fstReg +
                ", fstRegr='" + fstRegr + '\'' +
                ", lastUpd=" + lastUpd +
                ", lastUpdr='" + lastUpdr + '\'' +
                '}';
    }
}
