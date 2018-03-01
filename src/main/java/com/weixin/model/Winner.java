package com.weixin.model;

import java.io.Serializable;

public class Winner implements Serializable {
    private Integer id;

    private Integer customerId;


    private String rewardCode;

    private String winDate;

    private Integer winHour;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getRewardCode() {
        return rewardCode;
    }

    public void setRewardCode(String rewardCode) {
        this.rewardCode = rewardCode == null ? null : rewardCode.trim();
    }

    public String getWinDate() {
        return winDate;
    }

    public void setWinDate(String winDate) {
        this.winDate = winDate;
    }

    public Integer getWinHour() {
        return winHour;
    }

    public void setWinHour(Integer winHour) {
        this.winHour = winHour;
    }
}