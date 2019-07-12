package com.glut.dangjian.background.approval.service.impl;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.glut.dangjian.entity.news.Xwb;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.approval.service.ApprovalProjectService;
import com.glut.dangjian.config.ApprovalTypeConfig;
import com.glut.dangjian.config.NoticeRangConfig;
import com.glut.dangjian.entity.approval.SpLcxmb;
import com.glut.dangjian.entity.approval.SpSpjdb;
import com.glut.dangjian.entity.approval.view.ViewApprovalJobUser;
import com.glut.dangjian.entity.approval.view.ViewApprovalProjectProcessNode;
import com.glut.dangjian.entity.news.XwPlb;
import com.glut.dangjian.entity.notice.Notice;
import com.glut.dangjian.entity.notice.NoticeObject;
import com.glut.dangjian.entity.notice.NoticeRange;
import com.glut.dangjian.entity.user.YhXxb;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewYhxx;
import com.glut.dangjian.mapper.approval.ApprovalNodeMapper;
import com.glut.dangjian.mapper.approval.ApprovalProcessProjectMapper;
import com.glut.dangjian.mapper.approval.view.ViewApprovalJobUserMapper;
import com.glut.dangjian.mapper.approval.view.ViewApprovalProjectProcessNodeMapper;
import com.glut.dangjian.mapper.background.news.NewsCommentMapper;
import com.glut.dangjian.mapper.background.news.NewsMapper;
import com.glut.dangjian.mapper.background.other.PartyInfoMapper;
import com.glut.dangjian.mapper.notice.NoticeMapper;
import com.glut.dangjian.mapper.notice.NoticeObjectMapper;
import com.glut.dangjian.utils.StringTools;

@Service("approvalProjectService")
@Transactional(propagation=Propagation.NESTED)
public class ApprovalProjectServiceImpl implements ApprovalProjectService{

    @Autowired
    private ApprovalProcessProjectMapper approvalProcessProjectMapper;
    
    @Autowired
    private ViewApprovalProjectProcessNodeMapper viewProjectMapper;
    
    @Autowired 
    ViewApprovalJobUserMapper viewApprovalJobUserMapper;
    
    @Autowired
    private NoticeMapper noticeMapper;
    
    @Autowired
    private ApprovalNodeMapper approvalNodeMapper;
    
    @Autowired
    private NoticeObjectMapper noticeObjectMapper;
    
    @Autowired
    private NewsMapper newsMapper;

    @Autowired
    private PartyInfoMapper partyInfoMapper;
    
    @Autowired
    private NewsCommentMapper newsCommentMapper;

    /**
     * 分页查询审批项目
     */
    @Override
    public PageInfo<ViewApprovalProjectProcessNode> getApprovalProjectPageList(Integer pageNum, Integer pageSize,
            ViewApprovalProjectProcessNode viewApprovalProjectProcessNode) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<ViewApprovalProjectProcessNode> list = viewProjectMapper.getApprovalProjectPageList(viewApprovalProjectProcessNode);
        PageInfo<ViewApprovalProjectProcessNode> pageInfo = new PageInfo<ViewApprovalProjectProcessNode>(list);
        return pageInfo;
    }

    /**
     * 批量删除审批项目    
     */
    @Override
    public void deleteApprovalProjectBatch(String[] projectIds) {
        approvalProcessProjectMapper.deleteBatchById(projectIds);
    }

    /**
     * 添加审批项目
     * spLcxmb: 流程项目对象
     * Yhb: 用户对象
     * String: 用户名称
     * priority 审批优先级
     */
    @Override
    @Transactional(propagation=Propagation.NESTED)
    public void addApprovalProject(SpLcxmb spLcxmb,Yhb yhb, String userName, Integer priority) {
        
        /**
         * 封装通知
         */
       Notice notice = new Notice(
                StringTools.getUUID(), 
                spLcxmb.getLcxmMc(), 
                spLcxmb.getLcxmXmms(), 
                new Date(), 
                new ViewYhxx(yhb.getUserId()), // 发布人
                userName, 
                new NoticeRange(1), // 个人通知, 
                priority, //通知优先级
                "个人通知",
                spLcxmb.getLcxmId());
        
        List<ViewApprovalJobUser> viewApprovalJobUsers = viewApprovalJobUserMapper.getListByApprovalNodeId(spLcxmb.getSplbDqjddm().getSpjdId(), yhb.getUserId());
        addIndividualNotice(notice, viewApprovalJobUsers, spLcxmb); //   添加个人审批通知
    }
    
    /**
     * 添加个人审批通知
     * @param notice
     * @param viewApprovalJobUsers
     * @param spLcxmb 
     */
    @Transactional(propagation=Propagation.NESTED)
    public void addIndividualNotice(Notice notice, List<ViewApprovalJobUser> viewApprovalJobUsers, SpLcxmb spLcxmb) {
        if (viewApprovalJobUsers != null) {
            for (ViewApprovalJobUser viewApprovalJobUser : viewApprovalJobUsers) {
                viewApprovalJobUser.setNoticeObjectId(StringTools.getUUID());
            }
        }
        noticeObjectMapper.insertBartchSelective(notice, viewApprovalJobUsers, spLcxmb);
    }

    /**
     * yhb: 用户对象
     * objectName :需要被审批对象所属用户姓名
     * priority：审批优先级
     * objectId：需要被审批对象id
     */
    @Override
    @Transactional(propagation=Propagation.NESTED)
    public void updateApprovalProject(SpLcxmb spLcxmb, Yhb yhb, String objectName, Integer objectYxj, String objectId) {
        
        /**
         * 维护通知
         */
        Notice notice = noticeMapper.getNoticeByApprovalId(spLcxmb.getLcxmId());
        notice.setTzBt( spLcxmb.getLcxmMc());
        notice.setTzNr(spLcxmb.getLcxmXmms());
        notice.setTzFbsj(new Date());
        notice.setTzYxj(objectYxj);
        
        List<ViewApprovalJobUser> viewApprovalJobUsers = viewApprovalJobUserMapper.getListByApprovalNodeId(spLcxmb.getSplbDqjddm().getSpjdId(), yhb.getUserId());
        updateIndividualNotice(notice, viewApprovalJobUsers, spLcxmb); //   添加个人审批通知
    }

    /**
     * 修改个人审批通知
     * @param notice
     * @param viewApprovalJobUsers
     * @param
     */
    @Transactional(propagation=Propagation.NESTED)
    public void updateIndividualNotice(Notice notice, List<ViewApprovalJobUser> viewApprovalJobUsers,
            SpLcxmb myGetspLcxmb) {
        for (ViewApprovalJobUser viewApprovalJobUser : viewApprovalJobUsers) {
            viewApprovalJobUser.setNoticeObjectId(StringTools.getUUID());
        }
        noticeObjectMapper.updateIndividualNoticeInsertBartchSelective(notice, viewApprovalJobUsers, myGetspLcxmb);
        
    }

    /**
     * 同意审批
     * 返回1表示审批结束，返回0代表未审批完成
     */
    @Override
    public int agreeApproval(String objectId,  Yhb yhb) {

        //获取下一个审批节点
        Integer nextApprovalNode = approvalNodeMapper.getNextApprovalNodeByOjbectId(objectId);
        SpLcxmb spLcxmb = approvalProcessProjectMapper.getApprovalProjectByObjectId(objectId);
        
        if (nextApprovalNode != null && nextApprovalNode != 0) {
            // 审批还没有完成，继续维护审批
            spLcxmb.setLcxmSplcdm(null);
            spLcxmb.setSplbXgsj(new Date());
            spLcxmb.setSplbDqjddm(new SpSpjdb(nextApprovalNode));
            agreeApprovalNotice(spLcxmb, yhb);
            return 0;
        }else {
            // 该项目的审批已经完成
            spLcxmb.setLcxmDxId(objectId);
            spLcxmb.setSplbXgsj(new Date());
            spLcxmb.setSplbResulte(1); // 1代表审批通过
            spLcxmb.setSplbDqspzt(1); // 1代表审批结束
            agreeApprovalNotice(spLcxmb, yhb);
            // 对审批结束进行维护，并反馈给提交人
            this.endAprrovalNotice(spLcxmb, yhb,1);
            return 1;
        }
    }
    
    /**
     * 对同意审批的通知信息进行维护
     * @param spLcxmb
     */
    private void agreeApprovalNotice(SpLcxmb spLcxmb, Yhb yhb) {
        
        List<ViewApprovalJobUser> viewApprovalJobUsers = null; 
        if (spLcxmb.getSplbDqjddm() != null) {
            viewApprovalJobUsers = viewApprovalJobUserMapper.getListByApprovalNodeId(spLcxmb.getSplbDqjddm().getSpjdId(), yhb.getUserId());
        }         
        NoticeObject noticeObject = new NoticeObject();
        if (viewApprovalJobUsers != null) {
            for (ViewApprovalJobUser viewApprovalJobUser : viewApprovalJobUsers) {
                viewApprovalJobUser.setNoticeObjectId(StringTools.getUUID());
            }
        }
        /**
         * 封装通知
         */
        Notice notice = noticeMapper.getNoticeByApprovalId(spLcxmb.getLcxmId());
        if ( spLcxmb.getSplbDqspzt() != null && spLcxmb.getSplbDqspzt() == 1) {
            notice.setTzJssj(new Date());
        }
        approvalProcessProjectMapper.updateByIdSelective(spLcxmb);

        noticeObjectMapper.agreeApprovalNotice(spLcxmb, viewApprovalJobUsers, noticeObject, notice, yhb);
    }

    /**
     * 审批不通过
     */
    @Override
    public void disagreeApproval(String objectId,  Yhb yhb) {

        SpLcxmb spLcxmb = approvalProcessProjectMapper.getApprovalProjectByObjectId(objectId);
        List<NoticeObject> noticeObjects = noticeObjectMapper.getNoticeObjectListByApprovalId(spLcxmb.getLcxmId());
        spLcxmb.setSplbXgsj(new Date());
        spLcxmb.setSplbResulte(0); // 0代表代表审批不通过
        spLcxmb.setSplbDqspzt(1); // 1代表审批结束
        noticeObjectMapper.disagreeNews(spLcxmb, noticeObjects, yhb);
        // 对审批结束进行维护，并反馈给提交人
        this.endAprrovalNotice(spLcxmb, yhb,0);
    }
    
    /**
     * 审批结束后反馈给提交人
     */
    protected void endAprrovalNotice(SpLcxmb spLcxmb , Yhb yhb, int state) {
        
        String  btzyhId = null;     
        // 维护通知表
        Notice notice = new Notice(StringTools.getUUID(), ApprovalTypeConfig.ENDAPPROVAL, 
                "您申请的" + spLcxmb.getLcxmMc() + "通过", new Date(),new ViewYhxx(yhb.getUserId()), 
                null, new NoticeRange(NoticeRangConfig.INDIVIDUAL), null, null, null);
        if (state==1) {
            notice.setTzNr("您申请的" + spLcxmb.getLcxmMc() + "通过");
        }else {
            notice.setTzNr("您申请的" + spLcxmb.getLcxmMc() + "未通过");
        }
        // 获取被通知对象id
       if (spLcxmb.getLcxmSplcdm().getSplcMc().equals(ApprovalTypeConfig.NEWSAPPROVAL)) {
           // 如果是新闻审批
           btzyhId = newsMapper.getFbrIdByNewsId(spLcxmb.getLcxmDxId());
       } else if (spLcxmb.getLcxmSplcdm().getSplcMc().equals(ApprovalTypeConfig.PARTINFOAPPROVAL)) {
           // 如果是党籍审批
           btzyhId = partyInfoMapper.getFbrIdByPartyinfoId(spLcxmb.getLcxmDxId());
       } else if ( spLcxmb.getLcxmSplcdm().getSplcMc().equals(ApprovalTypeConfig.NEWSCOMMENTAPPROVAL) ) {
           notice.setTzBt("留言通知");
           notice.setTzNr("您提交的评论已经通过");
           // 如果是党籍审批
           btzyhId = newsCommentMapper.getCommentuseridByCommentid(spLcxmb.getLcxmDxId());
       }
       // 维护通知对象
       NoticeObject noticeObject = new NoticeObject(StringTools.getUUID(), notice, 
                new Yhb(btzyhId), null, null, null, null);
       // 执行通知
       noticeObjectMapper.endAprrovalNotice(noticeObject);
        
    }

    /**
     * 不同意评论
     */
    @Override
    public String commentDisagree(String commentId, Yhb yhb) {
        
        SpLcxmb spLcxmb = approvalProcessProjectMapper.getApprovalProjectByObjectId(commentId);
        List<NoticeObject> noticeObjects = noticeObjectMapper.getNoticeObjectListByApprovalId(spLcxmb.getLcxmId());
        spLcxmb.setSplbXgsj(new Date());
        spLcxmb.setSplbResulte(0); // 0代表代表审批不通过
        spLcxmb.setSplbDqspzt(1); // 1代表审批结束
        noticeObjectMapper.disagreeNews(spLcxmb, noticeObjects, yhb);
        XwPlb xwPlb = new XwPlb();
        xwPlb.setId(commentId);
        xwPlb.setFlag(1);
        newsCommentMapper.updateByPrimaryKeySelective(xwPlb);
        return commentId;
    }

    /**
     * 同意评论
     */
    @Override
    public String commentAgree(String commentId, Yhb yhb) {
        
        SpLcxmb spLcxmb = approvalProcessProjectMapper.getApprovalProjectByObjectId(commentId);
        // 该项目的审批已经完成
        spLcxmb.setLcxmDxId(commentId);
        spLcxmb.setSplbXgsj(new Date());
        spLcxmb.setSplbResulte(1); // 1代表审批通过
        spLcxmb.setSplbDqspzt(1); // 1代表审批结束
        agreeApprovalNotice(spLcxmb, yhb);
        XwPlb xwPlb = new XwPlb();
        xwPlb.setId(commentId);
        xwPlb.setFlag(1);
        newsCommentMapper.updateByPrimaryKeySelective(xwPlb);
        // 对审批结束进行维护，并反馈给提交人
        this.endAprrovalNotice(spLcxmb, yhb,1);
        
        return commentId;
    }

    @Override
    public void addNewsCommenetApprovalProject(SpLcxmb spLcxmb,Yhb yhb) {
        /**
         * 封装通知
         */
       Notice notice = new Notice(
                StringTools.getUUID(), 
                spLcxmb.getLcxmMc(), 
                spLcxmb.getLcxmXmms(), 
                new Date(), 
                new ViewYhxx(yhb.getUserId()), // 发布人
                null, 
                new NoticeRange(1), // 个人通知, 
                0, //通知优先级
                "个人通知",
                spLcxmb.getLcxmId());
        
        List<ViewApprovalJobUser> viewApprovalJobUsers = new ArrayList<>();
        //获取新闻发布人ID
        String newsUserId = newsMapper.getFbrIdByNewsId(yhb.getUserYhxxdm());
        //Xwb xwb = newsMapper.getNewsById(yhb.getUserYhxxdm());
        viewApprovalJobUsers.add(new ViewApprovalJobUser(newsUserId));
        addIndividualNotice(notice, viewApprovalJobUsers, spLcxmb); //   添加个人审批通知
        
    }
    

}
