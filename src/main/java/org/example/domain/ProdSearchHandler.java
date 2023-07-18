package org.example.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class ProdSearchHandler {
    private ProdSearchCondition psc;
    // private String keyword ="";
    // private String option ="";




    private int totalCnt;

    public ProdSearchHandler(ProdSearchCondition psc){
        this.psc = psc;
    }
    public ProdSearchHandler(int totalCnt, ProdSearchCondition psc) {
        this.totalCnt = totalCnt;
        this.psc = psc;
    }

    public ProdSearchCondition getPsc() {
        return psc;
    }

    public void setPsc(ProdSearchCondition psc) {
        this.psc = psc;
    }

    public int getTotalCnt() {
        return totalCnt;
    }

    public void setTotalCnt(int totalCnt) {
        this.totalCnt = totalCnt;
    }

    @Override
    public String toString() {
        return "ProdSearchHandler{" +
                "psc=" + psc +
                ", totalCnt=" + totalCnt +
                '}';
    }
}
