package com.portfolio.goods.repository;

import com.portfolio.goods.dao.StudyDao;
import com.portfolio.goods.domain.AttachFile;
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
        return sqlSession.selectList(namespace + "select", sc);
    }

    @Override
    public int count() {
        return sqlSession.selectOne(namespace + "count");
    }

    @Override
    public int insert(Study study) {
        return sqlSession.insert(namespace + "insert", study);
    }

    @Override
    public Study selectOne(Integer id) {
        return sqlSession.selectOne(namespace + "selectOne", id);
    }

    @Override
    public void fileInsert(AttachFile attachFile) {
        sqlSession.insert(namespace + "fileInsert", attachFile);
    }

    @Override
    public void delete(Integer id) {
        sqlSession.delete(namespace + "delete", id);
    }

    @Override
    public int selectFile(Integer id) {
        return sqlSession.selectOne(namespace + "selectFile", id);
    }

    @Override
    public void deleteFile(Integer id) {
        sqlSession.delete(namespace + "deleteFile", id);
    }

    @Override
    public Study selectByCategory(String category) {
        return sqlSession.selectOne(namespace + "selectByCategory", category);
    }

    @Override
    public void updateCount(Integer id) {
        sqlSession.update(namespace + "updateCount", id);
    }

    @Override
    public void modify(Study study) {
        sqlSession.update(namespace + "modify", study);
    }
}
