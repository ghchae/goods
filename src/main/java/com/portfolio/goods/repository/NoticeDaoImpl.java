package com.portfolio.goods.repository;

import com.portfolio.goods.dao.NoticeDao;
import com.portfolio.goods.domain.Board;
import com.portfolio.goods.domain.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NoticeDaoImpl implements NoticeDao {
    @Autowired
    private SqlSession sqlSession;
    private String namespace = "com.portfolio.goods.dao.NoticeMapper.";


    @Override
    public List<Board> selectByCondition(SearchCondition sc) {
        return sqlSession.selectList(namespace + "selectByCondition", sc);
    }

    @Override
    public int count() {
        return sqlSession.selectOne(namespace + "count");
    }

}
