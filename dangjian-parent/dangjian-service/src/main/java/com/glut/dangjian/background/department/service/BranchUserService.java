package com.glut.dangjian.background.department.service;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.branch.Zbb;
import com.glut.dangjian.entity.branch.view.ViewBranchUser;

/** 
* @author xulankong
* @date 创建时间:  2018年11月14日 下午4:23:24
* @version 1.0
*/
public interface BranchUserService {

    // 分页查询支部用户信息
    PageInfo getBranchUserPageList(Integer pageNum, Integer pageSize, ViewBranchUser viewBranchUser, Integer branchId);

}
