package com.glut.dangjian.background.approval.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.approval.SpSpjdb;
import com.glut.dangjian.entity.approval.view.ViewApprovalNode;

public interface ApprovalNodeService {

    // 分页查询审批节点
    PageInfo<ViewApprovalNode> nodePageListBySplcId(Integer pageNum, Integer pageSize, Integer splcId);

    // 加载审批流程的所有节点
    List<SpSpjdb> loadNodeApprovalBySplcId(Integer splcId);

    // 保存审批节点
    void saveApprovalNode(SpSpjdb spjdb);

    // 修改审批节点信息
    void updateApprovalNodeInformat(SpSpjdb spjdb);

    // 批量删除审批节点
    void deleteApprovalBatch(Integer nodeId, Integer processId);

    
}
