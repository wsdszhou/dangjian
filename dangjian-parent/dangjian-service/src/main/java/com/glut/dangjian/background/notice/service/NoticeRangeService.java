package com.glut.dangjian.background.notice.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.notice.NoticeRange;

public interface NoticeRangeService {

    // 分页查询
    PageInfo<NoticeRange> getNoticeRangePageList(Integer pageNum, Integer pageSize, NoticeRange noticeRange);

    // 添加通知范围
    void addNoticeRange(NoticeRange noticeRange);

    // 修改通知范围
    void updateNoticeRange(NoticeRange noticeRange);

    // 批量删除通知范围
    void deleteNoticRangeeBatch(String[] noticeRangeId);

    // 加载通知类型
    List<NoticeRange> loadNoticeRange(String name);

}
