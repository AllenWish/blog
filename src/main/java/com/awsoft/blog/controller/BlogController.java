package com.awsoft.blog.controller;

import com.awsoft.blog.entity.Blog;
import com.awsoft.blog.entity.Blogger;
import com.awsoft.blog.entity.TUser;
import com.awsoft.blog.service.BlogService;
import com.awsoft.blog.service.BloggerService;
import com.awsoft.blog.service.UserService;
import com.awsoft.core.base.AjaxAndJson;
import com.awsoft.core.base.ContextSession;
import com.awsoft.core.exceptions.CustomException;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;
import java.io.IOException;
import java.io.OutputStream;
import java.util.*;

/**
 * Created by AllenWish on 2017-12-12.
 */
@Controller
@RequestMapping("/blog")
public class BlogController {
    private static final Logger logger = Logger.getLogger(BlogController.class);

    @Autowired
    private BlogService blogService;
    @Autowired
    private BloggerService bloggerService;
    @Autowired
    private UserService userService;
    @RequestMapping("/all")
    @ResponseBody
    public AjaxAndJson allBlog(int page, HttpServletRequest request, HttpServletResponse response){
        logger.info("blog all page:"+page);
        PageHelper.startPage(page, ContextSession.DEFAULT_PAGE_SIZE);

        List<Map<String, Object>> blogs = null;
        try {
            blogs = blogService.getBlog(new HashMap<String, Object>());
        } catch (CustomException e) {
            e.printStackTrace();
        }
        PageInfo<Map<String, Object>> pageBlog = new PageInfo<>(blogs);
        AjaxAndJson aj = new AjaxAndJson();

        Map<String,Object> retMap = new HashMap<>();
        retMap.put("data",pageBlog.getList());
        retMap.put("pages",pageBlog.getPages());
        aj.setData(retMap);
        aj.setFlag(true);
        aj.setMsg("");
        return aj;
    }

    @RequestMapping("/detail/{id}")
    public String blogDetails(@PathVariable("id")Integer id,HttpServletRequest request,HttpServletResponse response){
        logger.info("id details :"+id);
        if(id==null||id<=0){
            throw new CustomException("访问出错，请重新查看博客");
        }
        Blog blog = null;
        try {
            blog = blogService.selectByPrimaryKey(id);
        } catch (CustomException e) {
            e.printStackTrace();
            throw new CustomException(e.getMessage());
        }
        if(blog==null){
            throw new CustomException("获取博客内容失败，请重新尝试");
        }
        //根据博客寻找博主
        Blogger blogger = bloggerService.selectByPrimaryKey(blog.getBlogger());

        if(blogger==null){
            blogger= new Blogger();
            blogger.setNickname("博主已出走");
            blogger.setImagename("defaultAvatar.jpg");
        }
        TUser conUser = new TUser();
        conUser.setBloggerId(blogger.getId());
        List<TUser> users = userService.getUser(conUser);
        if(users==null||users.size()==0){
            conUser.setIntegral("0");
        }else{
            conUser = users.get(0);
        }

        blog.setClickhit(blog.getClickhit()+1);
        try {
            blogService.updateByPrimaryKey(blog);
        } catch (CustomException e) {
            e.printStackTrace();
        }
        PageHelper.startPage(1,ContextSession.HOT_PAGE_SIZE);
        Map<String,Object> paramsMap = new HashMap<>();
        paramsMap.put("sort","replyHit");
        paramsMap.put("order","desc");
        List<Map<String, Object>> blogs = blogService.getBlog(paramsMap);
        PageInfo<Map<String, Object>> pageBlog = new PageInfo<>(blogs);
        PageHelper.startPage(1,ContextSession.HOT_PAGE_SIZE);
        paramsMap.put("blogger",blog.getBlogger());
        List<Map<String, Object>> bloggerHotBlogs = blogService.getBlog(paramsMap);
        PageInfo<Map<String, Object>> pageBlogger = new PageInfo<>(bloggerHotBlogs);

        request.setAttribute("hotBlog",pageBlog.getList());
        request.setAttribute("bloggerHotBlogs",pageBlogger.getList());
        request.setAttribute("user",conUser);
        request.setAttribute("blogger",blogger);
        request.setAttribute("blog",blog);
        return "blog/details";
    }
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String goadd(){
        return "blog/addblog";
    }

    //@PostMapping("/add")
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public AjaxAndJson doadd(Blog blog,HttpServletRequest request,HttpServletResponse response){
        Map<String, Object> retMap = new HashMap<>();
        AjaxAndJson aj = new AjaxAndJson();
        retMap.put("flag",true);
        try {
            TUser user = (TUser)request.getSession().getAttribute(ContextSession.LOGINUSER);
            if(user==null||user.getBloggerId()==null){
                throw new CustomException("没有写博文的权限");
            }
            blog.setBlogger(user.getBloggerId());

            try {
                user.setIntegral(Integer.parseInt(user.getIntegral()==null?"0":user.getIntegral())+2+"");
            } catch (NumberFormatException e) {
                user.setIntegral("2");
            }
            userService.updateByPrimaryKey(user);
            blogService.insert(blog);
        } catch (CustomException e) {
            e.printStackTrace();
            retMap.put("flag",false);
            retMap.put("msg",e.getMessage());
            aj.setData(retMap);
            return aj;
        }
        retMap.put("reurl","/blog/detail/"+blog.getId());
        aj.setData(retMap);
        return aj;
    }

}
