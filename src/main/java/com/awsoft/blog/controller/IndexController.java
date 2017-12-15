package com.awsoft.blog.controller;

import com.awsoft.blog.entity.TUser;
import com.awsoft.blog.service.BlogService;
import com.awsoft.blog.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by AllenWish on 2017-12-07.
 */
@Controller
public class IndexController {

    @Autowired
    private UserService userService;
    @Autowired
    private BlogService blogService;

    @RequestMapping({"","/","/index"})
    public String index(HttpServletRequest request, HttpServletResponse response, Model model){
        PageHelper.startPage(1,5);
        Map<String,Object> paramsMap = new HashMap<>();
        paramsMap.put("sort","replyHit");
        paramsMap.put("order","desc");
        List<Map<String, Object>> blogs = blogService.getBlog(paramsMap);
        PageInfo<Map<String, Object>> pageBlog = new PageInfo<>(blogs);

        model.addAttribute("hotBlog",pageBlog.getList());
        return "index";
    }

}
