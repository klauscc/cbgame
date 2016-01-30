package com.chubao.cf.game.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/22 下午7:52
 * 任务号:
 * 创建说明: 开发者bean
 */
public class GameDeveloper {
    /**
     * 开发者id
     */
    private Integer developerId;
    /**
     * 开发者名称
     */
    private String name = "";
    /**
     * 添加时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss" ,timezone = "GMT+8")
    private Date timeAdded;
    /**
     * 最近编辑时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss" ,timezone = "GMT+8")
    private Date timeEdit;
    /**
     * 是否删除
     */
    private Boolean isDelete;

    public Integer getDeveloperId() {
        return developerId;
    }

    public void setDeveloperId(Integer developerId) {
        this.developerId = developerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getTimeAdded() {
        return timeAdded;
    }

    public void setTimeAdded(Date timeAdded) {
        this.timeAdded = timeAdded;
    }

    public Date getTimeEdit() {
        return timeEdit;
    }

    public void setTimeEdit(Date timeEdit) {
        this.timeEdit = timeEdit;
    }

    public Boolean getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Boolean isDelete) {
        this.isDelete = isDelete;
    }
}
