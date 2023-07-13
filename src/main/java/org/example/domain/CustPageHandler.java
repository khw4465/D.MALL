package org.example.domain;

public class CustPageHandler {

    private custAdminCondition cac;

    private int totalcnt; //총 게시물 갯수
    private int naviSize=10; //페이지 네비게이션의 크기
    private  int totalPage; //전체 페이지의 갯수
    private int beginPage; //네비게이션의 첫번째 페이지
    private int endPage; // 네비게이션의 마지막 페이지
    private  boolean showPrev; //이전페이지로 이동하는 링크를 보여줄 것인지 여부
    private  boolean showNext; //다음 페이지로 이동하는 링크를 보여줄 것인지 여부

    public CustPageHandler(int totalcnt, custAdminCondition cac){
        this.totalcnt = totalcnt;
        this.cac = cac;

        doPaging(totalcnt,cac);
    }
    public void doPaging(int totalcnt,custAdminCondition cac){
        this.totalcnt= totalcnt;
        totalPage = (int)Math.ceil(totalcnt/ (double)cac.getPageSize());
        beginPage = (cac.getPage()-1) / naviSize * naviSize +1;
        endPage = Math.min(beginPage+naviSize-1,totalPage);
        showPrev = beginPage!=1;
        showNext = endPage != totalPage;
    }

    void print(){
        System.out.println("page = " + cac.getPage());
        System.out.print(showPrev ? "[PREV] " : "");
        for (int i = beginPage; i <=endPage ; i++) {
            System.out.print(i+" ");
            //System.out.print(i+"-");
        }
        System.out.print(showNext ? " [NEXT] " : "");
    }

    @Override
    public String toString() {
        return "CustPageHandler{" +
                "cac=" + cac +
                ", totalcnt=" + totalcnt +
                ", naviSize=" + naviSize +
                ", totalPage=" + totalPage +
                ", beginPage=" + beginPage +
                ", endPage=" + endPage +
                ", showPrev=" + showPrev +
                ", showNext=" + showNext +
                '}';
    }

    public custAdminCondition getCac() {
        return cac;
    }

    public void setCac(custAdminCondition cac) {
        this.cac = cac;
    }

    public int getTotalcnt() {
        return totalcnt;
    }

    public void setTotalcnt(int totalcnt) {
        this.totalcnt = totalcnt;
    }

    public int getNaviSize() {
        return naviSize;
    }

    public void setNaviSize(int naviSize) {
        this.naviSize = naviSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getBeginPage() {
        return beginPage;
    }

    public void setBeginPage(int beginPage) {
        this.beginPage = beginPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isShowPrev() {
        return showPrev;
    }

    public void setShowPrev(boolean showPrev) {
        this.showPrev = showPrev;
    }

    public boolean isShowNext() {
        return showNext;
    }

    public void setShowNext(boolean showNext) {
        this.showNext = showNext;
    }
}
