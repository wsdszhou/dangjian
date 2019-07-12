package com.glut.dangjian.mapper.news.view;

import java.util.List;

import com.glut.dangjian.entity.news.XwPlb;
import com.glut.dangjian.entity.news.view.ViewNewsComment;

public interface ViewNewsCommentMapper {
    int insert(ViewNewsComment record);

    int insertSelective(ViewNewsComment record);

    // 根据新闻id分页查询评论和回复数量
    List<ViewNewsComment> getNewsCommentByNewsId(String newsId);

    // 根据评论id获取评论视图
    ViewNewsComment getViewNewsCommentByCommentId(String commentId);

    // 根据noticeI的获取评论内容
    ViewNewsComment getViewNewsCommentByNoticeIId(String noticeId);

}