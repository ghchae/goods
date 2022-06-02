package com.portfolio.goods.controller;

import com.portfolio.goods.domain.Board;
import com.portfolio.goods.domain.PageHandler;
import com.portfolio.goods.domain.SearchCondition;
import com.portfolio.goods.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class BoardController {
    @Autowired
    private NoticeService noticeService;

    @GetMapping("/notice/list")
    public String list(SearchCondition searchCondition, Model model) {
        System.out.println("sc :" + searchCondition);
        int totalCnt = noticeService.noticeListCount();
        model.addAttribute("pageHandler", new PageHandler(totalCnt, searchCondition));
        model.addAttribute("list", noticeService.noticeList(searchCondition));
        return "notice/noticeList";
    }

    @GetMapping("/notice/write")
    public String write(Integer bno, Integer page, Integer pageSize, Model model) {
        System.out.println("bno = " + bno);
        Board noticeDetail = noticeService.noticeDetail(bno);
        model.addAttribute("page", page);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("notice", noticeDetail);
        return "notice/noticeUpdate";
    }

    @PostMapping("/notice/write")
    public String write(Board notice, HttpSession session) {
//        System.out.println(session.getId());/* Jsession ID*/
        notice.setWriter((String)session.getAttribute("userId"));
        int bno = noticeService.noticeRegist(notice);
        return "redirect:/notice/read?bno=" + bno;
    }

    @GetMapping("/notice/read")
    public String read(Integer bno, Integer page, Integer pageSize, Model model) {
        Board noticeDetail = noticeService.noticeDetail(bno);
        model.addAttribute("page", page);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("notice", noticeDetail);
        return "notice/noticeDetail";
    }

    @GetMapping("/notice/modify")
    public String modify(Board notice, Integer page, Integer pageSize, Model model) {

        return "/notice/noticeUpdate?bno=";
    }

    @PostMapping("/notice/delete")
    public String delete() {
        return "/notice/noticeList";
    }
}
