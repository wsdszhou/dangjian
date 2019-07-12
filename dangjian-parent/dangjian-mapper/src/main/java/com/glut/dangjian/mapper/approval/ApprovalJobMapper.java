package com.glut.dangjian.mapper.approval;

import java.util.List;

import com.glut.dangjian.entity.approval.SpSpgwb;

/**
 * 
 * @author XuLanKong
 *
 */
public interface ApprovalJobMapper {
    
    // 通过主键删除审批岗位 
    int deleteById(Integer spgwId);

    //  插入审批岗位
    int insert(SpSpgwb record);

    //  插入审批岗位， 并且判断是否为空
    int insertSelective(SpSpgwb record);

    //通过主键查询审批岗位
    SpSpgwb selectById(Integer spgwId);

    // 修改审批岗位， 并且判断是否为空
    int updateByIdSelective(SpSpgwb record);

    // 修改审批岗位
    int updateById(SpSpgwb record);

    // 加载审批岗位
    List<SpSpgwb> loadApprovalJob();

    // 分页查询审批岗位
    List<SpSpgwb> approvalJobPageList();

    // 根据审批岗位获取视频对象
    SpSpgwb getJobByName(String spgwSpgwmc);
}