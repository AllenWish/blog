package com.awsoft.blog.service;

import com.awsoft.blog.entity.Comment;

import java.util.List;

/**
 * Created by AllenWish on 2017-12-13.
 */
public interface CommentService {
    int deleteByPrimaryKey(Integer id);

    int insert(Comment record);

    Comment selectByPrimaryKey(Integer id);

    List<Comment> selectAll();

    int updateByPrimaryKey(Comment record);

    List<Comment> getByBlog(Integer blogid);
}
