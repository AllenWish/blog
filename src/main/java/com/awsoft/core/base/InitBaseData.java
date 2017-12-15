package com.awsoft.core.base;

import com.awsoft.blog.entity.Blogtype;
import com.awsoft.blog.entity.Link;
import com.awsoft.blog.service.BlogtypeService;
import com.awsoft.blog.service.LinkService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import java.util.List;

/**
 * Created by AllenWish on 2017-12-14.
 */
@Service(value="initBaseData")
public class InitBaseData {
    private static Logger logger = Logger.getLogger(InitBaseData.class);
    @Autowired
    private LinkService linkService;
    @Resource
    private ServletContext application;
    @Resource
    private BlogtypeService blogtypeService;
    public void init(){
        logger.info(" init start");
        List<Link> links = linkService.selectAll();
        application.setAttribute(ContextSession.LINKLIST,links);
        List<Blogtype> blogtypes = blogtypeService.selectAll();
        application.setAttribute("blogtypes",blogtypes);

        logger.info(" init end");
    }

}
