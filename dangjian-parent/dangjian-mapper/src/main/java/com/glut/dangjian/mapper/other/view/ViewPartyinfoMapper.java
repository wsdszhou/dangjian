package com.glut.dangjian.mapper.other.view;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.other.PartyInfo;
import com.glut.dangjian.entity.view.ViewPartyinfo;

public interface ViewPartyinfoMapper {
    int insert(ViewPartyinfo record);

    int insertSelective(ViewPartyinfo record);

    // 分页查询
    List<ViewPartyinfo> getPageList( ViewPartyinfo viewPartyinfo);

    // 根据用户userid获取视图
    ViewPartyinfo getViewPartyinfoByUserId(String id);

    PartyInfo getViewPartyinfoById(String objectId);

    // 根据userId查询党党籍信息
    ViewPartyinfo getParty(String userId);

    // 根据noticeId查询党党籍信息
    ViewPartyinfo getPartyByNoticeId(String noticeId);

}