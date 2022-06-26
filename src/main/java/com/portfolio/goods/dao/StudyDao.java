package com.portfolio.goods.dao;

import com.portfolio.goods.domain.AttachFile;
import com.portfolio.goods.domain.ResultMessage;
import com.portfolio.goods.domain.SearchCondition;
import com.portfolio.goods.domain.Study;

import java.util.List;

public interface StudyDao {
    List<Study> select(SearchCondition sc);

    int count();

    int insert(Study study);

    Study selectOne(Integer id);

    void fileInsert(AttachFile attachFile);

    void delete(Integer id);

    int selectFile(Integer id);

    void deleteFile(Integer id);

    Study selectByCategory(String category);
}
