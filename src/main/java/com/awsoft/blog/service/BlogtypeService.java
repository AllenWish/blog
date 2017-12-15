package com.awsoft.blog.service;

import com.awsoft.blog.entity.Blogtype;

import java.util.List;

/**
 * Created by AllenWish on 2017-12-14.
 */
public interface BlogtypeService {
    int deleteByPrimaryKey(Integer id);

    int insert(Blogtype record);

    Blogtype selectByPrimaryKey(Integer id);

    List<Blogtype> selectAll();

    int updateByPrimaryKey(Blogtype record);
}
