package com.awsoft.core.intercepter;

import com.awsoft.core.base.ContextSession;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by AllenWish on 2017-11-29.
 * 登录拦截器
 */

public class LoginInterceptor implements HandlerInterceptor {

    private static final Logger logger = Logger.getLogger(LoginInterceptor.class);
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {

        HttpSession session = request.getSession();
        Object loginUser = session.getAttribute(ContextSession.LOGINUSER);
        if(loginUser==null){
            if (request.getHeader("x-requested-with")!= null && request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")){
                ServletOutputStream out = response.getOutputStream();

                out.print("{\"flag\":false,\"msg\":\"unlogin\"}");//返回给前端页面的未登陆标识

                out.flush();

                out.close();
            }else{

                /*String path = request.getServletPath();
                logger.info("request.getServletPath():"+path);
                String uri = request.getRequestURI();
                logger.info("request.getRequestURI():"+uri);
                StringBuffer requestURL = request.getRequestURL();
                logger.info("request.getRequestURL():"+requestURL);*/
                response.sendRedirect(request.getContextPath()+"/login");
            }
            return false;
        }
        //response.sendRedirect("index");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object o, Exception e) throws Exception {

    }
}
