package com.chubao.cf.game.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/17 下午5:42
 * 任务号:
 * 创建说明:
 */
@Component
@ConfigurationProperties(prefix = "constants")
public class Constants {

    /**
     * 非常长列表。一页16个项目
     */
    public static Integer xlongList = 16;
    /**
     * 长列表。一页8个项目
     */
    public static Integer longList = 8;
    /**
     * 短列表。一页4个项目
     */
    public static Integer shortList = 4;

    /**
     * 当前分页每页数量
     */
    public static Integer perPage = 8;

    /***************articleId 保留字段 1~32 *********************/
    /**
     * 关于我们 内容文章id
     */
    public static Integer aboutArticleId = 1;

    /**
     * 联系我们 内容文章id
     */
    public static Integer contactUsArticleId = 2;

    /**
     * 家长监护简介 内容文章id
     */
    public static Integer familySafetyIntroductionArticleId = 3;

    /**
     * 家长监护流程  内容文章id
     */
    public static Integer familySafetyProcessArticleId = 4;

    /**
     * 家长监护常见问题 内容文章id
     */
    public static Integer familySafetyFAQsArticleId = 5;

    /**
     * 家长监护联系我们 内容文章id
     */
    public static Integer familySafetyContactUsArticleId = 6;

    /**
     * 游戏充值属性 内容文章id
     */
    public static Integer gamePaymentArticleId = 7;

    public static String uploadDir = "/upload";

    public static String imagesUploadSecondDir = "/images";

    public static String fileUploadSecondDir = "/files";

    public static Integer getXlongList() {
        return xlongList;
    }

    public static void setXlongList(Integer xlongList) {
        Constants.xlongList = xlongList;
    }

    public static Integer getLongList() {
        return longList;
    }

    public static void setLongList(Integer longList) {
        Constants.longList = longList;
    }

    public static Integer getShortList() {
        return shortList;
    }

    public static void setShortList(Integer shortList) {
        Constants.shortList = shortList;
    }

    public static Integer getPerPage() {
        return perPage;
    }

    public static void setPerPage(Integer perPage) {
        Constants.perPage = perPage;
    }

    public static Integer getAboutArticleId() {
        return aboutArticleId;
    }

    public static void setAboutArticleId(Integer aboutArticleId) {
        Constants.aboutArticleId = aboutArticleId;
    }

    public static Integer getContactUsArticleId() {
        return contactUsArticleId;
    }

    public static void setContactUsArticleId(Integer contactUsArticleId) {
        Constants.contactUsArticleId = contactUsArticleId;
    }

    public static Integer getFamilySafetyIntroductionArticleId() {
        return familySafetyIntroductionArticleId;
    }

    public static void setFamilySafetyIntroductionArticleId(Integer familySafetyIntroductionArticleId) {
        Constants.familySafetyIntroductionArticleId = familySafetyIntroductionArticleId;
    }

    public static Integer getFamilySafetyProcessArticleId() {
        return familySafetyProcessArticleId;
    }

    public static void setFamilySafetyProcessArticleId(Integer familySafetyProcessArticleId) {
        Constants.familySafetyProcessArticleId = familySafetyProcessArticleId;
    }

    public static Integer getFamilySafetyFAQsArticleId() {
        return familySafetyFAQsArticleId;
    }

    public static void setFamilySafetyFAQsArticleId(Integer familySafetyFAQsArticleId) {
        Constants.familySafetyFAQsArticleId = familySafetyFAQsArticleId;
    }

    public static Integer getFamilySafetyContactUsArticleId() {
        return familySafetyContactUsArticleId;
    }

    public static void setFamilySafetyContactUsArticleId(Integer familySafetyContactUsArticleId) {
        Constants.familySafetyContactUsArticleId = familySafetyContactUsArticleId;
    }

    public static Integer getGamePaymentArticleId() {
        return gamePaymentArticleId;
    }

    public static void setGamePaymentArticleId(Integer gamePaymentArticleId) {
        Constants.gamePaymentArticleId = gamePaymentArticleId;
    }

    public static String getUploadDir() {
        return uploadDir;
    }

    public static void setUploadDir(String uploadDir) {
        Constants.uploadDir = uploadDir;
    }

    public static String getImagesUploadSecondDir() {
        return imagesUploadSecondDir;
    }

    public static void setImagesUploadSecondDir(String imagesUploadSecondDir) {
        Constants.imagesUploadSecondDir = imagesUploadSecondDir;
    }

    public static String getFileUploadSecondDir() {
        return fileUploadSecondDir;
    }

    public static void setFileUploadSecondDir(String fileUploadSecondDir) {
        Constants.fileUploadSecondDir = fileUploadSecondDir;
    }
}
