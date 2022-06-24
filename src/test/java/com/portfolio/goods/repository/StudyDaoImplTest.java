package com.portfolio.goods.repository;

import com.portfolio.goods.dao.StudyDao;
import com.portfolio.goods.domain.SearchCondition;
import com.portfolio.goods.domain.Study;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})//xml 설정파일 위치를 지정
public class StudyDaoImplTest {
    @Autowired
    StudyDao studyDao;

    @Test
    public void select() {
        SearchCondition sc = new SearchCondition(1,10,"","");
        System.out.println(sc);
        List<Study> studyList = studyDao.select(sc);
        System.out.println(studyList);
    }

    @Test
    public void selectOne() {
        System.out.println(studyDao.selectOne(18));;
    }

}