package com.awsoft.blog.service.impl;

import com.awsoft.blog.dao.BlogtypeMapper;
import com.awsoft.blog.entity.Blogtype;
import com.awsoft.blog.service.BlogtypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by AllenWish on 2017-12-14.
 */
@Service("blogtypeService")
public class BlogtypeServiceImp implements BlogtypeService {
    @Autowired
    private BlogtypeMapper blogtypeMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(Blogtype record) {
        return 0;
    }

    @Override
    public Blogtype selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public List<Blogtype> selectAll() {
        return blogtypeMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Blogtype record) {
        return 0;
    }
}
