package com.glut.dangjian.mapper.notice.view;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.approval.SpLcxmb;
import com.glut.dangjian.entity.notice.view.ViewNotice;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewYhxx;

public interface ViewNoticeMapper {
    
    int insert(ViewNotice record);

    int insertSelective(ViewNotice record);

    //查询有关于与自己所有的通知
    List<ViewNotice> getSelfNoticePageList(@Param("yhb") Yhb yhb, @Param("viewNotice") ViewNotice viewNotice);

    // 查询公告
    List<ViewNotice> getNoticePageList( @Param("viewYhxx")ViewYhxx viewYhxx, @Param("tzBt")String bt);

    // 通过通知id获取通知视图
    ViewNotice getViewNoticeByNoticeId(String noticeId);

    SpLcxmb getNoApprovalNoticeObjectByUserIdAndApprovaltype(@Param("userId")String id, @Param("approvalType")String partinfoapproval);

    // 获取通知数量
    Integer getNoticeNum(@Param("viewYhxx") ViewYhxx viewYhxx,@Param("tzBt") String tzBt);

    // 获取公告列表
    List<ViewNotice> getNoticeByViewYhxxAndApprovaltype(@Param("viewYhxx")ViewYhxx viewYhxx, @Param("approvalType")String approvalType);

    // 获取通知列表
    List<ViewNotice> getNoticeByUserIdAndApprovaltype(@Param("userId")String userId, @Param("tzBt")String tzBt, @Param("tzBtTwo")String tzBtTwo);


}