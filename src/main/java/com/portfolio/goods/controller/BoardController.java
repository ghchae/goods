package com.portfolio.goods.controller;

import com.portfolio.goods.domain.PageHandler;
import com.portfolio.goods.domain.SearchCondition;
import com.portfolio.goods.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BoardController {
    @Autowired
    private NoticeService noticeService;

    @GetMapping("/notice/list")
    public String list(SearchCondition searchCondition, Model model) {
        int totalCnt = noticeService.noticeListCount();
        model.addAttribute("pageHandler", new PageHandler(totalCnt, searchCondition));
        model.addAttribute("list", noticeService.noticeList(searchCondition));
        return "notice/noticeList";
    }

    @PostMapping("/notice/write")
    public String write() {
        return "";
    }

    @GetMapping("/notice/read")
    public String read() {
        return "";
    }
}
