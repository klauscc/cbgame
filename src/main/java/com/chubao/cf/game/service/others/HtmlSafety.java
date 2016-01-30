package com.chubao.cf.game.service.others;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/25 下午1:35
 * 任务号:
 * 创建说明: 过滤html工具类
 */
@Service
public class HtmlSafety {

    /**
     * relax 过滤
     * @param html 待过滤的html
     * @return 过滤后的html
     */
    public static String relaxed(String html) {
        return Jsoup.clean(html,"http://localhost:8080",Whitelist.relaxed().preserveRelativeLinks(true));
    }
}
