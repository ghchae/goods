package com.portfolio.goods.service;

import com.portfolio.goods.dao.StudyDao;
import com.portfolio.goods.domain.ResultMessage;
import com.portfolio.goods.domain.SearchCondition;
import com.portfolio.goods.domain.Study;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.xml.transform.Result;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class StudyServiceImpl implements StudyService {
    @Autowired
    StudyDao studyDao;

    @Override
    public int studyListCount() {
        return studyDao.count();
    }

    @Override
    public List<Study> studyList(SearchCondition searchCondition) {
        return studyDao.select(searchCondition);
    }

    @Override
    public int studyRegist(Study study) {
        return studyDao.insert(study);
    }

    @Override
    public Study studyDetail(Integer id) {
        return studyDao.selectOne(id);
    }

    @Override
    public ResultMessage studyFileUpload(MultipartHttpServletRequest multiRequest) throws IOException {
        String path = "/temp";
        ServletContext context = multiRequest.getSession().getServletContext();
        String realpath = context.getRealPath(path);
        System.out.println("context : " + context + "realPath : " + realpath);

        MultipartFile multipartFile = multiRequest.getFile("file");
        if ((multipartFile == null) || multipartFile.isEmpty()) {
            return new ResultMessage(false, "fileIsEmpty");
        }
        String originalFileName = multipartFile.getOriginalFilename().replace("\r", "").replace("\n", "");
        String ext = originalFileName.substring(originalFileName.lastIndexOf('.') + 1);
        String fileName = "STUDYFILE_" + System.currentTimeMillis() + "." + ext;
        File file = new File(realpath + "/studyFile/" + fileName);
        multipartFile.transferTo(file);
        System.out.println("origin:" + originalFileName + " , ext : " + ext + ", fileName : " + fileName);
        return new ResultMessage(true, fileName);
    }
}
