package com.glut.dangjian.service.department;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.branch.Zbry;
import com.glut.dangjian.entity.branch.view.ViewBranch;
import com.glut.dangjian.entity.branch.view.ViewBranchUser;
import com.glut.dangjian.entity.user.Yhb;

/** 
* @author xulankong
* @date 创建时间:  2018年12月23日 下午3:31:17
* @version 1.0
*/
public interface BranchFrontService {

    // 获取支部人员信息
    List<ViewBranchUser> getBranchUserInfo(Yhb yhb);

    // 获取支部信息
    ViewBranch getBranchInfo(Yhb yhb);

    // 获取荣誉列表
    PageInfo<Zbry> getBranchHonorPageList(Integer pageNum, Integer pageSize);

    // 获取单个荣誉信息
    Zbry getBranchHonorByHonorid(String honorId);

}
