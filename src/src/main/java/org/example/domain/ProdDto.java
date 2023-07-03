package org.example.domain;

import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;

@Component
public class ProdDto {
    private String salesDttmYn; //판매기간 적용여부
    private String disDttmYn; //할인기간 적용여부
    private String prodCd; //상품코드
    private String clsCd; //분류코드
    private String prodName; //상품명
    private String kwrd; //상품키워드
    private String prodStus; //상품상태
    private String regYn; //상품등록상태
    private String salesYn; //상품판매여부
    private String dspyYn; //상품진열여부
    private String custId; //회원아이디
    private BigDecimal basePrc; //상품기본가격
    private BigDecimal disPrc; //상품할인가격
    private String disYn; //할인 유무
    private String optYn; //옵션적용여부
    private String dcUnit; //할인단위
    private BigDecimal dcVal; //할인값
    private String dcDttmFrom; //할인시작 년-월-일-시-분
    private String dcDttmTo; //할인종료 년-월-일-시-분
    private BigDecimal eval; //평점
    private BigDecimal RW_CNT; //구매후기수
    private String PAYMT_YN; //결제가능여부
    private String SALES_DTTM_FROM; //판매시작 년-월-일-시-분
    private String SALES_DTTM_TO; //판매종료 년-월-일-시-분
    private BigDecimal accPnt; //적립되는포인트%
    private String remark; //비고
    private Date fst_reg; //최초등록일시
    private String fst_regr; //최초등록자식별번호
    private Date last_upd; //최종수정일시
    private String last_updr; //최종수정자식별번호

    public String getSalesDttmYn() {
        return salesDttmYn;
    }

    public void setSalesDttmYn(String salesDttmYn) {
        this.salesDttmYn = salesDttmYn;
    }

    public String getDisDttmYn() {
        return disDttmYn;
    }

    public void setDisDttmYn(String disDttmYn) {
        this.disDttmYn = disDttmYn;
    }

    public String getProdCd() {
        return prodCd;
    }

    public void setProdCd(String prodCd) {
        this.prodCd = prodCd;
    }

    public String getClsCd() {
        return clsCd;
    }

    public void setClsCd(String clsCd) {
        this.clsCd = clsCd;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public String getKwrd() {
        return kwrd;
    }

    public void setKwrd(String kwrd) {
        this.kwrd = kwrd;
    }

    public String getProdStus() {
        return prodStus;
    }

    public void setProdStus(String prodStus) {
        this.prodStus = prodStus;
    }

    public String getRegYn() {
        return regYn;
    }

    public void setRegYn(String regYn) {
        this.regYn = regYn;
    }

    public String getSalesYn() {
        return salesYn;
    }

    public void setSalesYn(String salesYn) {
        this.salesYn = salesYn;
    }

    public String getDspyYn() {
        return dspyYn;
    }

    public void setDspyYn(String dspyYn) {
        this.dspyYn = dspyYn;
    }

    public String getCustId() {
        return custId;
    }

    public void setCustId(String custId) {
        this.custId = custId;
    }

    public BigDecimal getBasePrc() {
        return basePrc;
    }

    public void setBasePrc(BigDecimal basePrc) {
        this.basePrc = basePrc;
    }

    public BigDecimal getDisPrc() {
        return disPrc;
    }

    public void setDisPrc(BigDecimal disPrc) {
        this.disPrc = disPrc;
    }

    public String getDisYn() {
        return disYn;
    }

    public void setDisYn(String disYn) {
        this.disYn = disYn;
    }

    public String getOptYn() {
        return optYn;
    }

    public void setOptYn(String optYn) {
        this.optYn = optYn;
    }

    public String getDcUnit() {
        return dcUnit;
    }

    public void setDcUnit(String dcUnit) {
        this.dcUnit = dcUnit;
    }

    public BigDecimal getDcVal() {
        return dcVal;
    }

    public void setDcVal(BigDecimal dcVal) {
        this.dcVal = dcVal;
    }

    public String getDcDttmFrom() {
        return dcDttmFrom;
    }

    public void setDcDttmFrom(String dcDttmFrom) {
        this.dcDttmFrom = dcDttmFrom;
    }

    public String getDcDttmTo() {
        return dcDttmTo;
    }

    public void setDcDttmTo(String dcDttmTo) {
        this.dcDttmTo = dcDttmTo;
    }

    public BigDecimal getEval() {
        return eval;
    }

    public void setEval(BigDecimal eval) {
        this.eval = eval;
    }

    public BigDecimal getRW_CNT() {
        return RW_CNT;
    }

    public void setRW_CNT(BigDecimal RW_CNT) {
        this.RW_CNT = RW_CNT;
    }

    public String getPAYMT_YN() {
        return PAYMT_YN;
    }

    public void setPAYMT_YN(String PAYMT_YN) {
        this.PAYMT_YN = PAYMT_YN;
    }

    public String getSALES_DTTM_FROM() {
        return SALES_DTTM_FROM;
    }

    public void setSALES_DTTM_FROM(String SALES_DTTM_FROM) {
        this.SALES_DTTM_FROM = SALES_DTTM_FROM;
    }

    public String getSALES_DTTM_TO() {
        return SALES_DTTM_TO;
    }

    public void setSALES_DTTM_TO(String SALES_DTTM_TO) {
        this.SALES_DTTM_TO = SALES_DTTM_TO;
    }

    public BigDecimal getAccPnt() {
        return accPnt;
    }

    public void setAccPnt(BigDecimal accPnt) {
        this.accPnt = accPnt;
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
        return "ProdDto{" +
                "salesDttmYn='" + salesDttmYn + '\'' +
                ", disDttmYn='" + disDttmYn + '\'' +
                ", prodCd='" + prodCd + '\'' +
                ", clsCd='" + clsCd + '\'' +
                ", prodName='" + prodName + '\'' +
                ", kwrd='" + kwrd + '\'' +
                ", prodStus='" + prodStus + '\'' +
                ", regYn='" + regYn + '\'' +
                ", salesYn='" + salesYn + '\'' +
                ", dspyYn='" + dspyYn + '\'' +
                ", custId='" + custId + '\'' +
                ", basePrc=" + basePrc +
                ", disPrc=" + disPrc +
                ", disYn='" + disYn + '\'' +
                ", optYn='" + optYn + '\'' +
                ", dcUnit='" + dcUnit + '\'' +
                ", dcVal=" + dcVal +
                ", dcDttmFrom='" + dcDttmFrom + '\'' +
                ", dcDttmTo='" + dcDttmTo + '\'' +
                ", eval=" + eval +
                ", RW_CNT=" + RW_CNT +
                ", PAYMT_YN='" + PAYMT_YN + '\'' +
                ", SALES_DTTM_FROM='" + SALES_DTTM_FROM + '\'' +
                ", SALES_DTTM_TO='" + SALES_DTTM_TO + '\'' +
                ", accPnt=" + accPnt +
                ", remark='" + remark + '\'' +
                ", fst_reg=" + fst_reg +
                ", fst_regr='" + fst_regr + '\'' +
                ", last_upd=" + last_upd +
                ", last_updr='" + last_updr + '\'' +
                '}';
    }
}
