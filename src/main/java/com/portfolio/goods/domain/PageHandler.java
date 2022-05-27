package com.portfolio.goods.domain;

public class PageHandler {
    //    private int pageSize; // 한 페이지 크기, 한 페이지에 들어가는 게시물 갯수
//    private int page; // 현재 페이지
//    private String option;
//    private String keyword;
    private SearchCondition sc;
    private int totalCnt; // 총 게시물 갯수
    private int totalPage; // 전체 페이지 갯수 , 올림(총 게시물 / 페이지크기)
    private int naviSize = 10; // 페이지 네비게이션 크기
    private int beginPage; // 네비게이션에 보여질 첫번째 페이지
    private int endPage; //네비게이션에 보여질 마지막 페이지
    private boolean showPrev; // 이전 페이지로 이동하는 링크를 보여줄것인지의 여부 , 1페이지에선 false 여야함.
    private boolean showNext; // 다음페이지로 이동하는 링크를 보여줄것인지의 여부, 마지막페이지에선 false 여야함

    public PageHandler(int totalCnt, SearchCondition sc) {
        this.totalCnt = totalCnt;
        this.sc = sc;

        doPaging(totalCnt, sc);
    }

    public void doPaging(int totalCnt, SearchCondition sc) {
        this.totalCnt = totalCnt;

        totalPage = (int) Math.ceil(totalCnt / (double) sc.getPageSize());
        /*beginPage = (page-1) / naviSize * navisize + 1*/
        beginPage = sc.getPage() % naviSize == 0 ? (((sc.getPage() / naviSize) - 1) * naviSize) + 1 : ((sc.getPage() / naviSize) * naviSize) + 1;
        /*endPage = (beginPage + naviSize) < totalPage ? (beginPage+ naviSize) : totalPage;*/
        endPage = Math.min((beginPage + naviSize) - 1, totalPage); // 둘중에 작은값이 리턴된다.
        showPrev = (beginPage != 1);
        showNext = (endPage != totalPage);
    }

    void print() {
        System.out.print("showPrev = " + (showPrev ? "[PREV] " : ""));
        for (int i = beginPage; i <= endPage; i++) {
            System.out.print(i + " ");
        }
        System.out.println(showNext ? "[NEXT] " : "");
    }

    public SearchCondition getSc() {
        return sc;
    }

    public void setSc(SearchCondition sc) {
        this.sc = sc;
    }

    public int getTotalCnt() {
        return totalCnt;
    }

    public void setTotalCnt(int totalCnt) {
        this.totalCnt = totalCnt;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getNaviSize() {
        return naviSize;
    }

    public void setNaviSize(int naviSize) {
        this.naviSize = naviSize;
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

    @Override
    public String toString() {
        return "PageHandler{" +
                "sc=" + sc +
                ", totalCnt=" + totalCnt +
                ", totalPage=" + totalPage +
                ", naviSize=" + naviSize +
                ", beginPage=" + beginPage +
                ", endPage=" + endPage +
                ", showPrev=" + showPrev +
                ", showNext=" + showNext +
                '}';
    }
}
