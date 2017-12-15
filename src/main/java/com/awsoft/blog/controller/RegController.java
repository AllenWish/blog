package com.awsoft.blog.controller;

import com.awsoft.blog.entity.TUser;
import com.awsoft.blog.service.UserService;
import com.awsoft.core.base.AjaxAndJson;
import com.awsoft.core.base.ContextSession;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by AllenWish on 2017-12-07.
 */
@Controller
@RequestMapping("/reg")
public class RegController {

    private static final Logger logger = Logger.getLogger(RegController.class);

    @Autowired
    private UserService userService;

    @RequestMapping({"","/","goreg"})
    public String goreg(HttpServletRequest request, HttpServletResponse response){
        return "user/reg";
    }

    @RequestMapping("getCheckCode")
    @ResponseBody
    public AjaxAndJson getCheckCode(String phone, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
        logger.info("do getCheckCode "+System.currentTimeMillis());
        Map<String,Object> teMap = new HashMap<>();

        String checkCode = checkCode(phone);
        request.getSession().setAttribute(ContextSession.CHECK_CODE,checkCode);
        teMap.put("flag", true);
        teMap.put("msg", "");
        teMap.put("checkCode", checkCode);
        AjaxAndJson aj = new AjaxAndJson();
        aj.setData(teMap);
        return aj;


    }
    @RequestMapping("checkName")
    @ResponseBody
    public AjaxAndJson checkName(TUser user,HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
        logger.info("do checkName "+System.currentTimeMillis());
        Map<String,Object> teMap = new HashMap<>();
        /**
         * 在实际操作中，如果我们在Lambda体内或匿名内部类中要对外部的某些量进行操作，那么这种限制也是很容易被规避，
         * 因为即使数组是final的（即该数组不能再指向其他数组对象），里面的值依旧可变。
         */
        final boolean[] flag = {true};
        //操作
        List<TUser> userList = userService.getUser(user);
        userList.forEach((TUser tUser) ->
        {
            if(tUser.getNickName().equals(user.getNickName())){
                flag[0] = false;
                return;
            }
        });
        teMap.put("flag",flag[0]);
        AjaxAndJson aj = new AjaxAndJson();
        aj.setData(teMap);
        return aj;
    }

    private String checkCode(String phone) {
        //生成一个 校验码
        String checkCode = "21er";
        return checkCode;
    }

    @RequestMapping("register")
    @ResponseBody
    public AjaxAndJson register(TUser user,String checkCode,String repass,HttpServletRequest request, HttpServletResponse response){
        logger.info("do register "+System.currentTimeMillis());
        Map<String,Object> retMap = new HashMap<>();
        AjaxAndJson aj = new AjaxAndJson();

        String password = user.getPassword();
        boolean flag = true;
        if(password==null||!password.equals(repass)){
            //重置
            flag = false;
            retMap.put("msg","请重新填写密码");
            retMap.put("flag",flag);
            aj.setData(retMap);
            return aj;

        }
        Object checkCodeSe = request.getSession().getAttribute(ContextSession.CHECK_CODE);
        if(checkCodeSe==null||!checkCodeSe.equals(checkCode)){
            //返回去
            flag = false;
            retMap.put("msg","校验码有问题，请重新获取");
            retMap.put("flag",flag);
            aj.setData(retMap);
            return aj;
        }

        try {
            //插入数据
            userService.insert(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        retMap.put("flag",flag);
        logger.info("end register "+System.currentTimeMillis());
        aj.setData(retMap);
        return aj;
    }

}
