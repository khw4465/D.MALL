package org.example.domain;
import java.util.Date;
import java.util.Objects;

public class DlvAddrDto {
    private int seq;   // 배송지아이디
    private String custId;  // 회원아이디
    private String rcpr;    // 수령인
    private int addrNo; // 배송지번호
    private String dlvAddr; // 배송주소
    private String zpcd;    // 우편번호
    private String dtlAddr; // 상세주소
    private String mpNo; // 핸드폰번호
    private String dlvpn; //배송지명
    private String basicYn;  // 기본배송지 여부
    private Date createDate;    // 배송지 생성날짜
    private Date fstReg;    // 최초등록일시
    private String fstRegr; // 최초등록자식별번호
    private Date lastUpd;   // 최종수정일시
    private String lastUpdr;    //최종수정자식별번호

    public DlvAddrDto() {}

    public DlvAddrDto(int seq, String custId, String rcpr, int addrNo, String dlvAddr, String zpcd, String dtlAddr, String mpNo, String dlvpn, String basicYn, Date createDate, Date fstReg, String fstRegr, Date lastUpd, String lastUpdr) {
        this.seq = seq;
        this.custId = custId;
        this.rcpr = rcpr;
        this.addrNo = addrNo;
        this.dlvAddr = dlvAddr;
        this.zpcd = zpcd;
        this.dtlAddr = dtlAddr;
        this.mpNo = mpNo;
        this.dlvpn = dlvpn;
        this.basicYn = basicYn;
        this.createDate = createDate;
        this.fstReg = fstReg;
        this.fstRegr = fstRegr;
        this.lastUpd = lastUpd;
        this.lastUpdr = lastUpdr;
    }

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getCustId() {
        return custId;
    }

    public void setCustId(String custId) {
        this.custId = custId;
    }

    public String getRcpr() {
        return rcpr;
    }

    public void setRcpr(String rcpr) {
        this.rcpr = rcpr;
    }

    public int getAddrNo() {
        return addrNo;
    }

    public void setAddrNo(int addrNo) {
        this.addrNo = addrNo;
    }

    public String getDlvAddr() {
        return dlvAddr;
    }

    public void setDlvAddr(String dlvAddr) {
        this.dlvAddr = dlvAddr;
    }

    public String getZpcd() {
        return zpcd;
    }

    public void setZpcd(String zpcd) {
        this.zpcd = zpcd;
    }

    public String getDtlAddr() {
        return dtlAddr;
    }

    public void setDtlAddr(String dtlAddr) {
        this.dtlAddr = dtlAddr;
    }

    public String getMpNo() {
        return mpNo;
    }

    public void setMpNo(String mpNo) {
        this.mpNo = mpNo;
    }

    public String getDlvpn() {
        return dlvpn;
    }

    public void setDlvpn(String dlvpn) {
        this.dlvpn = dlvpn;
    }

    public String getBasicYn() {
        return basicYn;
    }

    public void setBasicYn(String basicYn) {
        this.basicYn = basicYn;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
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

        DlvAddrDto that = (DlvAddrDto) o;

        if (seq != that.seq) return false;
        if (addrNo != that.addrNo) return false;
        if (!Objects.equals(custId, that.custId)) return false;
        if (!Objects.equals(rcpr, that.rcpr)) return false;
        if (!Objects.equals(dlvAddr, that.dlvAddr)) return false;
        if (!Objects.equals(zpcd, that.zpcd)) return false;
        if (!Objects.equals(dtlAddr, that.dtlAddr)) return false;
        if (!Objects.equals(mpNo, that.mpNo)) return false;
        if (!Objects.equals(dlvpn, that.dlvpn)) return false;
        if (!Objects.equals(basicYn, that.basicYn)) return false;
        if (!Objects.equals(createDate, that.createDate)) return false;
        if (!Objects.equals(fstReg, that.fstReg)) return false;
        if (!Objects.equals(fstRegr, that.fstRegr)) return false;
        if (!Objects.equals(lastUpd, that.lastUpd)) return false;
        return Objects.equals(lastUpdr, that.lastUpdr);
    }

    @Override
    public int hashCode() {
        int result = seq;
        result = 31 * result + (custId != null ? custId.hashCode() : 0);
        result = 31 * result + (rcpr != null ? rcpr.hashCode() : 0);
        result = 31 * result + addrNo;
        result = 31 * result + (dlvAddr != null ? dlvAddr.hashCode() : 0);
        result = 31 * result + (zpcd != null ? zpcd.hashCode() : 0);
        result = 31 * result + (dtlAddr != null ? dtlAddr.hashCode() : 0);
        result = 31 * result + (mpNo != null ? mpNo.hashCode() : 0);
        result = 31 * result + (dlvpn != null ? dlvpn.hashCode() : 0);
        result = 31 * result + (basicYn != null ? basicYn.hashCode() : 0);
        result = 31 * result + (createDate != null ? createDate.hashCode() : 0);
        result = 31 * result + (fstReg != null ? fstReg.hashCode() : 0);
        result = 31 * result + (fstRegr != null ? fstRegr.hashCode() : 0);
        result = 31 * result + (lastUpd != null ? lastUpd.hashCode() : 0);
        result = 31 * result + (lastUpdr != null ? lastUpdr.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "DlvAddrDto{" +
                "seq=" + seq +
                ", custId='" + custId + '\'' +
                ", rcpr='" + rcpr + '\'' +
                ", addrNo=" + addrNo +
                ", dlvAddr='" + dlvAddr + '\'' +
                ", zpcd='" + zpcd + '\'' +
                ", dtlAddr='" + dtlAddr + '\'' +
                ", mpNo='" + mpNo + '\'' +
                ", dlvpn='" + dlvpn + '\'' +
                ", basicYn='" + basicYn + '\'' +
                ", createDate=" + createDate +
                ", fstReg=" + fstReg +
                ", fstRegr='" + fstRegr + '\'' +
                ", lastUpd=" + lastUpd +
                ", lastUpdr='" + lastUpdr + '\'' +
                '}';
    }
}
