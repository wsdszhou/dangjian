package com.glut.dangjian.background.notice.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.notice.service.NoticeObjectService;
import com.glut.dangjian.config.ApprovalTypeConfig;
import com.glut.dangjian.entity.notice.view.ViewNotice;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewYhxx;
import com.glut.dangjian.mapper.notice.NoticeObjectMapper;
import com.glut.dangjian.mapper.notice.view.ViewNoticeCommonMapper;
import com.glut.dangjian.mapper.notice.view.ViewNoticeMapper;
import com.glut.dangjian.mapper.system.view.ViewYhxxMapper;

/** 
* @author xulankong
* @date 创建时间:  2018年11月27日 下午2:49:08
* @version 1.0
*/
@Service
@Transactional(propagation=Propagation.NESTED)
public class NoticeObjectServiceImpl implements NoticeObjectService{

    @Autowired
    private ViewNoticeMapper viewNoticeMapper;
    
    @Autowired
    private ViewYhxxMapper viewYhxxMapper;
    
    @Autowired
    private NoticeObjectMapper noticeObjectMapper;
    
    @Autowired
    private ViewNoticeCommonMapper viewNoticeCommonMapper;

    /**
     * 查询有关于与自己所有的通知
     */
    @Override
    public PageInfo<ViewNotice> getSelfNoticePageList(Integer pageNum, Integer pageSize, Yhb yhb, ViewNotice viewNotice) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<ViewNotice> viewNotices = viewNoticeMapper.getSelfNoticePageList(yhb, viewNotice);
        return new PageInfo<ViewNotice>(viewNotices);
    }

    /**
     * 查询公告
     */
    @Override
    public PageInfo<ViewNotice> getNoticePageList(Integer pageNum, Integer pageSize, Yhb yhb) {
        
        ViewYhxx viewYhxx = viewYhxxMapper.getViewYhxxByUserId(yhb.getUserId());
        PageHelper.startPage(pageNum, pageSize);
        List<ViewNotice> viewNotices = viewNoticeCommonMapper.getNoticePageList(viewYhxx, ApprovalTypeConfig.ENDAPPROVAL);
        return new PageInfo<ViewNotice>(viewNotices);
    }

    /**
     * 通过通知id获取通知视图
     */
    @Override
    public ViewNotice getViewNoticeByNoticeId(String noticeId) {
        
        return viewNoticeMapper.getViewNoticeByNoticeId(noticeId);
    }

    @Override
    public void readNotice(String noticeId) {
        noticeObjectMapper.readNotice(noticeId,  new Date());
    }
    
    
}
