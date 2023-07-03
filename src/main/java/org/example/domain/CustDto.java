package org.example.domain;

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
    private Date regDate; // 회원가입일시11
    private String acNo; // 계좌번호12
    private Date lginDttm; // 최근로그인일자13
    private String gender; // 성별  --이거로 바뀜14
    private String regn; // 지역15
    private Date fstReg; // 최초등록일시16
    private String fstRegr; // 최초등록자식별번호17
    private Date lastUpd; // 최종수정일시18
    private String lastUpdr; // 최종수정자식별번호19

    public CustDto() {
    }

    public CustDto(String pwd, String name, String mpNo, String email, String acNo) {
        this.pwd = pwd;
        this.name = name;
        this.mpNo = mpNo;
        this.email = email;
        this.acNo = acNo;
    }

    public CustDto(String custId, String pwd, String name, String mpNo, String custTp, String grade, String stus, String rcmdr, Date birth, String email, Date regDate, String acNo, Date lginDttm, String gender, String regn, Date fstReg, String fstRegr, Date lastUpd, String lastUpdr) {
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
        this.acNo = acNo;
        this.lginDttm = lginDttm;
        this.gender = gender;
        this.regn = regn;
        this.fstReg = fstReg;
        this.fstRegr = fstRegr;
        this.lastUpd = lastUpd;
        this.lastUpdr = lastUpdr;
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

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public String getAcNo() {
        return acNo;
    }

    public void setAcNo(String acNo) {
        this.acNo = acNo;
    }

    public Date getLginDttm() {
        return lginDttm;
    }

    public void setLginDttm(Date lginDttm) {
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

    public Date getFstReg() {
        return fstReg;
    }

    public void setFstReg(Date fstReg) {
        this.fstReg = fstReg;
    }

    public String getFstRegr() {
        return fstRegr;
    }

    public void setFstRegr(String fstRegr) {
        this.fstRegr = fstRegr;
    }

    public Date getLastUpd() {
        return lastUpd;
    }

    public void setLastUpd(Date lastUpd) {
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

        CustDto custDto = (CustDto) o;

        if (!Objects.equals(custId, custDto.custId)) return false;
        if (!Objects.equals(pwd, custDto.pwd)) return false;
        if (!Objects.equals(name, custDto.name)) return false;
        if (!Objects.equals(mpNo, custDto.mpNo)) return false;
        if (!Objects.equals(custTp, custDto.custTp)) return false;
        if (!Objects.equals(grade, custDto.grade)) return false;
        if (!Objects.equals(stus, custDto.stus)) return false;
        if (!Objects.equals(rcmdr, custDto.rcmdr)) return false;
        if (!Objects.equals(birth, custDto.birth)) return false;
        if (!Objects.equals(email, custDto.email)) return false;
        if (!Objects.equals(regDate, custDto.regDate)) return false;
        if (!Objects.equals(acNo, custDto.acNo)) return false;
        if (!Objects.equals(lginDttm, custDto.lginDttm)) return false;
        if (!Objects.equals(gender, custDto.gender)) return false;
        if (!Objects.equals(regn, custDto.regn)) return false;
        if (!Objects.equals(fstReg, custDto.fstReg)) return false;
        if (!Objects.equals(fstRegr, custDto.fstRegr)) return false;
        if (!Objects.equals(lastUpd, custDto.lastUpd)) return false;
        return Objects.equals(lastUpdr, custDto.lastUpdr);
    }

    @Override
    public int hashCode() {
        int result = custId != null ? custId.hashCode() : 0;
        result = 31 * result + (pwd != null ? pwd.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (mpNo != null ? mpNo.hashCode() : 0);
        result = 31 * result + (custTp != null ? custTp.hashCode() : 0);
        result = 31 * result + (grade != null ? grade.hashCode() : 0);
        result = 31 * result + (stus != null ? stus.hashCode() : 0);
        result = 31 * result + (rcmdr != null ? rcmdr.hashCode() : 0);
        result = 31 * result + (birth != null ? birth.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (regDate != null ? regDate.hashCode() : 0);
        result = 31 * result + (acNo != null ? acNo.hashCode() : 0);
        result = 31 * result + (lginDttm != null ? lginDttm.hashCode() : 0);
        result = 31 * result + (gender != null ? gender.hashCode() : 0);
        result = 31 * result + (regn != null ? regn.hashCode() : 0);
        result = 31 * result + (fstReg != null ? fstReg.hashCode() : 0);
        result = 31 * result + (fstRegr != null ? fstRegr.hashCode() : 0);
        result = 31 * result + (lastUpd != null ? lastUpd.hashCode() : 0);
        result = 31 * result + (lastUpdr != null ? lastUpdr.hashCode() : 0);
        return result;
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
                ", acNo='" + acNo + '\'' +
                ", lginDttm=" + lginDttm +
                ", gender='" + gender + '\'' +
                ", regn='" + regn + '\'' +
                ", fstReg=" + fstReg +
                ", fstRegr='" + fstRegr + '\'' +
                ", lastUpd=" + lastUpd +
                ", lastUpdr='" + lastUpdr + '\'' +
                '}';
    }
}
