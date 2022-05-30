package com.portfolio.goods.service;

import com.portfolio.goods.domain.Board;
import com.portfolio.goods.domain.SearchCondition;

import java.util.List;

public interface NoticeService {
    List<Board> noticeList(SearchCondition cs);

    int noticeListCount();

    Board noticeDetail(Integer bno);

    int noticeRegist(Board notice);
}
