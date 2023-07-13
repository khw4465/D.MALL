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

    public String getwrtr() {
        return wrtr;
    }

    public void setwrtr(String wrtr) {
        this.wrtr = wrtr;
    }

    public boolean isuseYn() {
        return useYn;
    }

    public void setuseYn(boolean useYn) {
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
