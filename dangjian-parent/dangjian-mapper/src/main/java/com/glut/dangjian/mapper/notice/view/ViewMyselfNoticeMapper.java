package com.glut.dangjian.mapper.notice.view;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.approval.SpLcxmb;
import com.glut.dangjian.entity.notice.view.ViewMyselfNotice;

public interface ViewMyselfNoticeMapper {
    
    // 插入一条视图
    int insert(ViewMyselfNotice record);

    // 插入一条视图，并且判断是否为空
    int insertSelective(ViewMyselfNotice record);

    // 分页查询自己的通知
    List<ViewMyselfNotice> getMyselNoticePageList(ViewMyselfNotice viewMyselfNotice);
    
    // 获取通知对象根据通知id
    ViewMyselfNotice getNotApprovalNoticeObjectByNoticeId(@Param("noticeId")String noticeId, @Param("userId")String userId);

    SpLcxmb getNoApprovalNoticeObjectByUserIdAndApprovaltype(@Param("id")String id, @Param("approvalType")String partinfoapproval);
}