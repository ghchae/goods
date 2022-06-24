package com.portfolio.goods.domain;

import java.util.Date;
import java.util.List;

public class Study {
    private Integer id;
    private String category;
    private String title;
    private String content;
    private String writer;
    private int view_cnt;
    private Date reg_date;
    private Date up_date;
    private List<AttachFile> fileList;

    private AttachFile file;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public int getView_cnt() {
        return view_cnt;
    }

    public void setView_cnt(int view_cnt) {
        this.view_cnt = view_cnt;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    public Date getUp_date() {
        return up_date;
    }

    public void setUp_date(Date up_date) {
        this.up_date = up_date;
    }

    public List<AttachFile> getFileList() {
        return fileList;
    }

    public void setFileList(List<AttachFile> fileList) {
        this.fileList = fileList;
    }

    public AttachFile getFile() {
        return file;
    }

    public void setFile(AttachFile file) {
        this.file = file;
    }

    @Override
    public String toString() {
        return "Study{" +
                "id=" + id +
                ", category='" + category + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", writer='" + writer + '\'' +
                ", view_cnt=" + view_cnt +
                ", reg_date=" + reg_date +
                ", up_date=" + up_date +
                ", fileList=" + fileList +
                ", file=" + file +
                '}';
    }
}
