package com.awsoft.blog.dao;

import com.awsoft.blog.entity.Blog;
import java.util.List;
import java.util.Map;

public interface BlogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Blog record);

    Blog selectByPrimaryKey(Integer id);

    List<Blog> selectAll();

    List<Blog> selectBlog(Blog record);

    int updateByPrimaryKey(Blog record);

    List<Map<String,Object>> getBlog(Map<String,Object> map);

}