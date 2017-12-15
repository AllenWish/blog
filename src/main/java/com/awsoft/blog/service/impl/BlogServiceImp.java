package com.awsoft.blog.service.impl;

import com.awsoft.blog.dao.BlogMapper;
import com.awsoft.blog.entity.Blog;
import com.awsoft.blog.service.BlogService;
import com.awsoft.core.exceptions.CustomException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by AllenWish on 2017-12-12.
 */
@Service("blogService")
public class BlogServiceImp implements BlogService {

    @Autowired
    private BlogMapper blogMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) throws CustomException {
        return blogMapper.deleteByPrimaryKey(id
        );
    }

    @Override
    public int insert(Blog record) throws CustomException {
        return blogMapper.insert(record);
    }

    @Override
    public Blog selectByPrimaryKey(Integer id) throws CustomException {
        return blogMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Blog> selectAll() throws CustomException {
        return blogMapper.selectAll();
    }

    @Override
    public List<Blog> selectBlog(Blog record) throws CustomException {
        return blogMapper.selectBlog(record);
    }

    @Override
    public int updateByPrimaryKey(Blog record) throws CustomException {
        return blogMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Map<String, Object>> getBlog(Map<String, Object> map) throws CustomException {
        return blogMapper.getBlog(map);
    }
}
