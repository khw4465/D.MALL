package org.example.domain;

import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Date;

@Component
public class ProdDescDto {
    private String prodCd; // 상품코드
    private String basicDesc; // 상품기본설명
    private String dtilDesc; // 상품상세설명
    private String salesDttmFrom; // 판매시작일
    private String salesDttmTo; // 판매종료일
    private String salesPid; // 판매기간
    private String stgMetd; // 상품보관방법
    private String crOri; // 원산지
    private String mfCd; // 상품제조사번호
    private String brndName; // 브랜드명
    private String mnfctDttm; // 제조년월일시
    private String nutInfo; // 영양성분
    private String custId; // 회원아이디
    private String info; // 상품안내사항
    private String expiDttm; // 유통기한
    private LocalDateTime fstReg; // 최초등록일시
    private String fstRegr; // 최초등록자식별번호
    private LocalDateTime lastUpd; // 최종수정일시
    private String lastUpdr; // 최종수정자식별번호
    private Date fst_reg; //최초등록일시
    private String fst_regr; //최초등록자식별번호
    private Date last_upd; //최종수정일시
    private String last_updr; //최종수정자식별번호

    public String getProdCd() {
        return prodCd;
    }

    public void setProdCd(String prodCd) {
        this.prodCd = prodCd;
    }

    public String getBasicDesc() {
        return basicDesc;
    }

    public void setBasicDesc(String basicDesc) {
        this.basicDesc = basicDesc;
    }

    public String getDtilDesc() {
        return dtilDesc;
    }

    public void setDtilDesc(String dtilDesc) {
        this.dtilDesc = dtilDesc;
    }

    public String getSalesDttmFrom() {
        return salesDttmFrom;
    }

    public void setSalesDttmFrom(String salesDttmFrom) {
        this.salesDttmFrom = salesDttmFrom;
    }

    public String getSalesDttmTo() {
        return salesDttmTo;
    }

    public void setSalesDttmTo(String salesDttmTo) {
        this.salesDttmTo = salesDttmTo;
    }

    public String getSalesPid() {
        return salesPid;
    }

    public void setSalesPid(String salesPid) {
        this.salesPid = salesPid;
    }

    public String getStgMetd() {
        return stgMetd;
    }

    public void setStgMetd(String stgMetd) {
        this.stgMetd = stgMetd;
    }

    public String getCrOri() {
        return crOri;
    }

    public void setCrOri(String crOri) {
        this.crOri = crOri;
    }

    public String getMfCd() {
        return mfCd;
    }

    public void setMfCd(String mfCd) {
        this.mfCd = mfCd;
    }

    public String getBrndName() {
        return brndName;
    }

    public void setBrndName(String brndName) {
        this.brndName = brndName;
    }

    public String getMnfctDttm() {
        return mnfctDttm;
    }

    public void setMnfctDttm(String mnfctDttm) {
        this.mnfctDttm = mnfctDttm;
    }

    public String getNutInfo() {
        return nutInfo;
    }

    public void setNutInfo(String nutInfo) {
        this.nutInfo = nutInfo;
    }

    public String getCustId() {
        return custId;
    }

    public void setCustId(String custId) {
        this.custId = custId;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getExpiDttm() {
        return expiDttm;
    }

    public void setExpiDttm(String expiDttm) {
        this.expiDttm = expiDttm;
    }

    public LocalDateTime getFstReg() {
        return fstReg;
    }

    public void setFstReg(LocalDateTime fstReg) {
        this.fstReg = fstReg;
    }

    public String getFstRegr() {
        return fstRegr;
    }

    public void setFstRegr(String fstRegr) {
        this.fstRegr = fstRegr;
    }

    public LocalDateTime getLastUpd() {
        return lastUpd;
    }

    public void setLastUpd(LocalDateTime lastUpd) {
        this.lastUpd = lastUpd;
    }

    public String getLastUpdr() {
        return lastUpdr;
    }

    public void setLastUpdr(String lastUpdr) {
        this.lastUpdr = lastUpdr;
    }

    public Date getFst_reg() {
        return fst_reg;
    }

    public void setFst_reg(Date fst_reg) {
        this.fst_reg = fst_reg;
    }

    public String getFst_regr() {
        return fst_regr;
    }

    public void setFst_regr(String fst_regr) {
        this.fst_regr = fst_regr;
    }

    public Date getLast_upd() {
        return last_upd;
    }

    public void setLast_upd(Date last_upd) {
        this.last_upd = last_upd;
    }

    public String getLast_updr() {
        return last_updr;
    }

    public void setLast_updr(String last_updr) {
        this.last_updr = last_updr;
    }

    @Override
    public String toString() {
        return "ProdDescDto{" +
                "prodCd='" + prodCd + '\'' +
                ", basicDesc='" + basicDesc + '\'' +
                ", dtilDesc='" + dtilDesc + '\'' +
                ", salesDttmFrom='" + salesDttmFrom + '\'' +
                ", salesDttmTo='" + salesDttmTo + '\'' +
                ", salesPid='" + salesPid + '\'' +
                ", stgMetd='" + stgMetd + '\'' +
                ", crOri='" + crOri + '\'' +
                ", mfCd='" + mfCd + '\'' +
                ", brndName='" + brndName + '\'' +
                ", mnfctDttm='" + mnfctDttm + '\'' +
                ", nutInfo='" + nutInfo + '\'' +
                ", custId='" + custId + '\'' +
                ", info='" + info + '\'' +
                ", expiDttm='" + expiDttm + '\'' +
                ", fstReg=" + fstReg +
                ", fstRegr='" + fstRegr + '\'' +
                ", lastUpd=" + lastUpd +
                ", lastUpdr='" + lastUpdr + '\'' +
                ", fst_reg=" + fst_reg +
                ", fst_regr='" + fst_regr + '\'' +
                ", last_upd=" + last_upd +
                ", last_updr='" + last_updr + '\'' +
                '}';
    }
}
