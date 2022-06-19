package com.portfolio.goods.controller;

import com.portfolio.goods.domain.PageHandler;
import com.portfolio.goods.domain.ResultMessage;
import com.portfolio.goods.domain.SearchCondition;
import com.portfolio.goods.domain.Study;
import com.portfolio.goods.service.StudyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.xml.transform.Result;

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
        model.addAttribute("page", sc.getPage());
        model.addAttribute("pageSize", sc.getPageSize());
        return "/study/studyUpdate";
    }

    @PostMapping("/write")
    public String write(Study study, HttpSession session) {
        System.out.println(study);
        study.setWriter((String) session.getAttribute("userId"));
        studyService.studyRegist(study);
        return "redirect:/study/list";
    }

    @GetMapping("/read")
    public String read(Integer id, SearchCondition sc, Model model) {
        Study studyDetail = studyService.studyDetail(id);
        model.addAttribute("page", sc.getPage());
        model.addAttribute("pageSize", sc.getPageSize());
        model.addAttribute("study", studyDetail);
        return "/study/studyDetail";
    }

    @GetMapping("/modify")
    public String modify(Study study,Integer id, SearchCondition sc, Model model) {
        model.addAttribute("page", sc.getPage());
        model.addAttribute("pageSize", sc.getPageSize());
        return "/study/studyUpdate";
    }

    @PostMapping("/modify")
    public @ResponseBody ResultMessage modify(@RequestBody Study study) {
        return new ResultMessage();
    }

    @PostMapping("/remove")
    public @ResponseBody ResultMessage remove(@RequestBody Study study) {
        return new ResultMessage();
    }
}
