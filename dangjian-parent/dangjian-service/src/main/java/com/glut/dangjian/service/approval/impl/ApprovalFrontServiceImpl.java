package com.glut.dangjian.service.approval.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.approval.service.ApprovalProjectService;
import com.glut.dangjian.entity.approval.SpLcxmb;
import com.glut.dangjian.entity.news.view.ViewNewsComment;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.mapper.approval.ApprovalProcessProjectMapper;
import com.glut.dangjian.pojo.ApprovalResult;
import com.glut.dangjian.service.approval.ApprovalFrontService;

/** 
* @author xulankong
* @date 创建时间:  2018年12月21日 下午5:14:49
* @version 1.0
*/
@Service
@Transactional(propagation=Propagation.NESTED)
public class ApprovalFrontServiceImpl implements ApprovalFrontService{

    @Autowired
    private ApprovalProjectService approvalProjectService;
    
    @Autowired
    private ApprovalProcessProjectMapper approvalProjectMapper;
    
    /**
     * 不同党籍审批
     */
    @Override
    public ApprovalResult disAgreePartyApprovalByNotice(String noticeId, Yhb yhb) {
        String partyId = approvalProjectMapper.getApprovalObjectIdByNoticeId(noticeId);
        approvalProjectService.disagreeApproval(partyId, yhb);
        return new ApprovalResult(1, partyId);
    }

    /**
     * 同意党籍审批
     */
    @Override
    public ApprovalResult agreePartyApprovalByNotice(String noticeId, Yhb yhb) {
        String partyId = approvalProjectMapper.getApprovalObjectIdByNoticeId(noticeId);
        Integer result =  approvalProjectService.agreeApproval(partyId, yhb);
        return new ApprovalResult(result, partyId);
    }

    /**
     * 不同新闻评论审批
     */
    @Override
    public ApprovalResult disagreeApprovalCommentApprovalByNotice(String noticeId, Yhb yhb) {
        
        // 获取审批对象id==新闻评论Id
        String commentId = approvalProjectMapper.getApprovalObjectIdByNoticeId(noticeId);
        approvalProjectService.commentDisagree(commentId, yhb);
        return new ApprovalResult(1, commentId);
    }

    /**
     * 同意新闻评论审批
     */
    @Override
    public ApprovalResult agreeNewsCommentApprovalByNotice(String noticeId, Yhb yhb) {
        String commentId = approvalProjectMapper.getApprovalObjectIdByNoticeId(noticeId);
        approvalProjectService.commentAgree(commentId, yhb);
        return new ApprovalResult(1, commentId);
    }

    @Override
    public ApprovalResult disagreeApprovalByNotice(String noticeId, Yhb yhb) {
        String newsId = approvalProjectMapper.getApprovalObjectIdByNoticeId(noticeId);
        approvalProjectService.disagreeApproval(newsId, yhb);
        return new ApprovalResult(1, newsId);
    }

    /**
     * 同意新闻审批
     */
    @Override
    public ApprovalResult agreeNewsApprovalByNotice(String noticeId, Yhb yhb) {
        
        String newsId = approvalProjectMapper.getApprovalObjectIdByNoticeId(noticeId);
        Integer result =  approvalProjectService.agreeApproval(newsId, yhb);
        return new ApprovalResult(result, newsId);
    }

    /**
     * 获取审批数量
     */
    @Override
    public Integer getApprovalNum(Yhb yhb) {
        // TODO Auto-generated method stub
        return approvalProjectMapper.getApprovalNumByUserId(yhb.getUserId());
    }

    
    
   
}
