package com.chubao.cf.game.config;

import com.chubao.cf.game.service.login.LoginFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.embedded.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/29 下午5:55
 * 任务号:
 * 创建说明: web配置
 */
//@Configuration
public class WebConfig {


//    @Bean
//    @Autowired
//    public FilterRegistrationBean filterRegistrationBean(LoginFilter loginFilter){
//        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
//        filterRegistrationBean.setFilter(loginFilter);
//        filterRegistrationBean.setEnabled(true);
//        filterRegistrationBean.addUrlPatterns("/admin/**");
//        return filterRegistrationBean;
//    }
}
