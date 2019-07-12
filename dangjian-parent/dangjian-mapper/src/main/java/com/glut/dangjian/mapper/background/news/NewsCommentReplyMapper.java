package com.glut.dangjian.mapper.background.news;

import com.glut.dangjian.entity.news.XwPlHf;

public interface NewsCommentReplyMapper {
    
    // 保存一条评论
    int insert(XwPlHf record);

    // 保存一条评论
    int insertSelective(XwPlHf record);

    // 根据id查询
    XwPlHf selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(XwPlHf record);

    int updateByPrimaryKey(XwPlHf record);

    // 删除一条文章评论的回复
    void deleteCommentReply(String id);

    // 删除一条文章评论的回复的回复
    void deleteCommentReplyAgain(String id);
}