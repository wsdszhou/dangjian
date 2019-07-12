package com.glut.dangjian.background.approval.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.approval.SpSplcb;

public interface ApprovalService {

    // 添加审批流程
    public void saveApproval(SpSplcb splcb);

    // 分页查询审批流程
    public PageInfo<SpSplcb> approvalList(Integer pageNum, Integer pageSize);

    // 修改审批流程
    public void updateApproval(SpSplcb splcb);

    // 批量删除审批流程
    public void deleteApprovalBatch(String[] id);

    public List<SpSplcb> loadApprovalProcess();

    
}
