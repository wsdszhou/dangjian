package com.glut.dangjian.mapper.approval.view;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.approval.SpSpjdb;
import com.glut.dangjian.entity.approval.view.ViewApprovalJobUser;

public interface ViewApprovalJobUserMapper {
    // 插入一条视图信息
    int insert(ViewApprovalJobUser record);

    // 插入一条视图信息， 并且判断是否为空 
    int insertSelective(ViewApprovalJobUser record);

    // 分页查询视图信息
    List<ViewApprovalJobUser> jobUserPageList(ViewApprovalJobUser viewApprovalJobUser);

    // 获取节点中所有的审批人员
    List<ViewApprovalJobUser> getListByApprovalNodeId(@Param("nodeId") Integer nodeId, @Param("userId") String userId);
}