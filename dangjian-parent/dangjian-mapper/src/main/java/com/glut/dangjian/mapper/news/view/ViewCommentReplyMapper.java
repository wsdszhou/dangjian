package com.glut.dangjian.mapper.news.view;

import java.util.List;

import com.glut.dangjian.entity.news.view.ViewCommentReply;

public interface ViewCommentReplyMapper {
    int insert(ViewCommentReply record);

    int insertSelective(ViewCommentReply record);

    // 获取回复评论，根据评论id分页查询
    List<ViewCommentReply> getReplyCommentByCommentId(String commentId);
}