package com.chubao.cf.game.domain;

/**
 * 创建者: 程峰
 * 创建时间: 16/2/19 下午3:40
 * 任务号:
 * 创建说明: 游戏充值选项
 */
public class PaymentOption {

    /**
     * 游戏id
     */
    private Integer gameId;
    /**
     * 货币单位
     */
    private String currency="元宝";

    /**
     * 人民币兑换游戏货币比例，1人民币兑换rate的游戏货币
     */
    private Integer rate=100;

    public PaymentOption(){

    }

    public PaymentOption(Integer gameId) {
        this.gameId = gameId;
    }

    public Integer getGameId() {
        return gameId;
    }

    public void setGameId(Integer gameId) {
        this.gameId = gameId;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public Integer getRate() {
        return rate;
    }

    public void setRate(Integer rate) {
        this.rate = rate;
    }
}
