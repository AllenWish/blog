package com.awsoft.core.intercepter;

import com.awsoft.blog.entity.TUser;
import com.awsoft.core.base.ContextSession;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by AllenWish on 2017-11-29.
 */
public class MyInterceptor implements HandlerInterceptor {
    private static final Logger logger = Logger.getLogger(MyInterceptor.class);
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {

        String servletPath = request.getServletPath();
        //String path = request.getServletPath();
       /* logger.info("request.getServletPath():"+servletPath);
        String uri = request.getRequestURI();
        logger.info("request.getRequestURI():"+uri);
        StringBuffer requestURL = request.getRequestURL();
        logger.info("request.getRequestURL():"+requestURL);*/
        /*request.getServletPath():/index
        request.getRequestURI():/index
        request.getRequestURL():http://localhost:8033/index  */
        if(servletPath==null){
            response.sendRedirect(request.getContextPath()+"/index");
            return false;
        }
        //首页请求不拦截
        if("/index".equals(servletPath)||"/".equals(servletPath)){
            return true;
        }

        //请求进入后台不拦截
        if(servletPath.startsWith("/admin")||servletPath.startsWith("/user")){
            return true;
        }
        //登录请求不拦截
        if("/login".equals(servletPath)||"/login/".equals(servletPath)){
            Object user = request.getSession().getAttribute(ContextSession.LOGINUSER);
            if(user!=null){
                //如果有登录信息
                response.sendRedirect(request.getContextPath()+"/user/"+((TUser)user).getNickName());
            }
            return true;
        }

        return true;

    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
    }
}
