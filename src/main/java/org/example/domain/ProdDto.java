package org.example.domain;
import java.util.Date;
import java.util.Objects;

public class ProdDto {

    private String prodCd;
    private String cateCd;
    private String prodName;
    private String prodSmrvDesc;
    private String prodDtlDesc;
    private Integer prodPrice;
    private String prodImg;
    private Float ascr;
    private String dcCd;
    private String invYn;
    private Integer invQty;
    private String saleYn;
    private String sortYn;
    private String optYn;
    private String delYn;
    private Integer mincnt;
    private Date mftDate;
    private Date useDate;
    private Date saleStart;
    private Date saleLast;
    private String remark;
    private Date fstReg;
    private String fstRegr;
    private Date lastUpd;
    private String lastUpdr;

    public ProdDto() {}

    public ProdDto(String prodCd, String cateCd, String prodName, String prodSmrvDesc, String prodDtlDesc, Integer prodPrice, String prodImg, Float ascr, String dcCd, String invYn, Integer invQty, String saleYn, String sortYn, String optYn, String delYn, Integer mincnt, Date mftDate, Date useDate, Date saleStart, Date saleLast, String remark, Date fstReg, String fstRegr, Date lastUpd, String lastUpdr) {
        this.prodCd = prodCd;
        this.cateCd = cateCd;
        this.prodName = prodName;
        this.prodSmrvDesc = prodSmrvDesc;
        this.prodDtlDesc = prodDtlDesc;
        this.prodPrice = prodPrice;
        this.prodImg = prodImg;
        this.ascr = ascr;
        this.dcCd = dcCd;
        this.invYn = invYn;
        this.invQty = invQty;
        this.saleYn = saleYn;
        this.sortYn = sortYn;
        this.optYn = optYn;
        this.delYn = delYn;
        this.mincnt = mincnt;
        this.mftDate = mftDate;
        this.useDate = useDate;
        this.saleStart = saleStart;
        this.saleLast = saleLast;
        this.remark = remark;
        this.fstReg = fstReg;
        this.fstRegr = fstRegr;
        this.lastUpd = lastUpd;
        this.lastUpdr = lastUpdr;
    }

    public String getProdCd() {
        return prodCd;
    }

    public void setProdCd(String prodCd) {
        this.prodCd = prodCd;
    }

    public String getcateCd() {
        return cateCd;
    }

    public void setcateCd(String cateCd) {
        this.cateCd = cateCd;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public String getProdSmrvDesc() {
        return prodSmrvDesc;
    }

    public void setProdSmrvDesc(String prodSmrvDesc) {
        this.prodSmrvDesc = prodSmrvDesc;
    }

    public String getProdDtlDesc() {
        return prodDtlDesc;
    }

    public void setProdDtlDesc(String prodDtlDesc) {
        this.prodDtlDesc = prodDtlDesc;
    }

    public Integer getProdPrice() {
        return prodPrice;
    }

    public void setProdPrice(Integer prodPrice) {
        this.prodPrice = prodPrice;
    }

    public String getProdImg() {
        return prodImg;
    }

    public void setProdImg(String prodImg) {
        this.prodImg = prodImg;
    }

    public Float getAscr() {
        return ascr;
    }

    public void setAscr(Float ascr) {
        this.ascr = ascr;
    }

    public String getDcCd() {
        return dcCd;
    }

    public void setDcCd(String dcCd) {
        this.dcCd = dcCd;
    }

    public String getInvYn() {
        return invYn;
    }

    public void setInvYn(String invYn) {
        this.invYn = invYn;
    }

    public Integer getInvQty() {
        return invQty;
    }

    public void setInvQty(Integer invQty) {
        this.invQty = invQty;
    }

    public String getSaleYn() {
        return saleYn;
    }

    public void setSaleYn(String saleYn) {
        this.saleYn = saleYn;
    }

    public String getSortYn() {
        return sortYn;
    }

    public void setSortYn(String sortYn) {
        this.sortYn = sortYn;
    }

    public String getOptYn() {
        return optYn;
    }

    public void setOptYn(String optYn) {
        this.optYn = optYn;
    }

    public String getDelYn() {
        return delYn;
    }

    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }

    public Integer getMincnt() {
        return mincnt;
    }

    public void setMincnt(Integer mincnt) {
        this.mincnt = mincnt;
    }

    public Date getMftDate() {
        return mftDate;
    }

    public void setMftDate(Date mftDate) {
        this.mftDate = mftDate;
    }

    public Date getUseDate() {
        return useDate;
    }

    public void setUseDate(Date useDate) {
        this.useDate = useDate;
    }

    public Date getSaleStart() {
        return saleStart;
    }

    public void setSaleStart(Date saleStart) {
        this.saleStart = saleStart;
    }

    public Date getSaleLast() {
        return saleLast;
    }

    public void setSaleLast(Date saleLast) {
        this.saleLast = saleLast;
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

        ProdDto prodDto = (ProdDto) o;

        if (!Objects.equals(prodCd, prodDto.prodCd)) return false;
        if (!Objects.equals(cateCd, prodDto.cateCd)) return false;
        if (!Objects.equals(prodName, prodDto.prodName)) return false;
        if (!Objects.equals(prodSmrvDesc, prodDto.prodSmrvDesc))
            return false;
        if (!Objects.equals(prodDtlDesc, prodDto.prodDtlDesc)) return false;
        if (!Objects.equals(prodPrice, prodDto.prodPrice)) return false;
        if (!Objects.equals(prodImg, prodDto.prodImg)) return false;
        if (!Objects.equals(ascr, prodDto.ascr)) return false;
        if (!Objects.equals(dcCd, prodDto.dcCd)) return false;
        if (!Objects.equals(invYn, prodDto.invYn)) return false;
        if (!Objects.equals(invQty, prodDto.invQty)) return false;
        if (!Objects.equals(saleYn, prodDto.saleYn)) return false;
        if (!Objects.equals(sortYn, prodDto.sortYn)) return false;
        if (!Objects.equals(optYn, prodDto.optYn)) return false;
        if (!Objects.equals(delYn, prodDto.delYn)) return false;
        if (!Objects.equals(mincnt, prodDto.mincnt)) return false;
        if (!Objects.equals(remark, prodDto.remark)) return false;
        if (!Objects.equals(fstRegr, prodDto.fstRegr)) return false;
        return Objects.equals(lastUpdr, prodDto.lastUpdr);
    }

    @Override
    public int hashCode() {
        int result = prodCd != null ? prodCd.hashCode() : 0;
        result = 31 * result + (cateCd != null ? cateCd.hashCode() : 0);
        result = 31 * result + (prodName != null ? prodName.hashCode() : 0);
        result = 31 * result + (prodSmrvDesc != null ? prodSmrvDesc.hashCode() : 0);
        result = 31 * result + (prodDtlDesc != null ? prodDtlDesc.hashCode() : 0);
        result = 31 * result + (prodPrice != null ? prodPrice.hashCode() : 0);
        result = 31 * result + (prodImg != null ? prodImg.hashCode() : 0);
        result = 31 * result + (ascr != null ? ascr.hashCode() : 0);
        result = 31 * result + (dcCd != null ? dcCd.hashCode() : 0);
        result = 31 * result + (invYn != null ? invYn.hashCode() : 0);
        result = 31 * result + (invQty != null ? invQty.hashCode() : 0);
        result = 31 * result + (saleYn != null ? saleYn.hashCode() : 0);
        result = 31 * result + (sortYn != null ? sortYn.hashCode() : 0);
        result = 31 * result + (optYn != null ? optYn.hashCode() : 0);
        result = 31 * result + (delYn != null ? delYn.hashCode() : 0);
        result = 31 * result + (mincnt != null ? mincnt.hashCode() : 0);
        result = 31 * result + (remark != null ? remark.hashCode() : 0);
        result = 31 * result + (fstRegr != null ? fstRegr.hashCode() : 0);
        result = 31 * result + (lastUpdr != null ? lastUpdr.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "ProdDto{" +
                "prodCd='" + prodCd + '\'' +
                ", cateCd='" + cateCd + '\'' +
                ", prodName='" + prodName + '\'' +
                ", prodSmrvDesc='" + prodSmrvDesc + '\'' +
                ", prodDtlDesc='" + prodDtlDesc + '\'' +
                ", prodPrice=" + prodPrice +
                ", prodImg='" + prodImg + '\'' +
                ", ascr=" + ascr +
                ", dcCd='" + dcCd + '\'' +
                ", invYn='" + invYn + '\'' +
                ", invQty=" + invQty +
                ", saleYn='" + saleYn + '\'' +
                ", sortYn='" + sortYn + '\'' +
                ", optYn='" + optYn + '\'' +
                ", delYn='" + delYn + '\'' +
                ", mincnt=" + mincnt +
                ", mftDate=" + mftDate +
                ", useDate=" + useDate +
                ", saleStart=" + saleStart +
                ", saleLast=" + saleLast +
                ", remark='" + remark + '\'' +
                ", fstReg=" + fstReg +
                ", fstRegr='" + fstRegr + '\'' +
                ", lastUpd=" + lastUpd +
                ", lastUpdr='" + lastUpdr + '\'' +
                '}';
    }
}
