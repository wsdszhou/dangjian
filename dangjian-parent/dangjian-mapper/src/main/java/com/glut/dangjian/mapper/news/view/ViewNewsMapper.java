package com.glut.dangjian.mapper.news.view;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.news.view.ViewNews;

public interface ViewNewsMapper {
    int insert(ViewNews record);

    int insertSelective(ViewNews record);

    //根据新闻id查询指定的新闻
    ViewNews geSingletNewsByNewsId(String id);

    // 根据新闻栏目id分页查询列表
    List<ViewNews> getPageListByColumnId(Integer columnId);

    // 根据新闻栏目id搜索分页查询列表
    List<ViewNews> getSearchPageListByColumnidAndNewstitle(@Param("columnId") Integer columnId, 
            @Param("newsTitle") String newsTitle);

    // 全局搜索新闻分页查询列表
    List<ViewNews> getEntireSearchPageListByNewstitle(String newsTitle);

    // 根据通知id查询指定的新闻
    ViewNews geSingletNewsByNoticeId(String noticeId);
}