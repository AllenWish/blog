package com.awsoft.blog.service;

import com.awsoft.blog.entity.TUser;
import com.awsoft.core.exceptions.CustomException;

import java.util.List;

/**
 * Created by AllenWish on 2017-12-07.
 */
public interface UserService {
    int deleteByPrimaryKey(Integer id);

    int insert(TUser record);

    TUser selectByPrimaryKey(Integer id);

    List<TUser> selectAll();

    int updateByPrimaryKey(TUser record);

    List<TUser> getUser(TUser user);

    TUser dologin(TUser user) throws CustomException;
}
