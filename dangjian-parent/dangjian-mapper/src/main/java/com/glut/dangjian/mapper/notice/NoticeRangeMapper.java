package com.glut.dangjian.mapper.notice;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.notice.NoticeRange;

public interface NoticeRangeMapper {
    // 删除一条记录 
    int deleteById(Integer tzfwId);

    // 添加一条信息
    int insert(NoticeRange record);

    // 添加一信息，并且判断是否为空
    int insertSelective(NoticeRange record);

    // 根据主键查询信息
    NoticeRange selectById(Integer tzfwId);

     // 修改信息，并且判断是否为空
    int updateByIdSelective(NoticeRange record);

    // 修改信息
    int updateById(NoticeRange record);

    // 分页查询
    List<NoticeRange> getNoticeRangePageList(NoticeRange noticeRange);

    // 加载通知类型
    List<NoticeRange> loadNoticeRange(@Param("name")String name);
}