package com.portfolio.goods.repository;

import com.portfolio.goods.dao.StudyDao;
import com.portfolio.goods.domain.SearchCondition;
import com.portfolio.goods.domain.Study;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StudyDaoImpl implements StudyDao {

    @Autowired
    private SqlSession sqlSession;
    private String namespace = "com.portfolio.goods.dao.StudyMapper.";

    @Override
    public List<Study> select(SearchCondition sc) {
        return sqlSession.selectList(namespace + "select" , sc);
    }

    @Override
    public int count() {
        return sqlSession.selectOne(namespace + "count");
    }
}
