package org.example.domain;
import java.util.Date;
import java.util.Objects;

public class ProdOptDto {

    private String optCd;
    private String prodCd;
    private String optName;
    private Integer optQty;
    private String optType;
    private Integer salePrc;
    private String useYn;
    private String delYn;
    private String remark;
    private Date fstReg;
    private String fstRegr;
    private Date lastUpd;
    private String lastUpdr;

    public ProdOptDto() {}

    public ProdOptDto(String optCd, String prodCd, String optName, Integer optQty, String optType, Integer salePrc, String useYn, String delYn, String remark, Date fstReg, String fstRegr, Date lastUpd, String lastUpdr) {
        this.optCd = optCd;
        this.prodCd = prodCd;
        this.optName = optName;
        this.optQty = optQty;
        this.optType = optType;
        this.salePrc = salePrc;
        this.useYn = useYn;
        this.delYn = delYn;
        this.remark = remark;
        this.fstReg = fstReg;
        this.fstRegr = fstRegr;
        this.lastUpd = lastUpd;
        this.lastUpdr = lastUpdr;
    }

    public String getOptCd() {
        return optCd;
    }

    public void setOptCd(String optCd) {
        this.optCd = optCd;
    }

    public String getProdCd() {
        return prodCd;
    }

    public void setProdCd(String prodCd) {
        this.prodCd = prodCd;
    }

    public String getOptName() {
        return optName;
    }

    public void setOptName(String optName) {
        this.optName = optName;
    }

    public Integer getOptQty() {
        return optQty;
    }

    public void setOptQty(Integer optQty) {
        this.optQty = optQty;
    }

    public String getOptType() {
        return optType;
    }

    public void setOptType(String optType) {
        this.optType = optType;
    }

    public Integer getSalePrc() {
        return salePrc;
    }

    public void setSalePrc(Integer salePrc) {
        this.salePrc = salePrc;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    public String getDelYn() {
        return delYn;
    }

    public void setDelYn(String delYn) {
        this.delYn = delYn;
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

        ProdOptDto that = (ProdOptDto) o;

        if (!Objects.equals(optCd, that.optCd)) return false;
        if (!Objects.equals(prodCd, that.prodCd)) return false;
        if (!Objects.equals(optName, that.optName)) return false;
        if (!Objects.equals(optQty, that.optQty)) return false;
        if (!Objects.equals(optType, that.optType)) return false;
        if (!Objects.equals(salePrc, that.salePrc)) return false;
        if (!Objects.equals(useYn, that.useYn)) return false;
        if (!Objects.equals(delYn, that.delYn)) return false;
        if (!Objects.equals(remark, that.remark)) return false;
        if (!Objects.equals(fstRegr, that.fstRegr)) return false;
        return Objects.equals(lastUpdr, that.lastUpdr);
    }

    @Override
    public int hashCode() {
        int result = optCd != null ? optCd.hashCode() : 0;
        result = 31 * result + (prodCd != null ? prodCd.hashCode() : 0);
        result = 31 * result + (optName != null ? optName.hashCode() : 0);
        result = 31 * result + (optQty != null ? optQty.hashCode() : 0);
        result = 31 * result + (optType != null ? optType.hashCode() : 0);
        result = 31 * result + (salePrc != null ? salePrc.hashCode() : 0);
        result = 31 * result + (useYn != null ? useYn.hashCode() : 0);
        result = 31 * result + (delYn != null ? delYn.hashCode() : 0);
        result = 31 * result + (remark != null ? remark.hashCode() : 0);
        result = 31 * result + (fstRegr != null ? fstRegr.hashCode() : 0);
        result = 31 * result + (lastUpdr != null ? lastUpdr.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "ProdOptDto{" +
                "optCd='" + optCd + '\'' +
                ", prodCd='" + prodCd + '\'' +
                ", optName='" + optName + '\'' +
                ", optQty=" + optQty +
                ", optType='" + optType + '\'' +
                ", salePrc=" + salePrc +
                ", useYn='" + useYn + '\'' +
                ", delYn='" + delYn + '\'' +
                ", remark='" + remark + '\'' +
                ", fstReg=" + fstReg +
                ", fstRegr='" + fstRegr + '\'' +
                ", lastUpd=" + lastUpd +
                ", lastUpdr='" + lastUpdr + '\'' +
                '}';
    }
}
