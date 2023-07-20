package org.example.domain;

import java.util.Date;
import java.util.Objects;

public class CartOptDto {
    private int seq;            // 시퀀스
    private String custId;      // 회원아이디
    private String prodCd;      // 상품코드
    private String prodName;    // 상품명
    private String optCd;       // 옵션코드
    private String optName;     // 옵션명
    private int optQty;         // 옵션의 수량
    private int optPrice;       // 옵션의 가격
    private int totOptPrice;    // 옵션당 총가격
    private String remark;      // 비고
    private Date fstReg;
    private String fstRegr;
    private Date lastUpd;
    private String lastUpdr;

    public CartOptDto() {}

    public CartOptDto(String custId, String prodCd, String prodName, String optCd, String optName, int optQty, int optPrice) {
        this.custId = custId;
        this.prodCd = prodCd;
        this.prodName = prodName;
        this.optCd = optCd;
        this.optName = optName;
        this.optQty = optQty;
        this.optPrice = optPrice;
    }

    public CartOptDto(int seq, String custId, String prodCd, String prodName, String optCd, String optName, int optQty, int optPrice, int totOptPrice, String remark, Date fstReg, String fstRegr, Date lastUpd, String lastUpdr) {
        this.seq = seq;
        this.custId = custId;
        this.prodCd = prodCd;
        this.prodName = prodName;
        this.optCd = optCd;
        this.optName = optName;
        this.optQty = optQty;
        this.optPrice = optPrice;
        this.totOptPrice = totOptPrice;
        this.remark = remark;
        this.fstReg = fstReg;
        this.fstRegr = fstRegr;
        this.lastUpd = lastUpd;
        this.lastUpdr = lastUpdr;
    }

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getCustId() {
        return custId;
    }

    public void setCustId(String custId) {
        this.custId = custId;
    }

    public String getProdCd() {
        return prodCd;
    }

    public void setProdCd(String prodCd) {
        this.prodCd = prodCd;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public String getOptCd() {
        return optCd;
    }

    public void setOptCd(String optCd) {
        this.optCd = optCd;
    }

    public String getOptName() {
        return optName;
    }

    public void setOptName(String optName) {
        this.optName = optName;
    }

    public int getOptQty() {
        return optQty;
    }

    public void setOptQty(int optQty) {
        this.optQty = optQty;
    }

    public int getOptPrice() {
        return optPrice;
    }

    public void setOptPrice(int optPrice) {
        this.optPrice = optPrice;
    }

    public int getTotOptPrice() {
        return totOptPrice;
    }

    public void setTotOptPrice(int totOptPrice) {
        this.totOptPrice = totOptPrice;
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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CartOptDto that = (CartOptDto) o;

        if (seq != that.seq) return false;
        if (optQty != that.optQty) return false;
        if (optPrice != that.optPrice) return false;
        if (totOptPrice != that.totOptPrice) return false;
        if (!Objects.equals(custId, that.custId)) return false;
        if (!Objects.equals(prodCd, that.prodCd)) return false;
        if (!Objects.equals(prodName, that.prodName)) return false;
        if (!Objects.equals(optCd, that.optCd)) return false;
        if (!Objects.equals(optName, that.optName)) return false;
        if (!Objects.equals(remark, that.remark)) return false;
        if (!Objects.equals(fstReg, that.fstReg)) return false;
        if (!Objects.equals(fstRegr, that.fstRegr)) return false;
        if (!Objects.equals(lastUpd, that.lastUpd)) return false;
        return Objects.equals(lastUpdr, that.lastUpdr);
    }

    @Override
    public int hashCode() {
        int result = seq;
        result = 31 * result + (custId != null ? custId.hashCode() : 0);
        result = 31 * result + (prodCd != null ? prodCd.hashCode() : 0);
        result = 31 * result + (prodName != null ? prodName.hashCode() : 0);
        result = 31 * result + (optCd != null ? optCd.hashCode() : 0);
        result = 31 * result + (optName != null ? optName.hashCode() : 0);
        result = 31 * result + optQty;
        result = 31 * result + optPrice;
        result = 31 * result + totOptPrice;
        result = 31 * result + (remark != null ? remark.hashCode() : 0);
        result = 31 * result + (fstReg != null ? fstReg.hashCode() : 0);
        result = 31 * result + (fstRegr != null ? fstRegr.hashCode() : 0);
        result = 31 * result + (lastUpd != null ? lastUpd.hashCode() : 0);
        result = 31 * result + (lastUpdr != null ? lastUpdr.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "CartOptDto{" +
                "seq=" + seq +
                ", custId='" + custId + '\'' +
                ", prodCd='" + prodCd + '\'' +
                ", prodName='" + prodName + '\'' +
                ", optCd='" + optCd + '\'' +
                ", optName='" + optName + '\'' +
                ", optQty=" + optQty +
                ", optPrice=" + optPrice +
                ", totOptPrice=" + totOptPrice +
                ", remark='" + remark + '\'' +
                ", fstReg=" + fstReg +
                ", fstRegr='" + fstRegr + '\'' +
                ", lastUpd=" + lastUpd +
                ", lastUpdr='" + lastUpdr + '\'' +
                '}';
    }
}
