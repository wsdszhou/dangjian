package com.glut.dangjian.background.approval.service;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.approval.SpLcxmb;
import com.glut.dangjian.entity.approval.view.ViewApprovalProjectProcessNode;
import com.glut.dangjian.entity.user.Yhb;

public interface ApprovalProjectService {
    
    // 分页查询审批流程项目列表
    PageInfo<ViewApprovalProjectProcessNode> getApprovalProjectPageList(Integer pageNum, Integer pageSize,
            ViewApprovalProjectProcessNode viewApprovalProjectProcessNode);

    // 批量删除审批项目
    void deleteApprovalProjectBatch(String[] projectIds);

    // 添加审批项目
    void addApprovalProject(SpLcxmb spLcxmb, Yhb yhb, String userName, Integer priority);
    
    // 修改审批信息
    void updateApprovalProject(SpLcxmb spLcxmb, Yhb yhb, String objectName, Integer objectYxj, String objectId);

    // 同意审批
    int agreeApproval(String objectId, Yhb yhb);

    // 不同意审批
    void disagreeApproval(String objectId, Yhb yhb);

    // 不同意评论
    String commentDisagree(String commentId, Yhb attribute);
    
    // 同意评论
    String commentAgree(String commentId, Yhb attribute);

    // 添加审批审批项目
    void addNewsCommenetApprovalProject(SpLcxmb spLcxmb, Yhb user);

}
