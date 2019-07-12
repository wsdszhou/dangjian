package com.glut.dangjian.background.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.glut.dangjian.background.user.service.YhxxService;
import com.glut.dangjian.entity.user.YhXxb;
import com.glut.dangjian.entity.view.ViewYhxx;
import com.glut.dangjian.mapper.system.view.ViewYhxxMapper;
import com.glut.dangjian.mapper.user.YhXxbMapper;

/**
 * 用户信息service
 * @author XuLanKong
 *
 */
@Service("yhxxService")
@Transactional(propagation=Propagation.NESTED)
public class YhxxServiceImpl implements YhxxService{

    @Autowired
    private YhXxbMapper yhXxbMapper ;
    
    @Autowired
    private ViewYhxxMapper viewYhxxMapper;

    @Override
    public ViewYhxx getYhxxByYhId(String userId) {
        
        return viewYhxxMapper.getViewYhxxByUserId(userId);
    }
    
    
    
}
