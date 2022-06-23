package com.portfolio.goods.domain;

public class AttachFile {
    private String id;
    private String originName;
    private String fileName;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOriginName() {
        return originName;
    }

    public void setOriginName(String originName) {
        this.originName = originName;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    @Override
    public String toString() {
        return "AttachFile{" +
                "id='" + id + '\'' +
                ", originName='" + originName + '\'' +
                ", fileName='" + fileName + '\'' +
                '}';
    }
}
