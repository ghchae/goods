package com.portfolio.goods.service;

import com.portfolio.goods.dao.StudyDao;
import com.portfolio.goods.domain.SearchCondition;
import com.portfolio.goods.domain.Study;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudyServiceImpl implements StudyService {
    @Autowired
    StudyDao studyDao;

    @Override
    public int studyListCount() {
        return studyDao.count();
    }

    @Override
    public List<Study> studyList(SearchCondition searchCondition) {
        return studyDao.select(searchCondition);
    }

    @Override
    public int studyRegist(Study study) {
        return studyDao.insert(study);
    }

    @Override
    public Study studyDetail(Integer id) {
        return studyDao.selectOne(id);
    }
}
