package com.glut.dangjian.mapper.approval.view;

import java.util.List;

import com.glut.dangjian.entity.approval.view.ViewApprovalNode;

public interface ViewApprovalNodeMapper {
    
    // 插入一条视图
    int insert(ViewApprovalNode record);

    // 插入一条视图,并且判断是否为空
    int insertSelective(ViewApprovalNode record);

    // 分页查询视图
    List<ViewApprovalNode> nodePageListBySplcId(Integer splcId);

    ViewApprovalNode getFirstNodeIdByApprovalProcessName(String approvalProcessName);
}