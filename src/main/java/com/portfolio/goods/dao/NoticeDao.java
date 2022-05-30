package com.portfolio.goods.dao;

import com.portfolio.goods.domain.Board;
import com.portfolio.goods.domain.SearchCondition;

import java.util.List;

public interface NoticeDao {
    List<Board> selectByCondition(SearchCondition cs);
    int count();

    Board selectDetail(Integer bno);

    int insert(Board notice);

    int deleteAll();
}
