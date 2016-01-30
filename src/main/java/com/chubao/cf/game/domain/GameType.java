package com.chubao.cf.game.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/22 下午7:12
 * 任务号:
 * 创建说明: 游戏类型
 */
public class GameType {
    /**
     * 游戏类型id
     */
    private Integer typeId;
    /**
     * 游戏名称
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

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
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
