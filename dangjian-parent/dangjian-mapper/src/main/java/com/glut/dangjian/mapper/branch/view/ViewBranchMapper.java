package com.glut.dangjian.mapper.branch.view;

import java.util.List;

import com.glut.dangjian.entity.branch.Zbb;
import com.glut.dangjian.entity.branch.view.ViewBranch;

public interface ViewBranchMapper {
    int insert(ViewBranch record);

    int insertSelective(ViewBranch record);

    List<Zbb> getBranchPageList(Zbb zbb);

    // 获取支部信息
    ViewBranch getBranchInfoByUserid(String userId);
    
    
}