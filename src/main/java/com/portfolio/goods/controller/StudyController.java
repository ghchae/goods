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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.transform.Result;
import java.io.IOException;

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
    public @ResponseBody ResultMessage write(@RequestBody Study study, HttpSession session) {
        study.setWriter((String) session.getAttribute("userId"));
        ResultMessage result = new ResultMessage(studyService.studyRegist(study));
        return result;
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
    public String modify(Integer id, SearchCondition sc, Model model) {
        model.addAttribute("page", sc.getPage());
        model.addAttribute("pageSize", sc.getPageSize());
        model.addAttribute("study", studyService.studyDetail(id));
        return "/study/studyUpdate";
    }


    @PostMapping("/modify")
    public @ResponseBody ResultMessage modify(@RequestBody Study study) {
        return studyService.studyModify(study);
    }

    @PostMapping("/remove")
    public @ResponseBody ResultMessage remove(@RequestBody Study study) {
        return studyService.studyRemove(study.getId());
    }

    @PostMapping("/fileUpload")
    public @ResponseBody ResultMessage fileUpload(MultipartHttpServletRequest multiRequest) throws IOException {
        return studyService.studyFileUpload(multiRequest);
    }
}
