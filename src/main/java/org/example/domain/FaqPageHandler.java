package org.example.domain;

public class FaqPageHandler {

    private int page; // 현재 페이지
    private int pageSize; // 한 페이지의 크기
    private int totalcnt; // 총 게시물 개수
    private int naviSize = 10; // 페이지 내비게이션의 크기
    private int totalPage; // 전체 페이지의 크기
    private int beginPage; // 내비게이션의 첫번째 페이지
    private int endPage; // 내비게이션의 마지막 페이지
    private boolean showPrev; // 이전 페이지로 이동하는 링크를 보여줄 것인지의 여부

    private boolean showNext; // 다음 페이지로 이동하는 링크를 보여줄 것인지의 여부

    public FaqPageHandler(int totalcnt, int page){
        this(totalcnt, page,10);
    }

    public FaqPageHandler(int totalcnt, int page, int pageSize){
        this.totalcnt = totalcnt;
        this.page = page;
        this.pageSize = pageSize;

        totalPage = (int)Math.ceil(totalcnt / (double)pageSize);
        beginPage = (page-1) / naviSize * naviSize +1;
        endPage = Math.min(beginPage + naviSize-1, totalPage);
        showPrev = beginPage !=1;
        showNext = endPage !=totalPage;
    }

    public int getTotalcnt() {
        return totalcnt;
    }

    public void setTotalcnt(int totalcnt) {
        this.totalcnt = totalcnt;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
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

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    void print(){
        System.out.println("page = " + page);
        System.out.print(showPrev ? "[PREV] "  : "");
        for(int i = beginPage; i <= endPage; i++){
            System.out.print("[" + i + "] ");
        }

        System.out.print(showNext ? "[NEXT]" : "");
    }

    @Override
    public String toString() {
        return "faqPageHandler{" +
                "page=" + page +
                ", pageSize=" + pageSize +
                ", totalcnt=" + totalcnt +
                ", naviSize=" + naviSize +
                ", totalPage=" + totalPage +
                ", beginPage=" + beginPage +
                ", endPage=" + endPage +
                ", showPrev=" + showPrev +
                ", showNext=" + showNext +
                '}';
    }
}