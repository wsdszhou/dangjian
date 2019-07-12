package com.glut.dangjian.background.approval.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.approval.SpRyb;
import com.glut.dangjian.entity.approval.SpSpgwb;
import com.glut.dangjian.entity.approval.view.ViewApprovalJobUser;
import com.glut.dangjian.entity.approval.view.ViewJobUser;
import com.glut.dangjian.mapper.approval.view.ViewApprovalJobUserMapper;

/**
 * 
 * @author XuLanKong
 *
 */
public interface ApprovalJobService {

    // 分页查询审批岗位
    PageInfo<SpSpgwb> approvalJobPageList(Integer pageNum, Integer pageSize);

    // 加载审批岗位
    List<SpSpgwb> loadApprovalJob();

    // 添加审批岗位
    void saveApproval(SpSpgwb spgwb);

    // 修改审批岗位
    void updateApprovalJob(SpSpgwb spgwb);

    // 批量删除岗位
    void deleteApprovalJobBatch(String[] jobId);

    // 分页查询审批岗位人员信息
    PageInfo<ViewApprovalJobUser> jobUserPageList(Integer pageNum, Integer pageSize,  ViewJobUser viewJobUser);

    // 添加审批用户
    Integer saveJobUser(ViewApprovalJobUser viewApprovalJobUser);

    // 获取审批岗位对象，通过sp岗位id
    SpSpgwb getJobById(Integer spgwId);

    // 修改审批人员信息
    Integer updateApprovalJobUser(ViewApprovalJobUser viewApprovalJobUser);

    // 批量删除审批人员信息
    void deleteApprovalUserJobBatch(String[] spryIds);

    SpRyb getApprovalUserByUserId(String userId,ViewApprovalJobUser viewApprovalJobUser);


    
}
