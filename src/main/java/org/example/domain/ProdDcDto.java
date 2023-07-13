package org.example.domain;
import java.util.Date;
import java.util.Objects;

public class ProdDcDto {

    private String dcCd;
    private String prodClsCd;
    private String dcType;
    private String dcname;
    private String dcTar;
    private Integer dcRt;
    private Integer dcPrice;
    private String useYn;
    private String delYn;
    private Date dcStart;
    private Date dcLast;
    private String remark;
    private Date fstReg;
    private String fstRegr;
    private Date lastUpd;
    private String lastUpdr;

    public ProdDcDto() {}

    public ProdDcDto(String dcCd, String prodClsCd, String dcType, String dcname, String dcTar, Integer dcRt, Integer dcPrice, String useYn, String delYn, Date dcStart, Date dcLast, String remark, Date fstReg, String fstRegr, Date lastUpd, String lastUpdr) {
        this.dcCd = dcCd;
        this.prodClsCd = prodClsCd;
        this.dcType = dcType;
        this.dcname = dcname;
        this.dcTar = dcTar;
        this.dcRt = dcRt;
        this.dcPrice = dcPrice;
        this.useYn = useYn;
        this.delYn = delYn;
        this.dcStart = dcStart;
        this.dcLast = dcLast;
        this.remark = remark;
        this.fstReg = fstReg;
        this.fstRegr = fstRegr;
        this.lastUpd = lastUpd;
        this.lastUpdr = lastUpdr;
    }

    public String getDcCd() {
        return dcCd;
    }

    public void setDcCd(String dcCd) {
        this.dcCd = dcCd;
    }

    public String getProdClsCd() {
        return prodClsCd;
    }

    public void setProdClsCd(String prodClsCd) {
        this.prodClsCd = prodClsCd;
    }

    public String getDcType() {
        return dcType;
    }

    public void setDcType(String dcType) {
        this.dcType = dcType;
    }

    public String getDcname() {
        return dcname;
    }

    public void setDcname(String dcname) {
        this.dcname = dcname;
    }

    public String getDcTar() {
        return dcTar;
    }

    public void setDcTar(String dcTar) {
        this.dcTar = dcTar;
    }

    public Integer getDcRt() {
        return dcRt;
    }

    public void setDcRt(Integer dcRt) {
        this.dcRt = dcRt;
    }

    public Integer getDcPrice() {
        return dcPrice;
    }

    public void setDcPrice(Integer dcPrice) {
        this.dcPrice = dcPrice;
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

    public Date getDcStart() {
        return dcStart;
    }

    public void setDcStart(Date dcStart) {
        this.dcStart = dcStart;
    }

    public Date getDcLast() {
        return dcLast;
    }

    public void setDcLast(Date dcLast) {
        this.dcLast = dcLast;
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

        ProdDcDto prodDcDto = (ProdDcDto) o;

        if (!Objects.equals(dcCd, prodDcDto.dcCd)) return false;
        if (!Objects.equals(prodClsCd, prodDcDto.prodClsCd)) return false;
        if (!Objects.equals(dcType, prodDcDto.dcType)) return false;
        if (!Objects.equals(dcname, prodDcDto.dcname)) return false;
        if (!Objects.equals(dcTar, prodDcDto.dcTar)) return false;
        if (!Objects.equals(dcRt, prodDcDto.dcRt)) return false;
        if (!Objects.equals(dcPrice, prodDcDto.dcPrice)) return false;
        if (!Objects.equals(useYn, prodDcDto.useYn)) return false;
        if (!Objects.equals(delYn, prodDcDto.delYn)) return false;
        if (!Objects.equals(remark, prodDcDto.remark)) return false;
        if (!Objects.equals(fstRegr, prodDcDto.fstRegr)) return false;
        return Objects.equals(lastUpdr, prodDcDto.lastUpdr);
    }

    @Override
    public int hashCode() {
        int result = dcCd != null ? dcCd.hashCode() : 0;
        result = 31 * result + (prodClsCd != null ? prodClsCd.hashCode() : 0);
        result = 31 * result + (dcType != null ? dcType.hashCode() : 0);
        result = 31 * result + (dcname != null ? dcname.hashCode() : 0);
        result = 31 * result + (dcTar != null ? dcTar.hashCode() : 0);
        result = 31 * result + (dcRt != null ? dcRt.hashCode() : 0);
        result = 31 * result + (dcPrice != null ? dcPrice.hashCode() : 0);
        result = 31 * result + (useYn != null ? useYn.hashCode() : 0);
        result = 31 * result + (delYn != null ? delYn.hashCode() : 0);
        result = 31 * result + (remark != null ? remark.hashCode() : 0);
        result = 31 * result + (fstRegr != null ? fstRegr.hashCode() : 0);
        result = 31 * result + (lastUpdr != null ? lastUpdr.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "ProdDcDto{" +
                "dcCd='" + dcCd + '\'' +
                ", prodClsCd='" + prodClsCd + '\'' +
                ", dcType='" + dcType + '\'' +
                ", dcname='" + dcname + '\'' +
                ", dcTar='" + dcTar + '\'' +
                ", dcRt=" + dcRt +
                ", dcPrice=" + dcPrice +
                ", useYn='" + useYn + '\'' +
                ", delYn='" + delYn + '\'' +
                ", dcStart=" + dcStart +
                ", dcLast=" + dcLast +
                ", remark='" + remark + '\'' +
                ", fstReg=" + fstReg +
                ", fstRegr='" + fstRegr + '\'' +
                ", lastUpd=" + lastUpd +
                ", lastUpdr='" + lastUpdr + '\'' +
                '}';
    }
}
