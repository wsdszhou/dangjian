package com.glut.dangjian.mapper.background.news;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.approval.view.ViewApprovalProjectProcessNode;
import com.glut.dangjian.entity.news.Xwb;
import com.glut.dangjian.entity.notice.NoticeObject;
import com.glut.dangjian.entity.other.Lmb;
import com.glut.dangjian.entity.user.Yhb;

/**
 * 新闻mapper
 * @author XuLanKong
 *
 */
public interface NewsMapper {

    // 获取栏目列表
    public List<Lmb> getLmbList();

    // 获取新闻的标题和id
    public List<Xwb> getNewsTitleAndIdListByLmId(Integer lmId);

    // 获取所有的新闻列表
    public List<Xwb> getNewsAllTitleAndIdList();
    
    // 插入一条新闻
    public int insert(Xwb record);

    // 插入一条新闻, 判断是否为空
    public int insertIfNot(Xwb record);

    // 分页查询新闻列表 
    public List<Xwb> getNewsPageList(Xwb xwb);

    //  修改新闻
    public void updateNews(Xwb xwb);

    // 根据新闻id删除新闻
    public void deleteNewsById(@Param("ids")String[] ids);

    // 开启评论
    public void openCommentByNewId(String newId);

    // 关闭评论
    public void closeComment(String newId);

    // 根据id获取新闻对
    public Xwb getNewsById(String id);

    public  List<NoticeObject> isApproval(String xwId);

    //  通过通知id获取新闻对象
    public Xwb getNewsByNoticeId(String id);

    public String getFbrIdByNewsId(String newsId);

    public String getFbrIdByCommentId(String commentId);

}
