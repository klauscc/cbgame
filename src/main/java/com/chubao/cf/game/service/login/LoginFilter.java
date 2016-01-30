package com.chubao.cf.game.service.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Service;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/29 下午5:36
 * 任务号:
 * 创建说明: 拦截用户请求
 */
@Service
public class LoginFilter extends OncePerRequestFilter{

    @Autowired
    HttpSession session;

    @Override
    protected void doFilterInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, FilterChain filterChain) throws ServletException, IOException {
        String uri = httpServletRequest.getRequestURI();
        if(uri.contains("admin/login")){    //登陆页面不拦截
            filterChain.doFilter(httpServletRequest,httpServletResponse);
            return;
        }
        if(uri.contains("admin")){  //其它admin页面拦截
            Integer userId = (Integer)session.getAttribute("adminUserId");
            if(null == userId){
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/admin/login");
                return;
            }
        }
        filterChain.doFilter(httpServletRequest,httpServletResponse);
    }
}
