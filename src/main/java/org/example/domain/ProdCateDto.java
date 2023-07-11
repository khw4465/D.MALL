package org.example.domain;
import java.util.Date;
import java.util.Objects;

public class ProdCateDto {
    private int cateCd;
    private int mainCate;
    private String mainName;
    private String medName;
    private String useYn;
    private String remark;
    private Date fstReg;
    private String fstRegr;
    private Date lastUpd;
    private String lastUpdr;

    public ProdCateDto() {}
    public ProdCateDto(int cateCd, int mainCate, String mainName, String medName, String useYn, String remark, Date fstReg, String fstRegr, Date lastUpd, String lastUpdr) {
        this.cateCd = cateCd;
        this.mainCate = mainCate;
        this.mainName = mainName;
        this.medName = medName;
        this.useYn = useYn;
        this.remark = remark;
        this.fstReg = fstReg;
        this.fstRegr = fstRegr;
        this.lastUpd = lastUpd;
        this.lastUpdr = lastUpdr;
    }

    public int getCateCd() {
        return cateCd;
    }

    public void setCateCd(int cateCd) {
        this.cateCd = cateCd;
    }

    public int getMainCate() {
        return mainCate;
    }

    public void setMainCate(int mainCate) {
        this.mainCate = mainCate;
    }

    public String getMainName() {
        return mainName;
    }

    public void setMainName(String mainName) {
        this.mainName = mainName;
    }

    public String getMedName() {
        return medName;
    }

    public void setMedName(String medName) {
        this.medName = medName;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
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

        ProdCateDto that = (ProdCateDto) o;

        if (cateCd != that.cateCd) return false;
        if (mainCate != that.mainCate) return false;
        if (!Objects.equals(mainName, that.mainName)) return false;
        if (!Objects.equals(medName, that.medName)) return false;
        if (!Objects.equals(useYn, that.useYn)) return false;
        if (!Objects.equals(remark, that.remark)) return false;
        if (!Objects.equals(fstRegr, that.fstRegr)) return false;
        return Objects.equals(lastUpdr, that.lastUpdr);
    }

    @Override
    public int hashCode() {
        int result = cateCd;
        result = 31 * result + mainCate;
        result = 31 * result + (mainName != null ? mainName.hashCode() : 0);
        result = 31 * result + (medName != null ? medName.hashCode() : 0);
        result = 31 * result + (useYn != null ? useYn.hashCode() : 0);
        result = 31 * result + (remark != null ? remark.hashCode() : 0);
        result = 31 * result + (fstRegr != null ? fstRegr.hashCode() : 0);
        result = 31 * result + (lastUpdr != null ? lastUpdr.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "ProdCateDto{" +
                "cateCd=" + cateCd +
                ", mainCate=" + mainCate +
                ", mainName='" + mainName + '\'' +
                ", medName='" + medName + '\'' +
                ", useYn='" + useYn + '\'' +
                ", remark='" + remark + '\'' +
                ", fstReg=" + fstReg +
                ", fstRegr='" + fstRegr + '\'' +
                ", lastUpd=" + lastUpd +
                ", lastUpdr='" + lastUpdr + '\'' +
                '}';
    }
}
