package com.portfolio.goods.dao;

import com.portfolio.goods.domain.SearchCondition;
import com.portfolio.goods.domain.Study;

import java.util.List;

public interface StudyDao {
    List<Study> select(SearchCondition sc);

    int count();
}
