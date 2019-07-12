package com.glut.dangjian.service.news.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.approval.service.ApprovalProjectService;
import com.glut.dangjian.config.ApprovalTypeConfig;
import com.glut.dangjian.entity.approval.SpLcxmb;
import com.glut.dangjian.entity.approval.SpSpjdb;
import com.glut.dangjian.entity.approval.SpSplcb;
import com.glut.dangjian.entity.approval.view.ViewApprovalNode;
import com.glut.dangjian.entity.news.XwPlHf;
import com.glut.dangjian.entity.news.XwPlb;
import com.glut.dangjian.entity.news.XwPldzb;
import com.glut.dangjian.entity.news.view.ViewCommentReply;
import com.glut.dangjian.entity.news.view.ViewNewsComment;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.mapper.approval.view.ViewApprovalNodeMapper;
import com.glut.dangjian.mapper.background.news.NewsCommentMapper;
import com.glut.dangjian.mapper.background.news.NewsCommentReplyMapper;
import com.glut.dangjian.mapper.news.view.ViewCommentReplyMapper;
import com.glut.dangjian.mapper.news.view.ViewNewsCommentMapper;
import com.glut.dangjian.service.news.NewsCommentFrontService;
import com.glut.dangjian.utils.StringTools;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/** 
* @author xulankong
* @date 创建时间:  2018年12月20日 下午6:54:16
* @version 1.0
*/
@Service
@Transactional(propagation=Propagation.NESTED)
public class NewsCommentFrontServiceImpl implements NewsCommentFrontService{

    @Autowired
    private ViewNewsCommentMapper viewNewsCommentMapper;
    
    @Autowired NewsCommentMapper newsCommentMapper;
    
    @Autowired
    private ViewApprovalNodeMapper  viewApprovalNodeMapper;
    
    @Autowired
    private ApprovalProjectService approvalProjectService;
    
    /**
     * 根据新闻id分页查询评论和回复数量
     */
    @Override
    public PageInfo<ViewNewsComment> getNewsCommentByNewsId(Integer pageNum, Integer pageSize, String newsId) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<ViewNewsComment> viewNewsComments = viewNewsCommentMapper.getNewsCommentByNewsId(newsId);
        return new PageInfo<ViewNewsComment>(viewNewsComments);
    }
    
    /**
     * 添加一条评论
     */
    @Override
    public void saveComment(XwPlb xwPlb, Yhb user) {
        
        xwPlb.setId(StringTools.getUUID());
        xwPlb.setSj(new Date());
        xwPlb.setFlag(0);
        xwPlb.setYhdm(user.getUserId());
        // 提交审批
        // 封装审批项目对象
        SpLcxmb spLcxmb =  new SpLcxmb(
                StringTools.getUUID(), 
                ApprovalTypeConfig.NEWSCOMMENTAPPROVAL, 
                new SpSplcb(9),
                xwPlb.getZw(), 
                null,  
                0,  // 当前审批状态
                0,  // 当前审批结果
                new Date(),
                xwPlb.getId()   // 审批对象id
                );
        /**
         * 使用yhb中的yhxxid来存放新闻的ID，fuck 思维
         */
        user.setUserYhxxdm(xwPlb.getXwdm());
        /**
         * 现在要找一个属性存放 新闻精选评论流程的ID fuck egg
         */

        // 添加通知审批
        approvalProjectService.addNewsCommenetApprovalProject(spLcxmb, user);

        XwPldzb xwPldzb = new XwPldzb(StringTools.getUUID(), xwPlb.getId(), null);
        newsCommentMapper.insertSelective(xwPlb, xwPldzb);
    }
    
    /**
     * 删除一条文章评论
     */
    @Override
    public void deleteNewsComment(XwPlb xwPlb) {
        
        newsCommentMapper.deleteByPrimaryKey(xwPlb.getId());
    }

    /**
     * 获取评论视图
     */
    @Override
    public ViewNewsComment getViewNewsComment(String commentId) {
        
        return viewNewsCommentMapper.getViewNewsCommentByCommentId(commentId);
    }

}
