package com.awsoft.blog.dao;

import com.awsoft.blog.entity.Comment;
import java.util.List;

public interface CommentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Comment record);

    Comment selectByPrimaryKey(Integer id);

    List<Comment> selectAll();

    List<Comment> getByBlog(Integer blogid);

    int updateByPrimaryKey(Comment record);
}