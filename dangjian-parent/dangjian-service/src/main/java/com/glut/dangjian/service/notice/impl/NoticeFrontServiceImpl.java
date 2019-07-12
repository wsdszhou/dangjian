package com.glut.dangjian.service.notice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.config.ApprovalTypeConfig;
import com.glut.dangjian.entity.news.view.ViewNews;
import com.glut.dangjian.entity.notice.view.ViewNotice;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewYhxx;
import com.glut.dangjian.mapper.notice.view.ViewNoticeCommonMapper;
import com.glut.dangjian.mapper.notice.view.ViewNoticeMapper;
import com.glut.dangjian.mapper.system.view.ViewYhxxMapper;
import com.glut.dangjian.service.notice.NoticeFrontService;

/** 
* @author xulankong
* @date 创建时间:  2018年12月23日 上午11:01:44
* @version 1.0
*/
@Service
@Transactional(propagation=Propagation.NESTED)
public class NoticeFrontServiceImpl implements NoticeFrontService{

    @Autowired
    private ViewNoticeMapper viewNoticeMapper;
    
    @Autowired
    private ViewYhxxMapper viewYhxxMapper;
    

    @Autowired
    private ViewNoticeCommonMapper viewNoticeCommonMapper;
    
    /**
     * 获取通知数量
     */
    @Override
    public Integer getNoticeNum(Yhb yhb) {
        ViewYhxx viewYhxx = viewYhxxMapper.getViewYhxxByUserId(yhb.getUserId());
        return viewNoticeMapper.getNoticeNum(viewYhxx, ApprovalTypeConfig.ENDAPPROVAL);
    }

    /**
     * 获取公告列表
     */
    @Override
    public PageInfo<ViewNotice> getNotice(Integer pageNum, Integer pageSize, Yhb yhb) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<ViewNotice> viewNews = viewNoticeCommonMapper.getNoticePageList(new ViewYhxx(yhb.getUserId()), ApprovalTypeConfig.ENDAPPROVAL);
        return new PageInfo<ViewNotice>(viewNews);
    }

    /**
     * 获取公告详细信息
     */
    @Override
    public ViewNotice getNoticeInfoByNoticeId(String noticeId) {
        
        return viewNoticeCommonMapper.getNoticeInfoByNoticeId(noticeId);
    }

    /**
     * 获取通知列表
     */
    @Override
    public PageInfo<ViewNotice> getNotice(Integer pageNum, Integer pageSize, Yhb yhb, String approvalType, String approvalTypeTwo) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<ViewNotice> viewNews = viewNoticeMapper.getNoticeByUserIdAndApprovaltype(yhb.getUserId(), approvalType, approvalTypeTwo);
        return new PageInfo<ViewNotice>(viewNews);
    }

}
