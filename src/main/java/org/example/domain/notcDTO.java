package org.example.domain;

import java.sql.Date;

public class NotcDTO {

    private String BBSO_NO;
    private String TTL;
    private String CN;
    private String WRTD;
    private String WRTR;
    private Integer NOTC_CNT;
    private String CATE;
    private Date FST_REG;
    private String FST_REGR;
    private Date LAST_UPD;
    private String LAST_UPDR;
    private String USE_YN;

    public NotcDTO(){}
    public NotcDTO(String BBSO_NO, String TTL, String CN, String WRTD, String WRTR, Integer NOTC_CNT, String CATE, String FST_REGR, String LAST_UPDR, String USE_YN) {
        this.BBSO_NO = BBSO_NO;
        this.TTL = TTL;
        this.CN = CN;
        this.WRTD = WRTD;
        this.WRTR = WRTR;
        this.NOTC_CNT = NOTC_CNT;
        this.CATE = CATE;
        this.FST_REGR = FST_REGR;
        this.LAST_UPDR = LAST_UPDR;
        this.USE_YN = USE_YN;
    }

    public String getBBSO_NO() {
        return BBSO_NO;
    }

    public void setBBSO_NO(String BBSO_NO) {
        this.BBSO_NO = BBSO_NO;
    }

    public String getTTL() {
        return TTL;
    }

    public void setTTL(String TTL) {
        this.TTL = TTL;
    }

    public String getCN() {
        return CN;
    }

    public void setCN(String CN) {
        this.CN = CN;
    }

    public String getWRTD() {
        return WRTD;
    }

    public void setWRTD(String WRTD) {
        this.WRTD = WRTD;
    }

    public String getWRTR() {
        return WRTR;
    }

    public void setWRTR(String WRTR) {
        this.WRTR = WRTR;
    }

    public Integer getNOTC_CNT() {
        return NOTC_CNT;
    }

    public void setNOTC_CNT(Integer NOTC_CNT) {
        this.NOTC_CNT = NOTC_CNT;
    }

    public String getCATE() {
        return CATE;
    }

    public void setCATE(String CATE) {
        this.CATE = CATE;
    }

    public Date getFST_REG() {
        return FST_REG;
    }

    public void setFST_REG(Date FST_REG) {
        this.FST_REG = FST_REG;
    }

    public String getFST_REGR() {
        return FST_REGR;
    }

    public void setFST_REGR(String FST_REGR) {
        this.FST_REGR = FST_REGR;
    }

    public Date getLAST_UPD() {
        return LAST_UPD;
    }

    public void setLAST_UPD(Date LAST_UPD) {
        this.LAST_UPD = LAST_UPD;
    }

    public String getLAST_UPDR() {
        return LAST_UPDR;
    }

    public void setLAST_UPDR(String LAST_UPDR) {
        this.LAST_UPDR = LAST_UPDR;
    }

    public String getUSE_YN() {
        return USE_YN;
    }

    public void setUSE_YN(String USE_YN) {
        this.USE_YN = USE_YN;
    }

    @Override
    public String toString() {
        return "notcDTO{" +
                "BBSO_NO='" + BBSO_NO + '\'' +
                ", TTL='" + TTL + '\'' +
                ", CN='" + CN + '\'' +
                ", WRTD='" + WRTD + '\'' +
                ", WRTR='" + WRTR + '\'' +
                ", NOTC_CNT=" + NOTC_CNT +
                ", CATE='" + CATE + '\'' +
                ", FST_REG=" + FST_REG +
                ", FST_REGR='" + FST_REGR + '\'' +
                ", LAST_UPD=" + LAST_UPD +
                ", LAST_UPDR='" + LAST_UPDR + '\'' +
                ", USE_YN='" + USE_YN + '\'' +
                '}';
    }
}
