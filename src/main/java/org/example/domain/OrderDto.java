package org.example.domain;
import java.util.Date;
import java.util.Objects;

public class OrderDto {
    private int seq;
    private String ordCd;   // 주문코드
    private String custId;  // 회원아이디
    private String custName;
    private String mainProdCd; // 대표상품코드
    private String prodName; // 상품명
    private int totProdCnt;  // 상품개수
    private int totPrc;  // 총금액
    private int totQty;  // 총수량
    private int totDcPrc; // 총할인금액
    private String ordStus; // 주문상태
    private Date stusChgDttm;   // 주문상태변경일시
    private String cfmYn;   // 주문확정여부
    private Date ordDttm;   // 주문일시
    private int dlvAddrId;   // 배송지아이디
    private int dlvPrc;  // 배송비
    private String dlvMsg;  // 배송메세지
    private int finPrc; // 최종금액
    private String remark;  // 비고
    private Date fstReg;    // 최초등록일시
    private String fstRegr; // 최초등록자식별번호
    private Date lastUpd;   // 최종수정일시
    private String lastUpdr;    // 최종수정자식별번호

    public OrderDto() {
    }
    public OrderDto(String custId, String mainProdCd, String prodName, int totProdCnt, int totPrc, int totQty) {
        this.custId = custId;
        this.mainProdCd = mainProdCd;
        this.prodName = prodName;
        this.totProdCnt = totProdCnt;
        this.totPrc = totPrc;
        this.totQty = totQty;
    }
    public OrderDto(String ordCd, String custId, String custName, String mainProdCd, String prodName, int totProdCnt, int totPrc, int totQty, int totDcPrc, int dlvAddrId, int dlvPrc, String dlvMsg, int finPrc) {
        this.ordCd = ordCd;
        this.custId = custId;
        this.custName = custName;
        this.mainProdCd = mainProdCd;
        this.prodName = prodName;
        this.totProdCnt = totProdCnt;
        this.totPrc = totPrc;
        this.totQty = totQty;
        this.totDcPrc = totDcPrc;
        this.dlvAddrId = dlvAddrId;
        this.dlvPrc = dlvPrc;
        this.dlvMsg = dlvMsg;
        this.finPrc = finPrc;
    }

    public OrderDto(String cfmYn, String ordCd, String custId) {
        this.cfmYn = cfmYn;
        this.ordCd = ordCd;
        this.custId = custId;
    }

    public OrderDto(String ordCd, String custId, String mainProdCd, String prodName, int totProdCnt, int totPrc, int totQty, int totDcPrc, String ordStus, Date stusChgDttm, String cfmYn, Date ordDttm, String dlvAddrId, int dlvPrc, String dlvMsg, int finPrc, String remark, Date fstReg, String fstRegr, Date lastUpd, String lastUpdr) {
        this.ordCd = ordCd;
        this.custId = custId;
        this.mainProdCd = mainProdCd;
        this.prodName = prodName;
        this.totProdCnt = totProdCnt;
        this.totPrc = totPrc;
        this.totQty = totQty;
    }

    public OrderDto(int seq, String ordCd, String custId, String custName, String mainProdCd, String prodName, int totProdCnt, int totPrc, int totQty, int totDcPrc, String ordStus, Date stusChgDttm, String cfmYn, Date ordDttm, int dlvAddrId, int dlvPrc, String dlvMsg, int finPrc, String remark, Date fstReg, String fstRegr, Date lastUpd, String lastUpdr) {
        this.seq = seq;
        this.ordCd = ordCd;
        this.custId = custId;
        this.custName = custName;
        this.mainProdCd = mainProdCd;
        this.prodName = prodName;
        this.totProdCnt = totProdCnt;
        this.totPrc = totPrc;
        this.totQty = totQty;
        this.totDcPrc = totDcPrc;
        this.ordStus = ordStus;
        this.stusChgDttm = stusChgDttm;
        this.cfmYn = cfmYn;
        this.ordDttm = ordDttm;
        this.dlvAddrId = dlvAddrId;
        this.dlvPrc = dlvPrc;
        this.dlvMsg = dlvMsg;
        this.finPrc = finPrc;
        this.remark = remark;
        this.fstReg = fstReg;
        this.fstRegr = fstRegr;
        this.lastUpd = lastUpd;
        this.lastUpdr = lastUpdr;
    }

    public int getSeq() { return seq; }

    public void setSeq(int seq) { this.seq = seq; }

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

    public String getCustName() { return custName; }

    public void setCustName(String custName) { this.custName = custName; }

    public String getMainProdCd() { return mainProdCd; }

    public void setMainProdCd(String mainProdCd) { this.mainProdCd = mainProdCd; }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public int getTotProdCnt() {
        return totProdCnt;
    }

    public void setTotProdCnt(int totProdCnt) {
        this.totProdCnt = totProdCnt;
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

    public int getTotDcPrc() {
        return totDcPrc;
    }

    public void setTotDcPrc(int totDcPrc) {
        this.totDcPrc = totDcPrc;
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

    public int getDlvAddrId() {
        return dlvAddrId;
    }

    public void setDlvAddrId(int dlvAddrId) {
        this.dlvAddrId = dlvAddrId;
    }

    public int getDlvPrc() {
        return dlvPrc;
    }

    public void setDlvPrc(int dlvPrc) {
        this.dlvPrc = dlvPrc;
    }

    public String getDlvMsg() {
        return dlvMsg;
    }

    public void setDlvMsg(String dlvMsg) {
        this.dlvMsg = dlvMsg;
    }

    public int getFinPrc() {
        return finPrc;
    }

    public void setFinPrc(int finPrc) {
        this.finPrc = finPrc;
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

        OrderDto orderDto = (OrderDto) o;

        if (seq != orderDto.seq) return false;
        if (totProdCnt != orderDto.totProdCnt) return false;
        if (totPrc != orderDto.totPrc) return false;
        if (totQty != orderDto.totQty) return false;
        if (totDcPrc != orderDto.totDcPrc) return false;
        if (dlvAddrId != orderDto.dlvAddrId) return false;
        if (dlvPrc != orderDto.dlvPrc) return false;
        if (finPrc != orderDto.finPrc) return false;
        if (!Objects.equals(ordCd, orderDto.ordCd)) return false;
        if (!Objects.equals(custId, orderDto.custId)) return false;
        if (!Objects.equals(custName, orderDto.custName)) return false;
        if (!Objects.equals(mainProdCd, orderDto.mainProdCd)) return false;
        if (!Objects.equals(prodName, orderDto.prodName)) return false;
        if (!Objects.equals(ordStus, orderDto.ordStus)) return false;
        if (!Objects.equals(stusChgDttm, orderDto.stusChgDttm))
            return false;
        if (!Objects.equals(cfmYn, orderDto.cfmYn)) return false;
        if (!Objects.equals(ordDttm, orderDto.ordDttm)) return false;
        if (!Objects.equals(dlvMsg, orderDto.dlvMsg)) return false;
        if (!Objects.equals(remark, orderDto.remark)) return false;
        if (!Objects.equals(fstReg, orderDto.fstReg)) return false;
        if (!Objects.equals(fstRegr, orderDto.fstRegr)) return false;
        if (!Objects.equals(lastUpd, orderDto.lastUpd)) return false;
        return Objects.equals(lastUpdr, orderDto.lastUpdr);
    }

    @Override
    public int hashCode() {
        int result = seq;
        result = 31 * result + (ordCd != null ? ordCd.hashCode() : 0);
        result = 31 * result + (custId != null ? custId.hashCode() : 0);
        result = 31 * result + (custName != null ? custName.hashCode() : 0);
        result = 31 * result + (mainProdCd != null ? mainProdCd.hashCode() : 0);
        result = 31 * result + (prodName != null ? prodName.hashCode() : 0);
        result = 31 * result + totProdCnt;
        result = 31 * result + totPrc;
        result = 31 * result + totQty;
        result = 31 * result + totDcPrc;
        result = 31 * result + (ordStus != null ? ordStus.hashCode() : 0);
        result = 31 * result + (stusChgDttm != null ? stusChgDttm.hashCode() : 0);
        result = 31 * result + (cfmYn != null ? cfmYn.hashCode() : 0);
        result = 31 * result + (ordDttm != null ? ordDttm.hashCode() : 0);
        result = 31 * result + dlvAddrId;
        result = 31 * result + dlvPrc;
        result = 31 * result + (dlvMsg != null ? dlvMsg.hashCode() : 0);
        result = 31 * result + finPrc;
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
                "seq=" + seq +
                ", ordCd='" + ordCd + '\'' +
                ", custId='" + custId + '\'' +
                ", custName='" + custName + '\'' +
                ", mainProdCd='" + mainProdCd + '\'' +
                ", prodName='" + prodName + '\'' +
                ", totProdCnt=" + totProdCnt +
                ", totPrc=" + totPrc +
                ", totQty=" + totQty +
                ", totDcPrc=" + totDcPrc +
                ", ordStus='" + ordStus + '\'' +
                ", stusChgDttm=" + stusChgDttm +
                ", cfmYn='" + cfmYn + '\'' +
                ", ordDttm=" + ordDttm +
                ", dlvAddrId=" + dlvAddrId +
                ", dlvPrc=" + dlvPrc +
                ", dlvMsg='" + dlvMsg + '\'' +
                ", finPrc=" + finPrc +
                ", remark='" + remark + '\'' +
                ", fstReg=" + fstReg +
                ", fstRegr='" + fstRegr + '\'' +
                ", lastUpd=" + lastUpd +
                ", lastUpdr='" + lastUpdr + '\'' +
                '}';
    }
}