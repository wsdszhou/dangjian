package com.glut.dangjian.background.dues.service;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.dues.view.ViewDuesList;

public interface DuesListService {

    PageInfo<ViewDuesList> duesPageList(Integer pageNum, Integer pageSize,ViewDuesList viewDuesList);

    void duesNotice(String[] listId);
}
