package com.glut.dangjian.mapper.approval;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.approval.SpSpjdb;

public interface ApprovalNodeMapper {
    
    // 删除审批节点
    int deleteById(Integer spjdId);

    // 插入一个节点信息
    int insert(SpSpjdb record);

    // 插入一个节点信息，并且判断是否为空
    int insertSelective(SpSpjdb record);

    // 修改审批节点，并且判断是否为空
    int updateByIdSelective(SpSpjdb record);

    // 修改审批节点
    int updateById(SpSpjdb record);

    // 加载审批流程的所有节点
    List<SpSpjdb> loadNodeApprovalBySplcId(@Param("splcId") Integer splcId);

    // 查审批节点，通过主键id
    SpSpjdb selectById(Integer spjdId);
    
    // 获取审批节点，根据节点的名称获取
    SpSpjdb getApprovalNodeByNodeName(String spjdMc);

    // 根据审批节点获取下一个节点
    SpSpjdb getApprovalNextNodeById( @Param("spjdId") Integer spjdId);
    
    // 获取上一个审批节点
    SpSpjdb getApprovalPrevNodeById(@Param("spjdId")Integer spjdId);

    // 修改节点为第一个节点
    void updateIsFirstNodeById(Integer spjdId);

    // 获取审批第一个节点，根据审批流程id
    int getFirstNodeIdByApprovalProcessId(@Param("approvalProcessId") Integer approvalProcessId);

    // 获取下一个审批节点
    Integer getNextApprovalNodeByOjbectId(String objectId);

    void updateprevNodeAndCurrentNodeAndnextNode(@Param("prevNode")SpSpjdb prevNode, 
            @Param("spjdb")SpSpjdb spjdb, @Param("endNode")SpSpjdb endNode, @Param("nextNode")SpSpjdb nextNode);

    SpSpjdb getFirstNodeByApprovalProcessId(Integer splcId);

    SpSpjdb getEndNodeByApprovalProcessId(int splcId);

    SpSpjdb getApprovalNodeIdById(Integer nodeId);

    void deleteMidNode(@Param("spjdId")Integer spjdId, @Param("midNode")SpSpjdb midNode);

    void deleteEndNode(@Param("spjdId")Integer spjdId, @Param("prevNode")SpSpjdb prevNode);

    void deleteFirstNode(@Param("spjdId")Integer spjdId, @Param("nextNode")SpSpjdb nextNode);

    void updateAndPrevNode(@Param("spjdb")SpSpjdb spjdb,  @Param("prevNode") SpSpjdb prevNode);

}