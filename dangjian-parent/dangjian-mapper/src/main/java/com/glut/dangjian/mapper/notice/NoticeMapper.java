package com.glut.dangjian.mapper.notice;

import java.util.List;

import com.glut.dangjian.entity.notice.Notice;

public interface NoticeMapper {
    // 删除一条记录
    int deleteById(String tzId);

    // 添加一条信息
    int insert(Notice record);

    // 添加一信息，并且判断是否为空
    int insertSelective(Notice record);

    // 根据主键查询信息
    Notice selectById(String tzId);

    // 修改信息，并且判断是否为空
    int updateByIdSelective(Notice record);

    // 修改信息
    int updateById(Notice record);

    // 分页查询通知信息
    List<Notice> getNoticePageList(Notice notice);

    // 分页查询自己的通知
    List<Notice> getMyselNoticePageList(Notice notice);

    Notice getNoticeByApprovalId(String lcxmId);

    void deleteBySpLcxmbId(String id);

}