package com.awsoft.blog.controller;

import com.awsoft.blog.entity.Comment;
import com.awsoft.blog.service.CommentService;
import com.awsoft.core.base.AjaxAndJson;
import com.awsoft.core.base.ContextSession;
import com.awsoft.core.exceptions.CustomException;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
 * Created by AllenWish on 2017-12-13.
 */
@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @RequestMapping("/all")
    @ResponseBody
    public AjaxAndJson blogAllComment(Integer page, Integer blogid, HttpServletRequest request, HttpServletResponse response){
        if(blogid==null){
            throw new CustomException("没找到博客");
        }
        if(page==null){
            page = 1;
        }
        PageHelper.startPage(page, ContextSession.DEFAULT_PAGE_SIZE);
        List<Comment> comments = commentService.getByBlog(blogid);
        PageInfo<Comment> commentPageInfo = new PageInfo<>(comments);
        AjaxAndJson aj = new AjaxAndJson();
        Map<String,Object> retMap = new HashMap<>();
        retMap.put("data",commentPageInfo.getList());
        retMap.put("pages",commentPageInfo.getPages());
        aj.setData(retMap);
        return aj;
    }

}
