package com.awsoft.blog.controller;

import com.awsoft.blog.entity.Blog;
import com.awsoft.blog.entity.Comment;
import com.awsoft.blog.entity.TUser;
import com.awsoft.blog.service.BlogService;
import com.awsoft.blog.service.BloggerService;
import com.awsoft.blog.service.CommentService;
import com.awsoft.blog.service.UserService;
import com.awsoft.core.base.AjaxAndJson;
import com.awsoft.core.base.ContextSession;
import com.awsoft.core.exceptions.CustomException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by AllenWish on 2017-12-11.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private BlogService blogService;
    @Autowired
    private BloggerService bloggerService;
    @Autowired
    private CommentService commentService;
    @RequestMapping("/{nickName}")
    public String index(@PathVariable("nickName") String nickName, HttpServletRequest request){
        TUser user = (TUser)request.getSession().getAttribute(ContextSession.LOGINUSER);
        TUser tuser = userService.selectByPrimaryKey(user.getId());
        request.setAttribute("user",tuser);
        return "user/index";
    }


    @RequestMapping(value = "/subcomment",method = RequestMethod.POST)
    @ResponseBody
    public AjaxAndJson subcomment(Integer blogid, Comment comment, HttpServletRequest request, HttpServletResponse response){
        if(blogid==null){
            throw new CustomException("评论无效，没有相对应的博文");
        }
        Blog blog = blogService.selectByPrimaryKey(blogid);
        if(blog==null){
            throw new CustomException("评论无效，没有相对应的博文");
        }
        AjaxAndJson aj = new AjaxAndJson();
        comment.setBlogid(blogid);
        String userIp=request.getRemoteAddr(); // 获取用户IP
        TUser user = (TUser)request.getSession().getAttribute(ContextSession.LOGINUSER);
        if(user == null){
            try {
                response.sendRedirect("/login/");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            try {
                user.setIntegral(Integer.parseInt(user.getIntegral()==null?"0":user.getIntegral())+1+"");
            } catch (NumberFormatException e) {
                user.setIntegral("1");
            }
            userService.updateByPrimaryKey(user);
            comment.setUserip(""+user.getId());
            commentService.insert(comment);
            blog.setReplyhit(blog.getReplyhit()+1);
            blog.setClickhit(blog.getClickhit()-1);
            blogService.updateByPrimaryKey(blog);
        } catch (CustomException e) {
            e.printStackTrace();
        }
        Map<String,Object> retMap = new HashMap<>();
        retMap.put("flag",true);
        aj.setData(retMap);
        return aj;
    }

}
