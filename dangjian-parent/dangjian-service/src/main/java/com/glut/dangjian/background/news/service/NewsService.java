package com.glut.dangjian.background.news.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.approval.view.ViewApprovalProjectProcessNode;
import com.glut.dangjian.entity.news.Xwb;
import com.glut.dangjian.entity.news.view.ViewNews;
import com.glut.dangjian.entity.news.view.ViewNewsComment;
import com.glut.dangjian.entity.notice.NoticeObject;
import com.glut.dangjian.entity.user.Yhb;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/7/29
 * Time: 下午12:13
 */

public interface NewsService {

    /**
     * 根据栏目id获取指定的新闻列表
     */
    public List<Xwb> getNewsTitleAndIdListByLmId(Integer lmId);

    /**
     * 获取所有的新闻列表
     */
    public List<Xwb> getNewsAllTitleAndIdList();

    /**
     * 分页查询新闻列表
     * @param pageNum  当前页
     * @param pageSize 每页显示多条数据
     * @param viewXwZtDzPlLm 新闻视图对象，用户模糊查询
     * @return
     */
    public PageInfo<Xwb> getNewsPageList(Integer pageNum, Integer pageSize, Xwb xwb);

    /**
     * 添加新闻
     * @param xwb
     * @param pictureIds
     */
    public void saveNews(Xwb xwb, String pictureIds, String otherFiles, Yhb yhb);

    /**
     * 修改新闻
     * @param xwb
     * @param pictureIds
     */
    public void updateNews(Xwb xwb,Yhb yhb, String pictureId);

    /**
     * 批量删除新闻
     * @param newsIds
     */
    public void deleteNewsBatch(HttpServletRequest request, String[] newsIds);

    // 开启评论
    public void openCommentByNewId(String newId);

    // 关闭评论
    public void closeComment(String newId);

    //根据id获取新闻对
    public Xwb getNewsById(String id);

    public  List<NoticeObject> isApproval(String xwId);

    // 通过通知id获取新闻对象
    public Xwb getNewsByNoticeId(String id);

    // 检查是否已经审批了
    public int getJudeIsApprovalByNoticeId(String noticeId, String userId);

    // 审批结束回调
    public void approvalEnd(Xwb xwb);

    // 获取新闻评论
    public ViewNewsComment getViewNewsComment(String commentId);

    // 根据noticeI的获取评论内容
    public ViewNewsComment getViewNewsCommentByNoticeIId(String noticeId);

}
