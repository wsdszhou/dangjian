package com.glut.dangjian.mapper.approval.view;

import java.util.List;

import com.glut.dangjian.entity.approval.view.ViewApprovalProjectProcessNode;
import com.glut.dangjian.entity.user.Yhb;
/**
 * 
 * @author XuLanKong
 *
 */
public interface ViewApprovalProjectProcessNodeMapper {
    
    // 插入一条视图
    int insert(ViewApprovalProjectProcessNode record);

    // 插入一条视图,并且判断是否为为空
    int insertSelective(ViewApprovalProjectProcessNode record);

    // 分页查询审批流程项目
    List<ViewApprovalProjectProcessNode> getApprovalProjectPageList(
            ViewApprovalProjectProcessNode viewApprovalProjectProcessNode);

}