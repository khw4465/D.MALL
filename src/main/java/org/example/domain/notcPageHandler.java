package org.example.domain;

public class notcPageHandler {

    //    private int page; // 현재 페이지
//    private int pageSize; // 한 페이지의 크기
//    private String option; // selectBox에서 선택한 제목 + 내용 / 제목인지 선택하는 옵션 그치만 나는 제목검색만 구현
//    private String keyword; // 검색창에 검색한 단어 또는 글자
    public notcSearchCondition sc;
    private int pageSize;


    private int totalCnt; // 총 게시물 개수
    private int naviSize = 10; // 페이지 내비게이션의 크기
    private int totalPage; // 전체 페이지의 크기
    private int beginPage; // 내비게이션의 첫번째 페이지
    private int endPage; // 내비게이션의 마지막 페이지
    private boolean showPrev; // 이전 페이지로 이동하는 링크를 보여줄 것인지의 여부
    private boolean showNext; // 다음 페이지로 이동하는 링크를 보여줄 것인지의 여부

    public notcPageHandler(int totalCnt, notcSearchCondition sc,int pageSize){
        this.totalCnt = totalCnt;
        this.sc = sc;
        this.pageSize = pageSize;

        doPaging(totalCnt,sc);
    }

    public void doPaging(int totalCnt, notcSearchCondition sc) {
        this.totalCnt = totalCnt;
        this.sc = sc;


        totalPage = (int)Math.ceil(totalCnt / (double)sc.getPageSize());
        beginPage = (sc.getPage()-1) / naviSize * naviSize +1;
        endPage = Math.min(beginPage + naviSize-1, totalPage);
        showPrev = beginPage !=1;
        showNext = endPage !=totalPage;
    }

    public notcSearchCondition getSc() {
        return sc;
    }

    public void setSc(notcSearchCondition sc) {
        this.sc = sc;
    }

    public int getTotalCnt() {
        return totalCnt;
    }

    public void setTotalCnt(int totalCnt) {
        this.totalCnt = totalCnt;
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

    public int getPageSize(){
        return pageSize;
    }

    public void setPageSize(int pageSize){
        this.pageSize = pageSize;
    }

    void print(){
        System.out.println("page = " + sc.getPage());
        System.out.print(showPrev ? "[PREV] " : "");
        for (int i = beginPage; i <= endPage; i++) {
            System.out.print(i+"  ");
        }
        System.out.println(showNext ? "  [NEXT]" : "");
    }

    @Override
    public String toString() {
        return "notcPageHandler{" +
                "sc=" + sc +
                ", totalCnt=" + totalCnt +
                ", naviSize=" + naviSize +
                ", totalPage=" + totalPage +
                ", beginPage=" + beginPage +
                ", endPage=" + endPage +
                ", showPrev=" + showPrev +
                ", showNext=" + showNext +
                '}';
    }

}
