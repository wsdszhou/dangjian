package com.glut.dangjian.background.system.service;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.other.Bug;
import com.glut.dangjian.entity.system.view.ViewBug;
import com.glut.dangjian.entity.user.Yhb;

/** 
* @author xulankong
* @date 创建时间:  2018年12月18日 下午6:59:11
* @version 1.0
*/
public interface BugService {

    PageInfo<ViewBug> getBugPageList(Integer pageNum, Integer pageSize);

    ViewBug getBug(String id);

    void addBug(Bug bug);

}
