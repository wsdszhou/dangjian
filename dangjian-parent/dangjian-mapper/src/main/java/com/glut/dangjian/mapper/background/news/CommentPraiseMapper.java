package com.glut.dangjian.mapper.background.news;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.news.XwPldzb;

public interface CommentPraiseMapper {
    int deleteByPrimaryKey(String pldzId);

    int insert(XwPldzb record);

    int insertSelective(XwPldzb record);

    XwPldzb selectByPrimaryKey(String pldzId);

    int updateByPrimaryKeySelective(XwPldzb record);

    int updateByPrimaryKey(XwPldzb record);

    String getCommentPraiseByCommentidAnuserid(@Param("commentId")String commentId, @Param("userId")String userId);
}