package com.chubao.cf.game.service.others;

import org.springframework.boot.autoconfigure.template.AbstractTemplateViewResolverProperties;

import javax.servlet.http.HttpServletRequest;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/17 下午6:57
 * 任务号:
 * 创建说明:
 */
public class Util {
    public static String getUrl(HttpServletRequest request){
        String url = request.getScheme() +"://" + request.getServerName() + ":" + request.getServerPort() + request.getServletPath();
        if(null != request.getQueryString()){
            url += "?" + request.getQueryString();
        }
        return url;
    }


}
