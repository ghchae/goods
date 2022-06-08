package com.portfolio.goods.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/study")
public class StudyController {
    @GetMapping("/list")
    public String list() {
        return "/study/studyList";
    }
}
