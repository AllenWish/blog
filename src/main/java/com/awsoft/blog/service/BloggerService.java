package com.awsoft.blog.service;

import com.awsoft.blog.entity.Blogger;

import java.util.List;

/**
 * Created by AllenWish on 2017-12-13.
 */
public interface BloggerService {
    int deleteByPrimaryKey(Integer id);

    int insert(Blogger record);

    Blogger selectByPrimaryKey(Integer id);

    List<Blogger> selectAll();

    int updateByPrimaryKey(Blogger record);
}
