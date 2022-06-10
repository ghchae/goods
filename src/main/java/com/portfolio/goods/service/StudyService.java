package com.portfolio.goods.service;


import com.portfolio.goods.domain.SearchCondition;
import com.portfolio.goods.domain.Study;

import java.util.List;

public interface StudyService {
    int studyListCount();

    List<Study> studyList(SearchCondition searchCondition);

    int studyRegist(Study study);

    Study studyDetail(Integer id);
}
