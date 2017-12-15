package com.awsoft.blog.controller;

import com.awsoft.blog.entity.TUser;
import com.awsoft.blog.service.UserService;
import com.awsoft.core.base.AjaxAndJson;
import com.awsoft.core.base.ContextSession;
import com.awsoft.core.exceptions.CustomException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by AllenWish on 2017-12-11.
 */
@Controller
@RequestMapping("/login")
public class LoginController {
    private static final Logger logger = Logger.getLogger(LoginController.class);

    @Autowired
    private UserService userService;

    @RequestMapping({"","/"})
    public String index(TUser user, HttpServletRequest request, HttpServletResponse response){
        request.setAttribute("user",user);
        return "user/login";
    } @RequestMapping({"/childlogin","/childlogin/"})
    public String childlogin(TUser user, HttpServletRequest request, HttpServletResponse response){
        request.setAttribute("user",user);
        return "user/childlogin";
    }

    @RequestMapping("/login")
    @ResponseBody
    public AjaxAndJson login(TUser user,
                             HttpServletRequest request, HttpServletResponse response){
        Map<String,Object> retMap = new HashMap<>();
        AjaxAndJson aj = new AjaxAndJson();
        try {
            user = userService.dologin(user);
            if(user==null){
                throw new CustomException("登陆失败，请确认登录账号和密码正确！");
            }
            request.getSession().setAttribute(ContextSession.LOGINUSER,user);

            retMap.put("flag",true);
        } catch (CustomException e) {
            retMap.put("msg",e.getMessage());
            retMap.put("flag",false);
            aj.setData(retMap);
            throw new CustomException("登陆失败，请确认登录账号和密码正确！");

        }
        aj.setData(retMap);
        return aj;
    }


    @RequestMapping("/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response){
        request.getSession().removeAttribute(ContextSession.LOGINUSER);
        try {
            response.sendRedirect("/index");
        } catch (IOException e) {
            throw new CustomException("logout:"+e.getMessage());
        }
    }

}
