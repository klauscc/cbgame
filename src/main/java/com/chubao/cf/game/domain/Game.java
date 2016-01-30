package com.chubao.cf.game.domain;

import com.chubao.cf.game.service.others.HtmlSafety;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/16 下午10:56
 * 任务号:
 * 创建说明: 游戏bean
 */
public class Game {

    /**
     * 游戏Id
     */
    private Integer gameId;
    /**
     * 游戏类型Id
     */
    private Integer typeId;
    /**
     * 开发者Id
     */
    private Integer developerId;
    /**
     * 添加者Id
     */
    private Integer userId;
    /**
     * 游戏名称
     */
    private String name;
    /**
     * 游戏内容
     */
    private String content;
    /**
     * 资费
     */
    private String price;
    /**
     * 发布时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date publishTime;
    /**
     * 大小
     */
    private Double size;
    /**
     * 平台
     */
    private String platform;
    /**
     * 下载次数
     */
    private Integer downloadTimes = 0;
    /**
     * 评论次数
     */
    private Integer rateTimes = 0;
    /**
     * 下载链接
     */
    private String downloadUrl;
    /**
     * 图片链接，多张以"|"分隔
     */
    private String images;
    /**
     * 海报链接
     */
    private String post;
    /**
     * 置顶
     */
    private Integer top = 0;
    /**
     * 添加日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date timeAdded;
    /**
     * 编辑日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date timeEdit;
    /**
     * 是否删除
     */
    private Boolean isDelete;

    public Integer getGameId() {
        return gameId;
    }

    public void setGameId(Integer gameId) {
        this.gameId = gameId;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Integer getDeveloperId() {
        return developerId;
    }

    public void setDeveloperId(Integer developerId) {
        this.developerId = developerId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        if(null == name){
            return;
        } else {
            this.name = HtmlSafety.relaxed(name);
        }
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        if(null == content){
            return;
        } else {
            this.content = HtmlSafety.relaxed(content);
        }
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        if (null == price) {
            return;
        } else {
            this.price = HtmlSafety.relaxed(price);
        }
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public Double getSize() {
        return size;
    }

    public void setSize(Double size) {
        this.size = size;
    }


    public String getPlatform() {
        return platform;
    }

    public void setPlatform(String platform) {
        if (null == platform) {
            return;
        } else {
            this.platform = HtmlSafety.relaxed(platform);
        }
    }

    public Integer getDownloadTimes() {
        return downloadTimes;
    }

    public void setDownloadTimes(Integer downloadTimes) {
        this.downloadTimes = downloadTimes;
    }

    public Integer getRateTimes() {
        return rateTimes;
    }

    public void setRateTimes(Integer rateTimes) {
        this.rateTimes = rateTimes;
    }

    public String getDownloadUrl() {
        return downloadUrl;
    }

    public void setDownloadUrl(String downloadUrl) {
        this.downloadUrl = HtmlSafety.relaxed(downloadUrl);
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        if (null == images) {
            return;
        } else {
            this.images = HtmlSafety.relaxed(images);
        }
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        if (null == post) {
            return;
        } else {
            this.post = HtmlSafety.relaxed(post);
        }
    }

    public Integer getTop() {
        return top;
    }

    public void setTop(Integer top) {
        this.top = top;
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

    /**
     * 将image数组以"|"分隔开
     *
     * @param image 图像地址
     * @return 组装后的图像地址
     */
    public String assembleImages(String[] image) {
        if (null == image) {
            return "";
        }
        String result = image[0];
        for (int i = 1; i < image.length; ++i) {
            result += "|" + image[i];
        }
        return result;
    }

    public String[] getImageArray() {
        return images.split("\\|");
    }
}
