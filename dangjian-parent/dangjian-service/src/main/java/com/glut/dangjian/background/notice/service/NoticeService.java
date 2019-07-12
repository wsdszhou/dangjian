package com.glut.dangjian.background.notice.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.approval.view.ViewApprovalJobUser;
import com.glut.dangjian.entity.notice.Notice;
import com.glut.dangjian.entity.notice.NoticeObject;
import com.glut.dangjian.entity.notice.view.ViewMyselfNotice;
import com.glut.dangjian.entity.notice.view.ViewNotice;

public interface NoticeService {

    // 分页查询通知列表
    PageInfo<Notice> getNoticePageList(Integer pageNum, Integer pageSize, Notice notice);

    // 添加学校通知信息
    void addNotice(Notice notice);

    // 修改通知信息
    void updateNotice(Notice notice);

    // 批量删除通知
    void deleteNoticeBatch(String[] schoolNoticeId);

    // 添加学院通知
    void addAcademyNotice(Notice notice);

    // 添加支部通知
    void addBranchNotice(Notice notice);

    // 分页查询自己的通知
    PageInfo<ViewMyselfNotice> getMyselNoticePageList(Integer pageNum, Integer pageSize, ViewMyselfNotice viewMyselfNotice);

    // 添加个人通知接口
    void addMyselfNotice(ViewMyselfNotice viewMyselfNotice);

}
