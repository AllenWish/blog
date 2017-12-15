package com.awsoft.blog.service.impl;

import com.awsoft.blog.dao.LinkMapper;
import com.awsoft.blog.entity.Link;
import com.awsoft.blog.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by AllenWish on 2017-12-14.
 */
@Service("linkService")
public class LinkServiceImp implements LinkService {
    @Autowired
    private LinkMapper linkMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return linkMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Link record) {
        return linkMapper.insert(record);
    }

    @Override
    public Link selectByPrimaryKey(Integer id) {
        return linkMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Link> selectAll() {
        return linkMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Link record) {
        return linkMapper.updateByPrimaryKey(record);
    }
}
