package org.example.classForAjax;

public class Prod {
    private String prodCd;
    private int totSetlPrice;
    private int prodQty;
    private int paymtPnt;
    public Prod() {}
    public Prod(String prodCd, int totSetlPrice, int prodQty, int paymtPnt) {
        this.prodCd = prodCd;
        this.totSetlPrice = totSetlPrice;
        this.prodQty = prodQty;
        this.paymtPnt = paymtPnt;
    }

    public String getProdCd() {
        return prodCd;
    }

    public void setProdCd(String prodCd) {
        this.prodCd = prodCd;
    }

    public int getTotSetlPrice() {
        return totSetlPrice;
    }

    public void setTotSetlPrice(int totSetlPrice) {
        this.totSetlPrice = totSetlPrice;
    }

    public int getProdQty() {
        return prodQty;
    }

    public void setProdQty(int prodQty) {
        this.prodQty = prodQty;
    }

    public int getPaymtPnt() {
        return paymtPnt;
    }

    public void setPaymtPnt(int paymtPnt) {
        this.paymtPnt = paymtPnt;
    }

    @Override
    public String toString() {
        return "Prod{" +
                "prodCd='" + prodCd + '\'' +
                ", totSetlPrice=" + totSetlPrice +
                ", prodQty=" + prodQty +
                ", paymtPnt=" + paymtPnt +
                '}';
    }
}
