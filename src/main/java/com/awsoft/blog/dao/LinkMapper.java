package com.awsoft.blog.dao;

import com.awsoft.blog.entity.Link;
import java.util.List;

public interface LinkMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Link record);

    Link selectByPrimaryKey(Integer id);

    List<Link> selectAll();

    int updateByPrimaryKey(Link record);
}