package com.awsoft.blog.service.impl;

import com.awsoft.blog.dao.TUserMapper;
import com.awsoft.blog.entity.TUser;
import com.awsoft.blog.service.UserService;
import com.awsoft.core.exceptions.CustomException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by AllenWish on 2017-12-07.
 */
@Service("userService")
public class UserServiceImp implements UserService {

    @Autowired
    private TUserMapper userMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(TUser record) {
        return userMapper.insert(record);
    }

    @Override
    public TUser selectByPrimaryKey(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<TUser> selectAll() {
        return userMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(TUser record) {
        return userMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<TUser> getUser(TUser user) {
        return userMapper.getUser(user);
    }

    @Override
    public TUser dologin(TUser user) throws CustomException{
        if(user == null){
            throw new CustomException("用户不能为空");
        }
        if(user.getNickName()==null||"".equals(user.getNickName())){
            throw new CustomException("请填写用户昵称");
        }
        if(user.getPassword()==null||"".equals(user.getPassword())){
            throw new CustomException("请填写密码");
        }
        List<TUser> users = null;
        try {
            users = userMapper.dologin(user);
            if(users!=null&&users.size()==1){
                return users.get(0);
            }else{
                return null;
            }
        } catch (CustomException e) {
            throw new CustomException(e.getMessage());
        }
    }
}
