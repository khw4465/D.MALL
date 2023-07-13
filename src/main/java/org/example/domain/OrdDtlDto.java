package org.example.domain;
import java.util.Date;
import java.util.Objects;

public class OrdDtlDto {
    private String ordCd;
    private String sn;
    private String prodCd;
    private String prodOpt;
    private int prodPrc;
    private int Qty;
    private int ordPrc;
    private String remark;
    private Date fstReg;
    private String fstRegr;
    private Date lastUpd;
    private String lastUpdr;
    public OrdDtlDto() {}
    public OrdDtlDto(String ordCd, String sn, String prodCd, String prodOpt, int prodPrc, int qty, int ordPrc, String remark, Date fstReg, String fstRegr, Date lastUpd, String lastUpdr) {
        this.ordCd = ordCd;
        this.sn = sn;
        this.prodCd = prodCd;
        this.prodOpt = prodOpt;
        this.prodPrc = prodPrc;
        Qty = qty;
        this.ordPrc = ordPrc;
        this.remark = remark;
        this.fstReg = fstReg;
        this.fstRegr = fstRegr;
        this.lastUpd = lastUpd;
        this.lastUpdr = lastUpdr;
    }

    public String getOrdCd() {
        return ordCd;
    }

    public void setOrdCd(String ordCd) {
        this.ordCd = ordCd;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public String getProdCd() {
        return prodCd;
    }

    public void setProdCd(String prodCd) {
        this.prodCd = prodCd;
    }

    public String getProdOpt() {
        return prodOpt;
    }

    public void setProdOpt(String prodOpt) {
        this.prodOpt = prodOpt;
    }

    public int getProdPrc() {
        return prodPrc;
    }

    public void setProdPrc(int prodPrc) {
        this.prodPrc = prodPrc;
    }

    public int getQty() {
        return Qty;
    }

    public void setQty(int qty) {
        Qty = qty;
    }

    public int getOrdPrc() {
        return ordPrc;
    }

    public void setOrdPrc(int ordPrc) {
        this.ordPrc = ordPrc;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getFstReg() {
        return fstReg;
    }

    public void setFstReg(Date fstReg) {
        this.fstReg = fstReg;
    }

    public String getfstRegr() {
        return fstRegr;
    }

    public void setfstRegr(String fstRegr) {
        this.fstRegr = fstRegr;
    }

    public Date getLastUpd() {
        return lastUpd;
    }

    public void setLastUpd(Date lastUpd) {
        this.lastUpd = lastUpd;
    }

    public String getlastUpdr() {
        return lastUpdr;
    }

    public void setlastUpdr(String lastUpdr) {
        this.lastUpdr = lastUpdr;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrdDtlDto ordDtlDto = (OrdDtlDto) o;

        if (prodPrc != ordDtlDto.prodPrc) return false;
        if (Qty != ordDtlDto.Qty) return false;
        if (ordPrc != ordDtlDto.ordPrc) return false;
        if (!Objects.equals(ordCd, ordDtlDto.ordCd)) return false;
        if (!Objects.equals(sn, ordDtlDto.sn)) return false;
        if (!Objects.equals(prodCd, ordDtlDto.prodCd)) return false;
        if (!Objects.equals(prodOpt, ordDtlDto.prodOpt)) return false;
        if (!Objects.equals(remark, ordDtlDto.remark)) return false;
        if (!Objects.equals(fstReg, ordDtlDto.fstReg)) return false;
        if (!Objects.equals(fstRegr, ordDtlDto.fstRegr)) return false;
        if (!Objects.equals(lastUpd, ordDtlDto.lastUpd)) return false;
        return Objects.equals(lastUpdr, ordDtlDto.lastUpdr);
    }

    @Override
    public int hashCode() {
        int result = ordCd != null ? ordCd.hashCode() : 0;
        result = 31 * result + (sn != null ? sn.hashCode() : 0);
        result = 31 * result + (prodCd != null ? prodCd.hashCode() : 0);
        result = 31 * result + (prodOpt != null ? prodOpt.hashCode() : 0);
        result = 31 * result + prodPrc;
        result = 31 * result + Qty;
        result = 31 * result + ordPrc;
        result = 31 * result + (remark != null ? remark.hashCode() : 0);
        result = 31 * result + (fstReg != null ? fstReg.hashCode() : 0);
        result = 31 * result + (fstRegr != null ? fstRegr.hashCode() : 0);
        result = 31 * result + (lastUpd != null ? lastUpd.hashCode() : 0);
        result = 31 * result + (lastUpdr != null ? lastUpdr.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "OrdDtlDto{" +
                "ordCd='" + ordCd + '\'' +
                ", sn='" + sn + '\'' +
                ", prodCd='" + prodCd + '\'' +
                ", prodOpt='" + prodOpt + '\'' +
                ", prodPrc=" + prodPrc +
                ", Qty=" + Qty +
                ", ordPrc=" + ordPrc +
                ", remark='" + remark + '\'' +
                ", fstReg=" + fstReg +
                ", fstRegr='" + fstRegr + '\'' +
                ", lastUpd=" + lastUpd +
                ", lastUpdr='" + lastUpdr + '\'' +
                '}';
    }
}