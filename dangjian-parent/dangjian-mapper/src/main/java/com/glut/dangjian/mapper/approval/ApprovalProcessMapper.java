package com.glut.dangjian.mapper.approval;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.approval.SpSplcb;

public interface ApprovalProcessMapper {
    
    // 通过id删除审批流程
    int deleteBrantch(@Param("ids")int[] ids);

    // 插入一条审批流程
    int insert(SpSplcb record);

    // 插入一条审批流程，并且判断是否为空
    int insertSelective(SpSplcb record);

    // 通过主键Id查询审批流程
    SpSplcb selectById(Integer splc);

    // 修改审批流程信息，并且判断是否为空
    int updateByIdSelective(SpSplcb record);

    // 修改审批流程信息
    int updateById(SpSplcb record);

    // 分页查询审批流程
    List<SpSplcb> approvalList();

    // 加载所有的审批流程
    List<SpSplcb> loadApprovalProcess();

    SpSplcb getSpprovalProcessMapperIdByName(String newsapproval);
}