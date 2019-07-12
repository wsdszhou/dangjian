package com.glut.dangjian.service.news;
/** 
* @author xulankong
* @date 创建时间:  2018年12月21日 下午4:10:35
* @version 1.0
*/
public interface NewsPraiseFrontService {

    // 新闻点赞
    boolean newsPraise(String newsId, String userId);

    // 新闻评论点赞
    boolean commentPraise(String commentId, String userId);

    // 获取新闻点赞数量
    Integer getNewsPraiseNum(String newsId);

    // 是否已经点赞
    boolean newsIsPraise(String newsId, String userId);


}
