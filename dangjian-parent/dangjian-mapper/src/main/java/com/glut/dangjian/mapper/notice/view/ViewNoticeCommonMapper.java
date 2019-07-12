package com.glut.dangjian.mapper.notice.view;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.notice.view.ViewNotice;
import com.glut.dangjian.entity.notice.view.ViewNoticeCommon;
import com.glut.dangjian.entity.view.ViewYhxx;

public interface ViewNoticeCommonMapper {
    int insert(ViewNoticeCommon record);

    int insertSelective(ViewNoticeCommon record);
    
    // 查询公告
    List<ViewNotice> getNoticePageList( @Param("viewYhxx")ViewYhxx viewYhxx, @Param("tzBt")String bt);

    // 获取公告详细信息
    ViewNotice getNoticeInfoByNoticeId(String noticeId);
}