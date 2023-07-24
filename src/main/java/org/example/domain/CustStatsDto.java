package org.example.domain;

import java.util.Objects;

public class CustStatsDto {
    private String time;
    private int cnt;

    public CustStatsDto() {
    }

    public CustStatsDto(String time, int cnt) {
        this.time = time;
        this.cnt = cnt;
    }

    @Override
    public String toString() {
        return "CustStatsDto{" +
                "time='" + time + '\'' +
                ", cnt=" + cnt +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CustStatsDto that = (CustStatsDto) o;
        return cnt == that.cnt && Objects.equals(time, that.time);
    }

    @Override
    public int hashCode() {
        return Objects.hash(time, cnt);
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt = cnt;
    }
}
