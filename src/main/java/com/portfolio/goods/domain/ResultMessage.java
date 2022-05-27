package com.portfolio.goods.domain;

public class ResultMessage {
    private boolean result = true;
    private String message;

    public ResultMessage() {
    }

    public ResultMessage(boolean result, String message) {
        this.result = result;
        this.message = message;
    }

    public ResultMessage(String message) {
        this.message = message;
    }

    public ResultMessage(int message) {
        this.message = String.valueOf(message);
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
}
