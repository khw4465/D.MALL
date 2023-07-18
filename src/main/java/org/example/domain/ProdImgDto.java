package org.example.domain;
import java.util.Date;
import java.util.Objects;

public class ProdImgDto {

    private int seq;
    private String prodCd;
    private String imgCd;
    private String imgType;
    private String imgDesc;
    private String imgPath;
    private Integer imgHeight;
    private Integer imgWidth;
    private String imgExtns;
    private Integer fileLimit;
    private String useYn;
    private String delYn;
    private String remark;
    private Date fstReg;
    private String fstRegr;
    private Date lastUpd;
    private String lastUpdr;

    public ProdImgDto() {}

    public ProdImgDto(String imgCd, String imgPath, String imgExtns) {
        this.imgCd = imgCd;
        this.imgPath = imgPath;
        this.imgExtns = imgExtns;
    }

    public ProdImgDto(int seq, String prodCd, String imgCd, String imgType, String imgDesc, String imgPath, Integer imgHeight, Integer imgWidth, String imgExtns, Integer fileLimit, String useYn, String delYn, String remark, Date fstReg, String fstRegr, Date lastUpd, String lastUpdr) {
        this.seq = seq;
        this.prodCd = prodCd;
        this.imgCd = imgCd;
        this.imgType = imgType;
        this.imgDesc = imgDesc;
        this.imgPath = imgPath;
        this.imgHeight = imgHeight;
        this.imgWidth = imgWidth;
        this.imgExtns = imgExtns;
        this.fileLimit = fileLimit;
        this.useYn = useYn;
        this.delYn = delYn;
        this.remark = remark;
        this.fstReg = fstReg;
        this.fstRegr = fstRegr;
        this.lastUpd = lastUpd;
        this.lastUpdr = lastUpdr;
    }

    public int getSeq() { return seq; }

    public void setSeq(int seq) { this.seq = seq; }

    public String getImgCd() {
        return imgCd;
    }

    public void setImgCd(String imgCd) {
        this.imgCd = imgCd;
    }

    public String getProdCd() {
        return prodCd;
    }

    public void setProdCd(String prodCd) {
        this.prodCd = prodCd;
    }

    public String getImgType() {
        return imgType;
    }

    public void setImgType(String imgType) {
        this.imgType = imgType;
    }

    public String getImgDesc() {
        return imgDesc;
    }

    public void setImgDesc(String imgDesc) {
        this.imgDesc = imgDesc;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public Integer getImgHeight() {
        return imgHeight;
    }

    public void setImgHeight(Integer imgHeight) {
        this.imgHeight = imgHeight;
    }

    public Integer getImgWidth() {
        return imgWidth;
    }

    public void setImgWidth(Integer imgWidth) {
        this.imgWidth = imgWidth;
    }

    public String getImgExtns() {
        return imgExtns;
    }

    public void setImgExtns(String imgExtns) {
        this.imgExtns = imgExtns;
    }

    public Integer getFileLimit() {
        return fileLimit;
    }

    public void setFileLimit(Integer fileLimit) {
        this.fileLimit = fileLimit;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    public String getDelYn() {
        return delYn;
    }

    public void setDelYn(String delYn) {
        this.delYn = delYn;
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

        ProdImgDto that = (ProdImgDto) o;

        if (seq != that.seq) return false;
        if (!Objects.equals(prodCd, that.prodCd)) return false;
        if (!Objects.equals(imgCd, that.imgCd)) return false;
        if (!Objects.equals(imgType, that.imgType)) return false;
        if (!Objects.equals(imgDesc, that.imgDesc)) return false;
        if (!Objects.equals(imgPath, that.imgPath)) return false;
        if (!Objects.equals(imgHeight, that.imgHeight)) return false;
        if (!Objects.equals(imgWidth, that.imgWidth)) return false;
        if (!Objects.equals(imgExtns, that.imgExtns)) return false;
        if (!Objects.equals(fileLimit, that.fileLimit)) return false;
        if (!Objects.equals(useYn, that.useYn)) return false;
        if (!Objects.equals(delYn, that.delYn)) return false;
        if (!Objects.equals(remark, that.remark)) return false;
        if (!Objects.equals(fstReg, that.fstReg)) return false;
        if (!Objects.equals(fstRegr, that.fstRegr)) return false;
        if (!Objects.equals(lastUpd, that.lastUpd)) return false;
        return Objects.equals(lastUpdr, that.lastUpdr);
    }

    @Override
    public int hashCode() {
        int result = seq;
        result = 31 * result + (prodCd != null ? prodCd.hashCode() : 0);
        result = 31 * result + (imgCd != null ? imgCd.hashCode() : 0);
        result = 31 * result + (imgType != null ? imgType.hashCode() : 0);
        result = 31 * result + (imgDesc != null ? imgDesc.hashCode() : 0);
        result = 31 * result + (imgPath != null ? imgPath.hashCode() : 0);
        result = 31 * result + (imgHeight != null ? imgHeight.hashCode() : 0);
        result = 31 * result + (imgWidth != null ? imgWidth.hashCode() : 0);
        result = 31 * result + (imgExtns != null ? imgExtns.hashCode() : 0);
        result = 31 * result + (fileLimit != null ? fileLimit.hashCode() : 0);
        result = 31 * result + (useYn != null ? useYn.hashCode() : 0);
        result = 31 * result + (delYn != null ? delYn.hashCode() : 0);
        result = 31 * result + (remark != null ? remark.hashCode() : 0);
        result = 31 * result + (fstReg != null ? fstReg.hashCode() : 0);
        result = 31 * result + (fstRegr != null ? fstRegr.hashCode() : 0);
        result = 31 * result + (lastUpd != null ? lastUpd.hashCode() : 0);
        result = 31 * result + (lastUpdr != null ? lastUpdr.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "ProdImgDto{" +
                "seq=" + seq +
                ", prodCd='" + prodCd + '\'' +
                ", imgCd='" + imgCd + '\'' +
                ", imgType='" + imgType + '\'' +
                ", imgDesc='" + imgDesc + '\'' +
                ", imgPath='" + imgPath + '\'' +
                ", imgHeight=" + imgHeight +
                ", imgWidth=" + imgWidth +
                ", imgExtns='" + imgExtns + '\'' +
                ", fileLimit=" + fileLimit +
                ", useYn='" + useYn + '\'' +
                ", delYn='" + delYn + '\'' +
                ", remark='" + remark + '\'' +
                ", fstReg=" + fstReg +
                ", fstRegr='" + fstRegr + '\'' +
                ", lastUpd=" + lastUpd +
                ", lastUpdr='" + lastUpdr + '\'' +
                '}';
    }
}
