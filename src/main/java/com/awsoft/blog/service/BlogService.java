package com.awsoft.blog.service;

import com.awsoft.blog.entity.Blog;
import com.awsoft.core.exceptions.CustomException;

import java.util.List;
import java.util.Map;

/**
 * Created by AllenWish on 2017-12-12.
 */
public interface BlogService {

    int deleteByPrimaryKey(Integer id) throws CustomException;

    int insert(Blog record) throws CustomException;

    Blog selectByPrimaryKey(Integer id) throws CustomException;

    List<Blog> selectAll() throws CustomException;

    List<Blog> selectBlog(Blog record) throws CustomException;

    int updateByPrimaryKey(Blog record) throws CustomException;

    List<Map<String,Object>> getBlog(Map<String,Object> map) throws CustomException;
}
