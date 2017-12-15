package com.awsoft.blog.service.impl;

import com.awsoft.blog.dao.CommentMapper;
import com.awsoft.blog.entity.Comment;
import com.awsoft.blog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by AllenWish on 2017-12-13.
 */
@Service("commentService")
public class CommentServiceImp implements CommentService {
    @Autowired
    private CommentMapper commentMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return commentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Comment record) {
        return commentMapper.insert(record);
    }

    @Override
    public Comment selectByPrimaryKey(Integer id) {
        return commentMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Comment> selectAll() {
        return commentMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Comment record) {
        return commentMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Comment> getByBlog(Integer blogid) {
        return commentMapper.getByBlog(blogid);
    }
}
