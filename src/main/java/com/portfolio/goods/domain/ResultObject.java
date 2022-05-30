package com.portfolio.goods.domain;

import javax.xml.transform.Result;

public class ResultObject<T> {
    private boolean result = true;
    private String message;
    private T object;
    public ResultObject() {
        super();
    }

    public ResultObject(ResultMessage resultMessage) {
        this.result = resultMessage.isResult();
        this.message = resultMessage.getMessage();
    }

    public ResultObject(boolean result, String message) {
        this.result = result;
        this.message = message;
    }

    public ResultObject(boolean result, T object) {
        this.result = result;
        this.object = object;
    }

    public ResultObject(boolean result, String message, T object) {
        this.result = result;
        this.message = message;
        this.object = object;
    }

    public ResultObject(T object) {
        super();
        this.object = object;
    }

    public boolean isResult() {
        return result;
    }

    public void setResult(boolean result) {
        this.result = result;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getObject() {
        return object;
    }

    public void setObject(T object) {
        this.object = object;
    }

    @Override
    public String toString() {
        return "ResultObject{" +
                "result=" + result +
                ", message='" + message + '\'' +
                ", object=" + object +
                '}';
    }
}
