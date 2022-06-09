package com.portfolio.goods.domain;

public class AttachFile {
    private Integer id;
    private String originName;
    private String pathName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOriginName() {
        return originName;
    }

    public void setOriginName(String originName) {
        this.originName = originName;
    }

    public String getPathName() {
        return pathName;
    }

    public void setPathName(String pathName) {
        this.pathName = pathName;
    }

    @Override
    public String toString() {
        return "AttachFile{" +
                "id=" + id +
                ", originName='" + originName + '\'' +
                ", pathName='" + pathName + '\'' +
                '}';
    }
}
