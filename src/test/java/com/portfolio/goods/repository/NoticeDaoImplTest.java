package com.portfolio.goods.repository;

import com.portfolio.goods.dao.NoticeDao;
import com.portfolio.goods.domain.Board;
import com.portfolio.goods.domain.SearchCondition;
import com.portfolio.goods.domain.User;
import com.portfolio.goods.service.NoticeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


import static org.junit.Assert.*;/* 직접 적어줘야한다.*/

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})//xml 설정파일 위치를 지정
public class NoticeDaoImplTest {

    @Autowired
    NoticeDao noticeDao;

    @Test
    public void selectAll() {
        SearchCondition sc = new SearchCondition(1,10,"","");
        System.out.println(sc);
        List<Board> list = noticeDao.selectByCondition(sc);

        if (list != null) {
            for (Board board : list) {
                System.out.println(board);
            }
        } else {
          assertTrue(list == null);
        }
    }
    @Test
    public void count() {
    }

    @Test
    public void insert() {
        for (int i = 1; i < 22; i++) {
            Board notice = new Board("testTitle" + i, "good content" + i, "tester");
            noticeDao.insert(notice);
        }
    }

    @Test
    public void delete() {
        noticeDao.deleteAll();
        SearchCondition sc = new SearchCondition(1,10,"","");
        System.out.println(sc);
        List<Board> list = noticeDao.selectByCondition(sc);

        if (list != null) {
            for (Board board : list) {
                System.out.println(board);
            }
        } else {
            assertTrue(list == null);
        }
    }

}