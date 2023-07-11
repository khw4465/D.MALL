package org.example.domain;

import java.util.Objects;

public class CateMainDto {
    private int mainCate;
    private String mainName;

    public CateMainDto() {}

    public CateMainDto(int mainCate, String mainName) {
        this.mainCate = mainCate;
        this.mainName = mainName;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CateMainDto that = (CateMainDto) o;

        if (mainCate != that.mainCate) return false;
        return Objects.equals(mainName, that.mainName);
    }

    @Override
    public int hashCode() {
        int result = mainCate;
        result = 31 * result + (mainName != null ? mainName.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "CateMainDto{" +
                "mainCate=" + mainCate +
                ", mainName='" + mainName + '\'' +
                '}';
    }
}
