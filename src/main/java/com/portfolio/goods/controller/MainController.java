package com.portfolio.goods.controller;

import com.portfolio.goods.domain.SearchCondition;
import com.portfolio.goods.service.NoticeService;
import com.portfolio.goods.service.StudyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
    @Autowired
    NoticeService noticeService;

    @Autowired
    StudyService studyService;

    @GetMapping("/")
    public String main(Model model) {
        SearchCondition sc = new SearchCondition();
        sc.setPageSize(5);
        model.addAttribute("noticeList", noticeService.noticeList(sc));
        model.addAttribute("JAVA", studyService.studyListByCategory("JAVA"));
        model.addAttribute("JS", studyService.studyListByCategory("JS"));
        model.addAttribute("SPRING", studyService.studyListByCategory("SPRING"));
        model.addAttribute("WEB", studyService.studyListByCategory("WEB"));
        model.addAttribute("DB", studyService.studyListByCategory("DB"));
        return "index";
    }

    @GetMapping("/introduce")
    public String introduce() {
        return "introduce";
    }
}
