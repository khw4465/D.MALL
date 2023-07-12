package org.example.domain;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;
import java.util.Objects;


public class CartDto {
    private int seq;    // 시퀀스
    private String custId;  // 회원아이디
    private String prodCd;  // 상품코드
    private String prodName;    // 상품명
    private int prodQty;    // 상품수량
    private int totSetlPrice;   // 상품가격
    private int paymtPnt;   // 적립포인트
    private int expctDcPrc = 0; // 예상할인금액
    private int dexp;   // 배송비
    private int saveTerm;   // 보유기간
    private Date fstReg;
    private String fstRegr;
    private Date lastUpd;
    private String lastUpdr;

    public CartDto() {}

    //


    public CartDto(String custId, String prodCd, String prodName, int prodQty, int totSetlPrice) {
        this.custId = custId;
        this.prodCd = prodCd;
        this.prodName = prodName;
        this.prodQty = prodQty;
        this.totSetlPrice = totSetlPrice;
        this.paymtPnt = totSetlPrice/100;
    }

    public CartDto(int seq, String custId, String prodCd, String prodName, int prodQty, int totSetlPrice, int paymtPnt, int expctDcPrc, int dexp, int saveTerm, Date fstReg, String fstRegr, Date lastUpd, String lastUpdr) {
        this.seq = seq;
        this.custId = custId;
        this.prodCd = prodCd;
        this.prodName = prodName;
        this.prodQty = prodQty;
        this.totSetlPrice = totSetlPrice;
        this.paymtPnt = paymtPnt;
        this.expctDcPrc = expctDcPrc;
        this.dexp = dexp;
        this.saveTerm = saveTerm;
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

    public int getProdQty() {
        return prodQty;
    }

    public void setProdQty(int prodQty) {
        this.prodQty = prodQty;
    }

    public int getTotSetlPrice() {
        return totSetlPrice;
    }

    public void setTotSetlPrice(int totSetlPrice) {
        this.totSetlPrice = totSetlPrice;
    }

    public int getPaymtPnt() {
        return paymtPnt;
    }

    public void setPaymtPnt(int paymtPnt) {
        this.paymtPnt = paymtPnt;
    }

    public int getExpctDcPrc() {
        return expctDcPrc;
    }

    public void setExpctDcPrc(int expctDcPrc) {
        this.expctDcPrc = expctDcPrc;
    }

    public int getDexp() {
        return dexp;
    }

    public void setDexp(int dexp) {
        this.dexp = dexp;
    }

    public int getSaveTerm() {
        return saveTerm;
    }

    public void setSaveTerm(int saveTerm) {
        this.saveTerm = saveTerm;
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

        CartDto cartDto = (CartDto) o;

        if (seq != cartDto.seq) return false;
        if (prodQty != cartDto.prodQty) return false;
        if (totSetlPrice != cartDto.totSetlPrice) return false;
        if (paymtPnt != cartDto.paymtPnt) return false;
        if (expctDcPrc != cartDto.expctDcPrc) return false;
        if (dexp != cartDto.dexp) return false;
        if (saveTerm != cartDto.saveTerm) return false;
        if (!Objects.equals(custId, cartDto.custId)) return false;
        if (!Objects.equals(prodCd, cartDto.prodCd)) return false;
        if (!Objects.equals(prodName, cartDto.prodName)) return false;
        if (!Objects.equals(fstReg, cartDto.fstReg)) return false;
        if (!Objects.equals(fstRegr, cartDto.fstRegr)) return false;
        if (!Objects.equals(lastUpd, cartDto.lastUpd)) return false;
        return Objects.equals(lastUpdr, cartDto.lastUpdr);
    }

    @Override
    public int hashCode() {
        int result = seq;
        result = 31 * result + (custId != null ? custId.hashCode() : 0);
        result = 31 * result + (prodCd != null ? prodCd.hashCode() : 0);
        result = 31 * result + (prodName != null ? prodName.hashCode() : 0);
        result = 31 * result + prodQty;
        result = 31 * result + totSetlPrice;
        result = 31 * result + paymtPnt;
        result = 31 * result + expctDcPrc;
        result = 31 * result + dexp;
        result = 31 * result + saveTerm;
        result = 31 * result + (fstReg != null ? fstReg.hashCode() : 0);
        result = 31 * result + (fstRegr != null ? fstRegr.hashCode() : 0);
        result = 31 * result + (lastUpd != null ? lastUpd.hashCode() : 0);
        result = 31 * result + (lastUpdr != null ? lastUpdr.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "CartDto{" +
                "seq=" + seq +
                ", custId='" + custId + '\'' +
                ", prodCd='" + prodCd + '\'' +
                ", prodName='" + prodName + '\'' +
                ", prodQty=" + prodQty +
                ", totSetlPrice=" + totSetlPrice +
                ", paymtPnt=" + paymtPnt +
                ", expctDcPrc=" + expctDcPrc +
                ", dexp=" + dexp +
                ", saveTerm=" + saveTerm +
                ", fstReg=" + fstReg +
                ", fstRegr='" + fstRegr + '\'' +
                ", lastUpd=" + lastUpd +
                ", lastUpdr='" + lastUpdr + '\'' +
                '}';
    }
}
