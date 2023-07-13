package org.example.domain;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.Objects;

public class CustDto {
    private String custId; // 회원아이디1
    private String pwd; // 회원비밀번호2
    private String name; // 이름3
    private String mpNo; // 핸드폰번호4
    private String custTp; // 회원유형5
    private String grade; // 회원등급코드6
    private String stus; // 회원상태7
    private String rcmdr; // 추천인아이디8
    private Date birth; // 생년월일9
    private String email; // 이메일10
    private LocalDateTime regDate; // 회원가입일시11
    private String acno; // 계좌번호12
    private LocalDateTime  lginDttm; // 최근로그인일자13
    private String gender; // 성별  --이거로 바뀜14
    private String regn; // 지역15
    private LocalDateTime  fstReg; // 최초등록일시16
    private String fstRegr; // 최초등록자식별번호17
    private LocalDateTime  lastUpd; // 최종수정일시18
    private String lastUpdr; // 최종수정자식별번호19
    private String pwd2 ;
    private String sms;


    public CustDto(){}

    public CustDto(String custId, String pwd, String name, String mpNo, String custTp, String grade, String stus, String rcmdr, Date birth, String email, LocalDateTime regDate, String acno, LocalDateTime lginDttm, String gender, String regn, LocalDateTime fstReg, String fstRegr, LocalDateTime lastUpd, String lastUpdr, String pwd2, String sms) {
        this.custId = custId;
        this.pwd = pwd;
        this.name = name;
        this.mpNo = mpNo;
        this.custTp = custTp;
        this.grade = grade;
        this.stus = stus;
        this.rcmdr = rcmdr;
        this.birth = birth;
        this.email = email;
        this.regDate = regDate;
        this.acno = acno;
        this.lginDttm = lginDttm;
        this.gender = gender;
        this.regn = regn;
        this.fstReg = fstReg;
        this.fstRegr = fstRegr;
        this.lastUpd = lastUpd;
        this.lastUpdr = lastUpdr;
        this.pwd2 = pwd2;
        this.sms = sms;
    }

    @Override
    public String toString() {
        return "CustDto{" +
                "custId='" + custId + '\'' +
                ", pwd='" + pwd + '\'' +
                ", name='" + name + '\'' +
                ", mpNo='" + mpNo + '\'' +
                ", custTp='" + custTp + '\'' +
                ", grade='" + grade + '\'' +
                ", stus='" + stus + '\'' +
                ", rcmdr='" + rcmdr + '\'' +
                ", birth=" + birth +
                ", email='" + email + '\'' +
                ", regDate=" + regDate +
                ", acno='" + acno + '\'' +
                ", lginDttm=" + lginDttm +
                ", gender='" + gender + '\'' +
                ", regn='" + regn + '\'' +
                ", fstReg=" + fstReg +
                ", fstRegr='" + fstRegr + '\'' +
                ", lastUpd=" + lastUpd +
                ", lastUpdr='" + lastUpdr + '\'' +
                ", pwd2='" + pwd2 + '\'' +
                ", sms='" + sms + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CustDto dto = (CustDto) o;
        return Objects.equals(custId, dto.custId) && Objects.equals(pwd, dto.pwd) && Objects.equals(name, dto.name) && Objects.equals(mpNo, dto.mpNo) && Objects.equals(custTp, dto.custTp) && Objects.equals(grade, dto.grade) && Objects.equals(stus, dto.stus) && Objects.equals(rcmdr, dto.rcmdr) && Objects.equals(email, dto.email) && Objects.equals(acno, dto.acno) && Objects.equals(gender, dto.gender) && Objects.equals(regn, dto.regn) && Objects.equals(fstRegr, dto.fstRegr) && Objects.equals(lastUpdr, dto.lastUpdr) && Objects.equals(pwd2, dto.pwd2) && Objects.equals(sms, dto.sms);
    }

    @Override
    public int hashCode() {
        return Objects.hash(custId, pwd, name, mpNo, custTp, grade, stus, rcmdr, email, acno, gender, regn, fstRegr, lastUpdr, pwd2, sms);
    }

    public String getCustId() {
        return custId;
    }

    public void setCustId(String custId) {
        this.custId = custId;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMpNo() {
        return mpNo;
    }

    public void setMpNo(String mpNo) {
        this.mpNo = mpNo;
    }

    public String getCustTp() {
        return custTp;
    }

    public void setCustTp(String custTp) {
        this.custTp = custTp;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getStus() {
        return stus;
    }

    public void setStus(String stus) {
        this.stus = stus;
    }

    public String getRcmdr() {
        return rcmdr;
    }

    public void setRcmdr(String rcmdr) {
        this.rcmdr = rcmdr;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public LocalDateTime getRegDate() {
        return regDate;
    }

    public void setRegDate(LocalDateTime regDate) {
        this.regDate = regDate;
    }

    public String getAcno() {
        return acno;
    }

    public void setAcno(String acno) {
        this.acno = acno;
    }

    public LocalDateTime getLginDttm() {
        return lginDttm;
    }

    public void setLginDttm(LocalDateTime lginDttm) {
        this.lginDttm = lginDttm;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getRegn() {
        return regn;
    }

    public void setRegn(String regn) {
        this.regn = regn;
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

    public String getPwd2() {
        return pwd2;
    }

    public void setPwd2(String pwd2) {
        this.pwd2 = pwd2;
    }

    public String getSms() {
        return sms;
    }

    public void setSms(String sms) {
        this.sms = sms;
    }
}
