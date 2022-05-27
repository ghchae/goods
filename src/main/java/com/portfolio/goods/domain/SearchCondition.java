package com.portfolio.goods.domain;

import org.springframework.web.util.UriComponentsBuilder;

/* 검색 조건 */
public class SearchCondition {
    public static final int MIN_PAGE_SIZE = 5;
    public static final int DEFAULT_PAGE_SIZE = 10;
    public static final int MAX_PAGE_SIZE = 50;

    private Integer page = 1; /* 컨트롤러에서 값을 받지못할때, 디폴트값이 1로 들어감 */
    private Integer pageSize = DEFAULT_PAGE_SIZE;
    private String option = ""; /* 제목, 내용 을 검색할건지, 제목만 검색할것인지의 옵션*/
    private String keyword = "";
    // private Integer offset = 0;
    /* offset값은 현재 0 인데, offset은 page, pagesize로 계산되는 값이다. */
    /* 그래서 굳이 iv로 저장할 필요없다. -> 따라서 offset값을 읽을때 page,pageSize필드를 이용해 계산해줘야한다. */

    public SearchCondition() {
    }

    public SearchCondition(Integer page, Integer pageSize, String option, String keyword) {
        this.page = page;
        this.pageSize = pageSize;
        this.option = option;
        this.keyword = keyword;
    }

    /* 컨트롤러가 매개변수로 Sc를 받는데, 검색결과내용을 받다가 목록으로 돌아갈때 이 값들을 유지해야함 */
    /* 그값들을 쿼리스트링으로 만드는 메서드 생성 */
    /* ex) ?page=1&pageSize=10&option="TITLE"&keyword="title" */
    public String getQueryString() {
        return getQueryString(page);
    }

    public String getQueryString(Integer page) {
        return UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("pageSize", pageSize)
                .queryParam("option", option)
                .queryParam("keyword", keyword)
                .build().toString();
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public Integer getOffset() {
        return (page - 1) * pageSize;
    }

    @Override
    public String toString() {
        return "SearchCondition{" +
                "page=" + page +
                ", pageSize=" + pageSize +
                ", option='" + option + '\'' +
                ", keyword='" + keyword + '\'' +
                ", offset=" + getOffset() +
                '}';
    }
}
