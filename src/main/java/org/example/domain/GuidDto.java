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
