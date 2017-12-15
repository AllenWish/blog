package com.awsoft.blog.dao;

import com.awsoft.blog.entity.TUser;
import java.util.List;

public interface TUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TUser record);

    TUser selectByPrimaryKey(Integer id);

    List<TUser> selectAll();

    int updateByPrimaryKey(TUser record);

    List<TUser> getUser(TUser user);

    List<TUser> dologin(TUser user);
}