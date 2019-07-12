package com.glut.dangjian.service.news;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.news.XwPlHf;
import com.glut.dangjian.entity.news.XwPlb;
import com.glut.dangjian.entity.news.view.ViewCommentReply;
import com.glut.dangjian.entity.news.view.ViewNewsComment;
import com.glut.dangjian.entity.user.Yhb;

/** 
* @author xulankong
* @date 创建时间:  2018年12月20日 下午6:52:49
* @version 1.0
*/
public interface NewsCommentFrontService {

    // 根据新闻id分页查询评论和回复数量
    PageInfo<ViewNewsComment> getNewsCommentByNewsId(Integer pageNum, Integer pageSize, String newsId);

    // 添加一条评论
    void saveComment(XwPlb xwPlb, Yhb user);
    
    // 删除一条文章评论
    void deleteNewsComment(XwPlb xwPlb);

    // 获取评论
    ViewNewsComment getViewNewsComment(String commentId);

}
