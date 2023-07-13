package org.example.domain;
import java.sql.Date;
import java.util.Objects;

public class faqDTO {
    private String BBSO_NO;
    private String TTL;
    private String CN;
    private String KWRD;
    private String CATE;
    private Integer FAQ_CNT;
    private Date FST_REG;
    private String FST_REGR;
    private Date LAST_UPD;
    private String LAST_UPDR;
    boolean USE_YN;

    public faqDTO(){}
    public faqDTO(String BBSO_NO, String TTL, String CN, String KWRD, String CATE, Integer FAQ_CNT, Date FST_REG, String FST_REGR, Date LAST_UPD, String LAST_UPDR, boolean USE_YN) {
        this.BBSO_NO = BBSO_NO;
        this.TTL = TTL;
        this.CN = CN;
        this.KWRD = KWRD;
        this.CATE = CATE;
        this.FAQ_CNT = FAQ_CNT;
        this.FST_REG = FST_REG;
        this.FST_REGR = FST_REGR;
        this.LAST_UPD = LAST_UPD;
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

    public String getKWRD() {
        return KWRD;
    }

    public void setKWRD(String KWRD) {
        this.KWRD = KWRD;
    }

    public String getCATE() {
        return CATE;
    }

    public void setCATE(String CATE) {
        this.CATE = CATE;
    }

    public Integer getFAQ_CNT() {
        return FAQ_CNT;
    }

    public void setFAQ_CNT(Integer FAQ_CNT) {
        this.FAQ_CNT = FAQ_CNT;
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

    public boolean isUSE_YN() {
        return USE_YN;
    }

    public void setUSE_YN(boolean USE_YN) {
        this.USE_YN = USE_YN;
    }

    @Override
    public String toString() {
        return "faqDTO{" +
                "BBSO_NO='" + BBSO_NO + '\'' +
                ", TTL='" + TTL + '\'' +
                ", CN='" + CN + '\'' +
                ", KWRD='" + KWRD + '\'' +
                ", CATE='" + CATE + '\'' +
                ", FAQ_CNT=" + FAQ_CNT +
                ", FST_REG=" + FST_REG +
                ", FST_REGR='" + FST_REGR + '\'' +
                ", LAST_UPD=" + LAST_UPD +
                ", LAST_UPDR='" + LAST_UPDR + '\'' +
                ", USE_YN='" + USE_YN + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        faqDTO faqDTO = (faqDTO) o;
        return Objects.equals(BBSO_NO, faqDTO.BBSO_NO) && Objects.equals(TTL, faqDTO.TTL) && Objects.equals(CN, faqDTO.CN) && Objects.equals(KWRD, faqDTO.KWRD) && Objects.equals(CATE, faqDTO.CATE) && Objects.equals(FAQ_CNT, faqDTO.FAQ_CNT)  && Objects.equals(FST_REGR, faqDTO.FST_REGR) && Objects.equals(LAST_UPDR, faqDTO.LAST_UPDR) && Objects.equals(USE_YN, faqDTO.USE_YN);
    }

    @Override
    public int hashCode() {
        return Objects.hash(BBSO_NO, TTL, CN, KWRD, CATE, FAQ_CNT,  FST_REGR, LAST_UPDR, USE_YN);
    }
}
