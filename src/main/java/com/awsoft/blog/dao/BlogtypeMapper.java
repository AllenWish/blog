package com.awsoft.blog.dao;

import com.awsoft.blog.entity.Blogtype;
import java.util.List;

public interface BlogtypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Blogtype record);

    Blogtype selectByPrimaryKey(Integer id);

    List<Blogtype> selectAll();

    int updateByPrimaryKey(Blogtype record);
}