package com.glut.dangjian.background.news.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.glut.dangjian.background.news.service.NewStateService;
import com.glut.dangjian.entity.news.XwZtb;
import com.glut.dangjian.mapper.background.news.NewsStateMapper;

@Service("newStateService")
@Transactional
public class NewStateServiceImpl implements NewStateService{

    @Autowired
    private NewsStateMapper xwZtbMapper;

    /**
     * 获取所有新闻状态
     */
    @Override
    @Cacheable(value="newsStateCache", key="#root.methodName"  )
    public List<XwZtb> getNewsStateListAll() {
        
        return xwZtbMapper.getNewsStateListAll();
    }
    
    
}
