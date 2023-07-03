package org.example.domain;

import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Date;

@Component
public class ProdImgDto {

    private String prodCd; // 상품코드
    private String sn; // 일련번호
    private String imgName; // 이미지 이름
    private String imgUse; // 이미지 용도
    private String imgPath; // 이미지 경로
    private String imgWid; // 이미지 가로사이즈
    private String imgHei; // 이미지 세로사이즈
    private String imgExtns; // 이미지 확장자
    private LocalDateTime regDttm; // 등록날짜
    private LocalDateTime modDttm; // 수정날짜
    private String remark; // 비고
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

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public String getImgName() {
        return imgName;
    }

    public void setImgName(String imgName) {
        this.imgName = imgName;
    }

    public String getImgUse() {
        return imgUse;
    }

    public void setImgUse(String imgUse) {
        this.imgUse = imgUse;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getImgWid() {
        return imgWid;
    }

    public void setImgWid(String imgWid) {
        this.imgWid = imgWid;
    }

    public String getImgHei() {
        return imgHei;
    }

    public void setImgHei(String imgHei) {
        this.imgHei = imgHei;
    }

    public String getImgExtns() {
        return imgExtns;
    }

    public void setImgExtns(String imgExtns) {
        this.imgExtns = imgExtns;
    }

    public LocalDateTime getRegDttm() {
        return regDttm;
    }

    public void setRegDttm(LocalDateTime regDttm) {
        this.regDttm = regDttm;
    }

    public LocalDateTime getModDttm() {
        return modDttm;
    }

    public void setModDttm(LocalDateTime modDttm) {
        this.modDttm = modDttm;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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
        return "ProdImgDto{" +
                "prodCd='" + prodCd + '\'' +
                ", sn='" + sn + '\'' +
                ", imgName='" + imgName + '\'' +
                ", imgUse='" + imgUse + '\'' +
                ", imgPath='" + imgPath + '\'' +
                ", imgWid='" + imgWid + '\'' +
                ", imgHei='" + imgHei + '\'' +
                ", imgExtns='" + imgExtns + '\'' +
                ", regDttm=" + regDttm +
                ", modDttm=" + modDttm +
                ", remark='" + remark + '\'' +
                ", fst_reg=" + fst_reg +
                ", fst_regr='" + fst_regr + '\'' +
                ", last_upd=" + last_upd +
                ", last_updr='" + last_updr + '\'' +
                '}';
    }
}