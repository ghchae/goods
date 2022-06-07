package com.portfolio.goods.service;

import com.portfolio.goods.dao.NoticeDao;
import com.portfolio.goods.domain.Board;
import com.portfolio.goods.domain.ResultMessage;
import com.portfolio.goods.domain.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    private NoticeDao noticeDao;

    @Override
    public List<Board> noticeList(SearchCondition sc) {
        return noticeDao.selectByCondition(sc);
    }

    @Override
    public int noticeListCount() {
        return noticeDao.count();
    }

    @Override
    public int noticeRegist(Board notice) {
        noticeDao.insert(notice);
        return notice.getBno();
    }

    @Override
    public Board noticeDetail(Integer bno) {
        return noticeDao.selectDetail(bno);
    }

    @Override
    public ResultMessage noticeModify(Board notice) {
        noticeDao.update(notice);
        return new ResultMessage();
    }

    @Override
    public ResultMessage noticeRemove(Integer bno) {
        noticeDao.delete(bno);
        return new ResultMessage();
    }
}