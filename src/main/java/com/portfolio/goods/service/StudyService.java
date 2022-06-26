package com.portfolio.goods.service;


import com.portfolio.goods.domain.ResultMessage;
import com.portfolio.goods.domain.SearchCondition;
import com.portfolio.goods.domain.Study;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

public interface StudyService {
    int studyListCount();

    List<Study> studyList(SearchCondition searchCondition);

    int studyRegist(Study study);

    Study studyDetail(Integer id);

    ResultMessage studyFileUpload(MultipartHttpServletRequest multiRequest) throws IOException;

    ResultMessage studyRemove(Integer id);

    Study studyListByCategory(String category);
}
