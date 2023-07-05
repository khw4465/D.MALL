package org.example.classForAjax;

public class Prod {
    private String prodCd;

    public Prod() {}
    public Prod(String prodCd) {
        this.prodCd = prodCd;
    }

    public String getProdCd() {
        return prodCd;
    }
    public void setProdCd(String prodCd) {
        this.prodCd = prodCd;
    }
    @Override
    public String toString() {
        return "Prod{" +
                "prodCd='" + prodCd + '\'' +
                '}';
    }
}
