package com.portfolio.goods.service;

import com.portfolio.goods.dao.StudyDao;
import com.portfolio.goods.domain.AttachFile;
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
        studyDao.insert(study);
        System.out.println("등록후 study Id : " + study.getId());
        return study.getId();
    }

    @Override
    public Study studyDetail(Integer id) {
        return studyDao.selectOne(id);
    }

    @Override
    public ResultMessage studyFileUpload(MultipartHttpServletRequest multiRequest) throws IOException {
        /*
            String path = "/temp";
            ServletContext context = multiRequest.getSession().getServletContext();
            String realpath = context.getRealPath(path);// C:\apache-tomcat-9.0.54\webapps\goods\
            System.out.println("fileSeporator : " + File.separator);
         */
        String filePath = "C:/upload";

        MultipartFile multipartFile = multiRequest.getFile("file");
        if ((multipartFile == null) || multipartFile.isEmpty()) {
            return new ResultMessage(false, "fileIsEmpty");
        }
        String originalFileName = multipartFile.getOriginalFilename().replace("\r", "").replace("\n", "");
        String ext = originalFileName.substring(originalFileName.lastIndexOf('.') + 1);
        String fileName = "STUDYFILE_" + System.currentTimeMillis() + "." + ext;
        File file = new File(filePath + "/studyFile/" + fileName);
        multipartFile.transferTo(file);
        System.out.println("origin:" + originalFileName + " , ext : " + ext + ", fileName : " + fileName);
        AttachFile attachFile = new AttachFile();
        attachFile.setId(multiRequest.getParameter("id"));
        attachFile.setFileName("studyFile/" + fileName);
        attachFile.setOriginName(originalFileName);
        studyDao.fileInsert(attachFile);
        return new ResultMessage(true, fileName);
    }

    @Override
    public ResultMessage studyRemove(Integer id) {
        // 파일있으면, 파일지워야한다.
        int result = studyDao.selectFile(id);
        if(result > 0 ) {
            studyDao.deleteFile(id);
        }
        studyDao.delete(id);
        return new ResultMessage();
    }

    @Override
    public Study studyListByCategory(String category) {
        return studyDao.selectByCategory(category);
    }
}
