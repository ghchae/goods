package com.portfolio.goods.controller;

import com.portfolio.goods.domain.SearchCondition;
import com.portfolio.goods.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
    @Autowired
    NoticeService noticeService;

    @GetMapping("/")
    public String main(Model model) {
        SearchCondition sc = new SearchCondition();
        sc.setPageSize(5);
        model.addAttribute("noticeList", noticeService.noticeList(sc));
        return "index";
    }
}
