package org.example.domain;

import java.time.LocalDateTime;
import java.util.Objects;

public class LoginHistoryDTO {
    private String lginHistId; // 로그인이력아이디
    private String custId; // 회원아이디
    private LocalDateTime dttm; // 로그인일자
    private String scssYn; // 로그인여부
    private String ip; // 로그인IP
    private String tp; // 로그인유형
    private String failCaus; // 로그인실패원인
    private String natn; // 로그인국가
    private String mhrLS; // 로그인기기
    private String vldTerm; // 유효기간
    private int failCnt; // 실패횟수
    private LocalDateTime fstReg; // 최초등록일시
    private String fstRegr; // 최초등록자식별번호
    private LocalDateTime lastUpd; // 최종수정일시
    private String lastUpdr; // 최종수정자식별번호

    public LoginHistoryDTO(){}; //기본생성자 넣어야함

    public LoginHistoryDTO(String lginHistId, String custId, LocalDateTime dttm, String scssYn, String ip, String tp, String failCaus, String natn, String mhrLS, String vldTerm, int failCnt, LocalDateTime fstReg, String fstRegr, LocalDateTime lastUpd, String lastUpdr) {
        this.lginHistId = lginHistId;
        this.custId = custId;
        this.dttm = dttm;
        this.scssYn = scssYn;
        this.ip = ip;
        this.tp = tp;
        this.failCaus = failCaus;
        this.natn = natn;
        this.mhrLS = mhrLS;
        this.vldTerm = vldTerm;
        this.failCnt = failCnt;
        this.fstReg = fstReg;
        this.fstRegr = fstRegr;
        this.lastUpd = lastUpd;
        this.lastUpdr = lastUpdr;
    }

    public String getLginHistId() {
        return lginHistId;
    }

    public void setLginHistId(String lginHistId) {
        this.lginHistId = lginHistId;
    }

    public String getCustId() {
        return custId;
    }

    public void setCustId(String custId) {
        this.custId = custId;
    }

    public LocalDateTime getDttm() {
        return dttm;
    }

    public void setDttm(LocalDateTime dttm) {
        this.dttm = dttm;
    }

    public String getScssYn() {
        return scssYn;
    }

    public void setScssYn(String scssYn) {
        this.scssYn = scssYn;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getTp() {
        return tp;
    }

    public void setTp(String tp) {
        this.tp = tp;
    }

    public String getFailCaus() {
        return failCaus;
    }

    public void setFailCaus(String failCaus) {
        this.failCaus = failCaus;
    }

    public String getNatn() {
        return natn;
    }

    public void setNatn(String natn) {
        this.natn = natn;
    }

    public String getMhrLS() {
        return mhrLS;
    }

    public void setMhrLS(String mhrLS) {
        this.mhrLS = mhrLS;
    }

    public String getVldTerm() {
        return vldTerm;
    }

    public void setVldTerm(String vldTerm) {
        this.vldTerm = vldTerm;
    }

    public int getFailCnt() {
        return failCnt;
    }

    public void setFailCnt(int failCnt) {
        this.failCnt = failCnt;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        LoginHistoryDTO that = (LoginHistoryDTO) o;
        return failCnt == that.failCnt && Objects.equals(lginHistId, that.lginHistId) && Objects.equals(custId, that.custId) && Objects.equals(scssYn, that.scssYn) && Objects.equals(ip, that.ip) && Objects.equals(tp, that.tp) && Objects.equals(failCaus, that.failCaus) && Objects.equals(natn, that.natn) && Objects.equals(mhrLS, that.mhrLS) && Objects.equals(vldTerm, that.vldTerm) && Objects.equals(fstRegr, that.fstRegr) && Objects.equals(lastUpdr, that.lastUpdr);
    }

    @Override
    public int hashCode() {
        return Objects.hash(lginHistId, custId, scssYn, ip, tp, failCaus, natn, mhrLS, vldTerm, failCnt, fstRegr, lastUpdr);
    }

    @Override
    public String toString() {
        return "LoginHistoryDTO{" +
                "lginHistId='" + lginHistId + '\'' +
                ", custId='" + custId + '\'' +
                ", dttm=" + dttm +
                ", scssYn='" + scssYn + '\'' +
                ", ip='" + ip + '\'' +
                ", tp='" + tp + '\'' +
                ", failCaus='" + failCaus + '\'' +
                ", natn='" + natn + '\'' +
                ", mhrLS='" + mhrLS + '\'' +
                ", vldTerm='" + vldTerm + '\'' +
                ", failCnt=" + failCnt +
                ", fstReg=" + fstReg +
                ", fstRegr='" + fstRegr + '\'' +
                ", lastUpd=" + lastUpd +
                ", lastUpdr='" + lastUpdr + '\'' +
                '}';
    }
}
