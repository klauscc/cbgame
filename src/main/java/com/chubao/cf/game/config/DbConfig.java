package com.chubao.cf.game.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.chubao.cf.game.domain.DbProperty;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/16 下午7:16
 * 任务号:
 * 创建说明: 配置数据源
 */
@Configuration
@MapperScan(basePackages = "com.chubao.cf.game.repository.mapper")
public class DbConfig {

    @Autowired
    private DbProperty dbProperty;

    /**
     * 数据源配置
     * @return 数据源
     */
    @Bean
    public DataSource dataSource(){
        DruidDataSource dataSource=new DruidDataSource();
        dataSource.setUrl(dbProperty.getUrl());
        dataSource.setUsername(dbProperty.getUserName());
        dataSource.setPassword(dbProperty.getPassword());
        dataSource.setDriverClassName(dbProperty.getDriver());
        return dataSource;
    }
}
