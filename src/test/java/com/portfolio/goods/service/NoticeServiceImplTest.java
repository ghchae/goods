package com.portfolio.goods.service;

import com.portfolio.goods.domain.Board;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})//xml 설정파일 위치를 지정
public class NoticeServiceImplTest {

    @Autowired
    private NoticeService noticeService;

    @Test
    public void noticeRegist() {
        Board notice = new Board("testTitle3", "good content3", "tester");
        System.out.println(noticeService.noticeRegist(notice));
    }

    @Test
    public void noticeDetail() {
    }
}