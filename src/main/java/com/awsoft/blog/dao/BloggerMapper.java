package com.awsoft.blog.dao;

import com.awsoft.blog.entity.Blogger;
import java.util.List;

public interface BloggerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Blogger record);

    Blogger selectByPrimaryKey(Integer id);

    List<Blogger> selectAll();

    int updateByPrimaryKey(Blogger record);
}