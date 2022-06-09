package com.portfolio.goods.controller;

import com.portfolio.goods.domain.PageHandler;
import com.portfolio.goods.domain.SearchCondition;
import com.portfolio.goods.service.StudyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/study")
public class StudyController {

    @Autowired
    StudyService studyService;

    @GetMapping("/list")
    public String list(SearchCondition sc, Model model) {
        int totalCnt = studyService.studyListCount();
        model.addAttribute("pageHandler", new PageHandler(totalCnt, sc));
        model.addAttribute("list", studyService.studyList(sc));
        return "/study/studyList";
    }

    @GetMapping("/write")
    public String write(Integer id, SearchCondition sc, Model model) {
        System.out.println("write sc : " + sc);

        return "/study/studyUpdate";
    }

    @GetMapping("/read")
    public String read() {
        return "";
    }
}
