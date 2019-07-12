package com.glut.dangjian.background.notice.service;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.notice.view.ViewNotice;
import com.glut.dangjian.entity.user.Yhb;

/** 
* @author xulankong
* @date 创建时间:  2018年11月27日 下午2:48:55
* @version 1.0
*/
public interface NoticeObjectService {

    // 查询个人所有的通知
    PageInfo<ViewNotice> getSelfNoticePageList(Integer pageNum, Integer pageSize, Yhb yhb, ViewNotice viewNotice);

    PageInfo<ViewNotice> getNoticePageList(Integer pageNum, Integer pageSize, Yhb yhb);

    // 通过通知id获取通知视图
    ViewNotice getViewNoticeByNoticeId(String noticeId);

    void readNotice(String noticeId);

}
