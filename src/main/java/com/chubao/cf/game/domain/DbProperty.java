package com.chubao.cf.game.domain;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/16 下午7:22
 * 任务号:
 * 创建说明: 读取数据源配置属性
 */

@Component
@ConfigurationProperties(prefix = "datasource")
public class DbProperty {
    /**
     * 数据源url
     */
    private String url;
    /**
     * 用户名
     */
    private String userName;
    /**
     * 密码
     */
    private String password;
    /**
     * 驱动
     */
    private String driver;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }
}
