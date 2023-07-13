package org.example.domain;
import java.util.Date;
import java.util.Objects;

public class OrderDto {
    private String ordCd;   // 주문코드
    private String custId;  // 회원아이디
    private String prodName; // 상품명
    private int totProdcnt;  // 상품개수
    private int totPrc;  // 총금액
    private int totQty;  // 총수량
    private String ordStus; // 주문상태
    private Date stusChgDttm;   // 주문상태변경일시
    private String cfmYn;   // 주문확정여부
    private Date ordDttm;   // 주문일시
    private String dlvAddrId;   // 배송지아이디
    private String dlvMsg;  // 배송메세지
    private String remark;  // 비고
    private Date fstReg;    // 최초등록일시
    private String fstRegr; // 최초등록자식별번호
    private Date lastUpd;   // 최종수정일시
    private String lastUpdr;    // 최종수정자식별번호

    public OrderDto() {
    }
    public OrderDto(String custId, String prodName, int totProdcnt, int totPrc, int totQty) {
        this.custId = custId;
        this.prodName = prodName;
        this.totProdcnt = totProdcnt;
        this.totPrc = totPrc;
        this.totQty = totQty;
    }
    public OrderDto(String ordCd, String custId, String prodName, int totProdcnt, int totPrc, int totQty, String dlvAddrId, String dlvMsg) {
        this.ordCd = ordCd;
        this.custId = custId;
        this.prodName = prodName;
        this.totProdcnt = totProdcnt;
        this.totPrc = totPrc;
        this.totQty = totQty;
        this.dlvAddrId = dlvAddrId;
        this.dlvMsg = dlvMsg;
    }

    public OrderDto(String cfmYn, String ordCd, String custId) {
        this.cfmYn = cfmYn;
        this.ordCd = ordCd;
        this.custId = custId;
    }

    public OrderDto(String ordCd, String custId, String prodName, int totProdcnt, int totPrc, int totQty, String ordStus, Date stusChgDttm, String cfmYn, Date ordDttm, String dlvAddrId, String dlvMsg, String remark, Date fstReg, String fstRegr, Date lastUpd, String lastUpdr) {
        this.ordCd = ordCd;
        this.custId = custId;
        this.prodName = prodName;
        this.totProdcnt = totProdcnt;
        this.totPrc = totPrc;
        this.totQty = totQty;
        this.ordStus = ordStus;
        this.stusChgDttm = stusChgDttm;
        this.cfmYn = cfmYn;
        this.ordDttm = ordDttm;
        this.dlvAddrId = dlvAddrId;
        this.dlvMsg = dlvMsg;
        this.remark = remark;
        this.fstReg = fstReg;
        this.fstRegr = fstRegr;
        this.lastUpd = lastUpd;
        this.lastUpdr = lastUpdr;
    }

    public String getOrdCd() {
        return ordCd;
    }

    public void setOrdCd(String ordCd) {
        this.ordCd = ordCd;
    }

    public String getCustId() {
        return custId;
    }

    public void setCustId(String custId) {
        this.custId = custId;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public int getTotProdcnt() {
        return totProdcnt;
    }

    public void setTotProdcnt(int totProdcnt) {
        this.totProdcnt = totProdcnt;
    }

    public int getTotPrc() {
        return totPrc;
    }

    public void setTotPrc(int totPrc) {
        this.totPrc = totPrc;
    }

    public int getTotQty() {
        return totQty;
    }

    public void setTotQty(int totQty) {
        this.totQty = totQty;
    }

    public String getOrdStus() {
        return ordStus;
    }

    public void setOrdStus(String ordStus) {
        this.ordStus = ordStus;
    }

    public Date getStusChgDttm() {
        return stusChgDttm;
    }

    public void setStusChgDttm(Date stusChgDttm) {
        this.stusChgDttm = stusChgDttm;
    }

    public String getCfmYn() {
        return cfmYn;
    }

    public void setCfmYn(String cfmYn) {
        this.cfmYn = cfmYn;
    }

    public Date getOrdDttm() {
        return ordDttm;
    }

    public void setOrdDttm(Date ordDttm) {
        this.ordDttm = ordDttm;
    }

    public String getDlvAddrId() {
        return dlvAddrId;
    }

    public void setDlvAddrId(String dlvAddrId) {
        this.dlvAddrId = dlvAddrId;
    }

    public String getDlvMsg() {
        return dlvMsg;
    }

    public void setDlvMsg(String dlvMsg) {
        this.dlvMsg = dlvMsg;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getFstReg() {
        return fstReg;
    }

    public void setFstReg(Date fstReg) {
        this.fstReg = fstReg;
    }

    public String getfstRegr() {
        return fstRegr;
    }

    public void setfstRegr(String fstRegr) {
        this.fstRegr = fstRegr;
    }

    public Date getLastUpd() {
        return lastUpd;
    }

    public void setLastUpd(Date lastUpd) {
        this.lastUpd = lastUpd;
    }

    public String getlastUpdr() {
        return lastUpdr;
    }

    public void setlastUpdr(String lastUpdr) {
        this.lastUpdr = lastUpdr;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrderDto orderDto = (OrderDto) o;

        if (totProdcnt != orderDto.totProdcnt) return false;
        if (totPrc != orderDto.totPrc) return false;
        if (totQty != orderDto.totQty) return false;
        if (!Objects.equals(ordCd, orderDto.ordCd)) return false;
        if (!Objects.equals(custId, orderDto.custId)) return false;
        if (!Objects.equals(prodName, orderDto.prodName)) return false;
        if (!Objects.equals(ordStus, orderDto.ordStus)) return false;
        if (!Objects.equals(stusChgDttm, orderDto.stusChgDttm))
            return false;
        if (!Objects.equals(cfmYn, orderDto.cfmYn)) return false;
        if (!Objects.equals(ordDttm, orderDto.ordDttm)) return false;
        if (!Objects.equals(dlvAddrId, orderDto.dlvAddrId)) return false;
        if (!Objects.equals(dlvMsg, orderDto.dlvMsg)) return false;
        if (!Objects.equals(remark, orderDto.remark)) return false;
        if (!Objects.equals(fstReg, orderDto.fstReg)) return false;
        if (!Objects.equals(fstRegr, orderDto.fstRegr)) return false;
        if (!Objects.equals(lastUpd, orderDto.lastUpd)) return false;
        return Objects.equals(lastUpdr, orderDto.lastUpdr);
    }

    @Override
    public int hashCode() {
        int result = ordCd != null ? ordCd.hashCode() : 0;
        result = 31 * result + (custId != null ? custId.hashCode() : 0);
        result = 31 * result + (prodName != null ? prodName.hashCode() : 0);
        result = 31 * result + totProdcnt;
        result = 31 * result + totPrc;
        result = 31 * result + totQty;
        result = 31 * result + (ordStus != null ? ordStus.hashCode() : 0);
        result = 31 * result + (stusChgDttm != null ? stusChgDttm.hashCode() : 0);
        result = 31 * result + (cfmYn != null ? cfmYn.hashCode() : 0);
        result = 31 * result + (ordDttm != null ? ordDttm.hashCode() : 0);
        result = 31 * result + (dlvAddrId != null ? dlvAddrId.hashCode() : 0);
        result = 31 * result + (dlvMsg != null ? dlvMsg.hashCode() : 0);
        result = 31 * result + (remark != null ? remark.hashCode() : 0);
        result = 31 * result + (fstReg != null ? fstReg.hashCode() : 0);
        result = 31 * result + (fstRegr != null ? fstRegr.hashCode() : 0);
        result = 31 * result + (lastUpd != null ? lastUpd.hashCode() : 0);
        result = 31 * result + (lastUpdr != null ? lastUpdr.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "OrderDto{" +
                "ordCd='" + ordCd + '\'' +
                ", custId='" + custId + '\'' +
                ", prodName='" + prodName + '\'' +
                ", totProdcnt=" + totProdcnt +
                ", totPrc=" + totPrc +
                ", totQty=" + totQty +
                ", ordStus='" + ordStus + '\'' +
                ", stusChgDttm=" + stusChgDttm +
                ", cfmYn='" + cfmYn + '\'' +
                ", ordDttm=" + ordDttm +
                ", dlvAddrId='" + dlvAddrId + '\'' +
                ", dlvMsg='" + dlvMsg + '\'' +
                ", remark='" + remark + '\'' +
                ", fstReg=" + fstReg +
                ", fstRegr='" + fstRegr + '\'' +
                ", lastUpd=" + lastUpd +
                ", lastUpdr='" + lastUpdr + '\'' +
                '}';
    }
}