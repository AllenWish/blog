package com.awsoft.blog.service.impl;

import com.awsoft.blog.dao.BloggerMapper;
import com.awsoft.blog.entity.Blogger;
import com.awsoft.blog.service.BloggerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by AllenWish on 2017-12-13.
 */
@Service("bloggerService")
public class BloggerServiceImp implements BloggerService {
    @Autowired
    private BloggerMapper bloggerMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return bloggerMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Blogger record) {
        return bloggerMapper.insert(record);
    }

    @Override
    public Blogger selectByPrimaryKey(Integer id) {
        return bloggerMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Blogger> selectAll() {
        return bloggerMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Blogger record) {
        return bloggerMapper.updateByPrimaryKey(record);
    }
}
