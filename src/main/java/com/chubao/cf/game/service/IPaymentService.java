package com.chubao.cf.game.service;

import com.chubao.cf.game.domain.PaymentOption;

import java.util.HashMap;

/**
 * 创建者: 程峰
 * 创建时间: 16/2/20 下午1:11
 * 任务号:
 * 创建说明: 充值服务接口
 */
public interface IPaymentService {

    /**
     * 获取充值配置
     * @return 所有充值配置
     */
    HashMap<String,PaymentOption> getGamePaymentOptions();

    HashMap<String,HashMap<String,String>> getGamePaymentOptionsOfRateMap();

    /**
     * 获取当前充值配置
     * @param gameId 游戏id
     * @return 充值配置
     */
    PaymentOption getPaymentOption(Integer gameId);

    /**
     * 设置充值配置
     * @param paymentOption 充值配置
     */
    void setPaymentOption(PaymentOption paymentOption);

    /**
     * 初始化充值配置
     */
    void setInitialPaymentOption();

    /**
     * 设置充值配置
     * @param paymentOptions 充值配置
     */
    void setPaymentOptions(HashMap<String,PaymentOption> paymentOptions);
}
