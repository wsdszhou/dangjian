package com.glut.dangjian.background.system.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.system.service.BugService;
import com.glut.dangjian.entity.other.Bug;
import com.glut.dangjian.entity.system.view.ViewBug;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.mapper.background.system.BugMapper;
import com.glut.dangjian.mapper.system.view.ViewBugMapper;
import com.glut.dangjian.utils.StringTools;

/** 
* @author xulankong
* @date 创建时间:  2018年12月18日 下午6:59:20
* @version 1.0
*/
@Service
@Transactional(propagation=Propagation.NESTED)
public class BugServiceImpl implements BugService {

    @Autowired
    private BugMapper bugMapper;
    
    @Autowired
    private ViewBugMapper viewBugMapper;
    
    @Override
    @Cacheable(value="bugCache", key="'#root.methodName'+'#p0'+'--'+'#p1'"  )
    public PageInfo<ViewBug> getBugPageList(Integer pageNum, Integer pageSize) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<ViewBug> bugs = viewBugMapper.getBugPageList();
        return new PageInfo<ViewBug>(bugs);
    }

    /**
     * 查看bug详细信息
     */
    @Override
    @Cacheable(value="bugCache", key="'#p0'+'--'+'#root.methodName'"  )
    public ViewBug getBug(String id) {
        ViewBug viewBug =  viewBugMapper.getViewBugById(id);
        bugMapper.reading(id);
        return viewBug;
    }

    /**
     * 添加bug
     */
    @Override
    @CacheEvict(value="bugCache", allEntries=true)
    public void addBug(Bug bug) {
        bug.setId(StringTools.getUUID());
        bug.setSj(new Date());
        bugMapper.insertSelective(bug);
    }

}
