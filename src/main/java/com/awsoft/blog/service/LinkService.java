package com.awsoft.blog.service;

import com.awsoft.blog.entity.Link;

import java.util.List;

/**
 * Created by AllenWish on 2017-12-14.
 */
public interface LinkService {
    int deleteByPrimaryKey(Integer id);

    int insert(Link record);

    Link selectByPrimaryKey(Integer id);

    List<Link> selectAll();

    int updateByPrimaryKey(Link record);
}
