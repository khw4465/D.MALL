package org.example.domain;

public class ClsData {

    private String clsCd; // 분류코드

    public String getClsCd() {
        return clsCd;
    }

    public void setClsCd(String clsCd) {
        this.clsCd = clsCd;
    }

    @Override
    public String toString() {
        return "Cls_data{" +
                "clsCd='" + clsCd + '\'' +
                '}';
    }
}
