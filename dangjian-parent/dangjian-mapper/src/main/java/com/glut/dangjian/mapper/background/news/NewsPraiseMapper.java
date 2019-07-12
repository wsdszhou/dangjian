package com.glut.dangjian.mapper.background.news;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.news.XwDzb;

public interface NewsPraiseMapper {
    int deleteByPrimaryKey(String dzId);

    int insert(XwDzb record);

    int insertSelective(XwDzb record);

    XwDzb selectByPrimaryKey(String dzId);

    int updateByPrimaryKeySelective(XwDzb record);

    int updateByPrimaryKey(XwDzb record);

    // 根据新闻id和用户id获取新闻评论对象
    String getNewsPraiseByNewsidAnuserid(@Param("newsId")String newsId, @Param("userId")String userId);

    // 获取新闻点赞数量
    Integer getNewsPraiseNum(String newsId);
}