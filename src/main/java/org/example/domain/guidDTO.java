package org.example.domain;
import java.sql.Date;
public class guidDTO {
    private String BBSO_NO;
    private String TTL;
    private String CN;
    private String WRTR;
    private boolean USE_YN;
    private Date FST_REG;
    private String FST_REGR;
    private Date LAST_UPD;
    private String LAST_UPDR;

    public guidDTO(){}
    public guidDTO(String BBSO_NO, String TTL, String CN, String WRTR, boolean USE_YN,  String FST_REGR, String LAST_UPDR) {
        this.BBSO_NO = BBSO_NO;
        this.TTL = TTL;
        this.CN = CN;
        this.WRTR = WRTR;
        this.USE_YN = USE_YN;
        this.FST_REGR = FST_REGR;
        this.LAST_UPDR = LAST_UPDR;
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

    public String getWRTR() {
        return WRTR;
    }

    public void setWRTR(String WRTR) {
        this.WRTR = WRTR;
    }

    public boolean isUSE_YN() {
        return USE_YN;
    }

    public void setUSE_YN(boolean USE_YN) {
        this.USE_YN = USE_YN;
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

    @Override
    public String toString() {
        return "guidDTO{" +
                "BBSO_NO='" + BBSO_NO + '\'' +
                ", TTL='" + TTL + '\'' +
                ", CN='" + CN + '\'' +
                ", WRTR='" + WRTR + '\'' +
                ", USE_YN=" + USE_YN +
                ", FST_REG=" + FST_REG +
                ", FST_REGR='" + FST_REGR + '\'' +
                ", LAST_UPD=" + LAST_UPD +
                ", LAST_UPDR='" + LAST_UPDR + '\'' +
                '}';
    }
}
