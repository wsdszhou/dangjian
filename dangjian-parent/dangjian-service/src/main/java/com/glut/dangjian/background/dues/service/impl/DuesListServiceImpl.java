package com.glut.dangjian.background.dues.service.impl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.dues.service.DuesListService;
import com.glut.dangjian.entity.dues.view.ViewDuesList;
import com.glut.dangjian.mapper.dues.DuesListMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("DuesListService")
public class DuesListServiceImpl implements DuesListService {

    @Autowired
    DuesListMapper duesListMapper;


    @Override
    public PageInfo<ViewDuesList>  duesPageList(Integer pageNum, Integer pageSize, ViewDuesList viewDuesList){
        PageHelper.startPage(pageNum, pageSize);
        List<ViewDuesList> list = duesListMapper.duesPageList(viewDuesList);
        PageInfo<ViewDuesList> pageInfo = new PageInfo<ViewDuesList>(list);
        return pageInfo;
    }

    @Override
    @CacheEvict(value="duesNotice", allEntries=true)
    public void duesNotice(String[] listId){
        for( String id : listId) {
            duesListMapper.noticeById(Integer.parseInt(id));
        }

    }
}
