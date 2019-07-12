package com.glut.dangjian.service.notice;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.notice.view.ViewNotice;
import com.glut.dangjian.entity.user.Yhb;

/** 
* @author xulankong
* @date 创建时间:  2018年12月23日 上午11:01:29
* @version 1.0
*/
public interface NoticeFrontService {

    // 获取通知数量
    Integer getNoticeNum(Yhb yhb);

    // 获取公告列表
    PageInfo<ViewNotice> getNotice(Integer pageNum, Integer pageSize, Yhb yhb);

    // 获取公告详细信息
    ViewNotice getNoticeInfoByNoticeId(String noticeId);

    // 获取通知列表
    PageInfo<ViewNotice> getNotice(Integer pageNum, Integer pageSize, Yhb yhb, String approvalType, String approvalTypeTwo);

}
