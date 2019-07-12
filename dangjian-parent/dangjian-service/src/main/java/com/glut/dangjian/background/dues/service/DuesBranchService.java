package com.glut.dangjian.background.dues.service;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.dues.DuesBranch;
import com.glut.dangjian.entity.dues.view.ViewDuesCollegeBranch;

public interface DuesBranchService {
    // 分页查询审批岗位人员信息
    PageInfo<ViewDuesCollegeBranch> duesBranchPageList(Integer pageNum, Integer pageSize,Integer collegeId);

    DuesBranch getBranchById(Integer branchId);
}
