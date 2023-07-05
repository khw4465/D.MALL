package org.example.domain;

public class MyOrderList {
    private String prodName;
    private String prodCd;
    private int prodQty;
    private int prodPrice;
    private int prodTotPrice;

    MyOrderList() {}

    public MyOrderList(String prodName, String prodCd, int prodQty, int prodPrice, int prodTotPrice) {
        this.prodName = prodName;
        this.prodCd = prodCd;
        this.prodQty = prodQty;
        this.prodPrice = prodPrice;
        this.prodTotPrice = prodTotPrice;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public String getProdCd() {
        return prodCd;
    }

    public void setProdCd(String prodCd) {
        this.prodCd = prodCd;
    }

    public int getProdQty() {
        return prodQty;
    }

    public void setProdQty(int prodQty) {
        this.prodQty = prodQty;
    }

    public int getProdPrice() {
        return prodPrice;
    }

    public void setProdPrice(int prodPrice) {
        this.prodPrice = prodPrice;
    }

    public int getProdTotPrice() {
        return prodTotPrice;
    }

    public void setProdTotPrice(int prodTotPrice) {
        this.prodTotPrice = prodTotPrice;
    }

    @Override
    public String toString() {
        return "MyOrderList{" +
                "prodName='" + prodName + '\'' +
                ", prodCd='" + prodCd + '\'' +
                ", prodQty=" + prodQty +
                ", prodPrice=" + prodPrice +
                ", prodTotPrice=" + prodTotPrice +
                '}';
    }
}
