package com.glut.dangjian.background.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.notice.service.NoticeService;
import com.glut.dangjian.entity.branch.Zbb;
import com.glut.dangjian.entity.department.Bmb;
import com.glut.dangjian.entity.notice.Notice;
import com.glut.dangjian.entity.notice.NoticeObject;
import com.glut.dangjian.entity.notice.view.ViewMyselfNotice;
import com.glut.dangjian.mapper.notice.NoticeMapper;
import com.glut.dangjian.mapper.notice.NoticeObjectMapper;
import com.glut.dangjian.mapper.notice.view.ViewMyselfNoticeMapper;
import com.glut.dangjian.mapper.notice.view.ViewNoticeMapper;
import com.glut.dangjian.mapper.system.view.ViewYhxxMapper;
import com.glut.dangjian.utils.StringTools;

@Service("schoolNoticeService")
@Transactional(propagation=Propagation.NESTED)
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;
    
    @Autowired
    private ViewYhxxMapper viewYhxxMapper;
    
    @Autowired
    private NoticeObjectMapper noticeObjectMapper;
    
    @Autowired
    private ViewMyselfNoticeMapper viewMyselfNoticeMapper;
    
    /**
     * 分页查询学校通知
     */
    @Override
    public PageInfo<Notice> getNoticePageList(Integer pageNum, Integer pageSize, Notice notice) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<Notice> notices = noticeMapper.getNoticePageList(notice);
        return new PageInfo<Notice>(notices);
    }

    /**
     * 添加学校通知
     */
    @Override
    @CacheEvict(value="noticeObjectCache", allEntries=true)
    public void addNotice(Notice notice) {
        // 维护notice对象
        notice.setTzId(StringTools.getUUID());
        // 维护noticeObject对象
        NoticeObject noticeObject = new NoticeObject();
        noticeObject.setTzdxId(StringTools.getUUID());
        noticeObject.setTzdxTzdm(notice);
        // 保存通知对象
        noticeObjectMapper.addNotice(notice, noticeObject);
    }

    /**
     * 修改通知信息
     */
    @Override
    @CacheEvict(value="noticeObjectCache", allEntries=true)
    public void updateNotice(Notice notice) {
        
        noticeMapper.updateByIdSelective(notice);
    }

    /**
     * 批量删除通知
     */
    @Override
    @CacheEvict(value="noticeObjectCache", allEntries=true)
    public void deleteNoticeBatch(String[] noticeIds) {
        
        for(String id : noticeIds ) {
            System.err.println(id);
            noticeObjectMapper.deleteByNoticeId(id);
            noticeMapper.deleteById(id);
        }
    }

    /**
     * 添加学院通知
     */
    @Override
    @CacheEvict(value="noticeObjectCache", allEntries=true)
    public void addAcademyNotice(Notice notice) {
        // 维护notice对象
        String name =  viewYhxxMapper.getYhxxNameByUserId(notice.getTzFbrdm().getUserId());
        notice.setTzFbrmc(name);
        notice.setTzId(StringTools.getUUID());
        // 维护noticeObject对象
        Integer bmId =  viewYhxxMapper.getBmIdByUserId(notice.getTzFbrdm().getUserId());
        NoticeObject noticeObject = new NoticeObject();
        noticeObject.setTzdxId(StringTools.getUUID());
        noticeObject.setTzdxTzdm(notice);
        noticeObject.setTzdxBmdm(new Bmb(bmId));
        // 保存notice对象
        noticeMapper.insert(notice);
        // 保存noticObject对象
        noticeObjectMapper.insertSelective(noticeObject);
    }

    /**
     * 添加支部通知
     */
    @Override
    @CacheEvict(value="noticeObjectCache", allEntries=true)
    public void addBranchNotice(Notice notice) {
        // 维护notice对象
        String name =  viewYhxxMapper.getYhxxNameByUserId(notice.getTzFbrdm().getUserId());
        notice.setTzFbrmc(name);
        notice.setTzId(StringTools.getUUID());
        // 维护noticeObject对象
        Integer zbId =  viewYhxxMapper.getZbIdByUserId(notice.getTzFbrdm().getUserId());
        NoticeObject noticeObject = new NoticeObject();
        noticeObject.setTzdxId(StringTools.getUUID());
        noticeObject.setTzdxTzdm(notice);
        noticeObject.setTzdxZbdm(new Zbb(zbId));
        // 保存notice对象
        noticeMapper.insert(notice);
        // 保存noticObject对象
        noticeObjectMapper.insertSelective(noticeObject);
        
    }

    /**
     * 分页查询个人的通知
     */
    @Override
    public PageInfo<ViewMyselfNotice> getMyselNoticePageList(Integer pageNum, Integer pageSize, ViewMyselfNotice viewMyselfNotice) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<ViewMyselfNotice> viewMyselfNotices = viewMyselfNoticeMapper.getMyselNoticePageList(viewMyselfNotice);
        return new PageInfo<ViewMyselfNotice>(viewMyselfNotices);
    }

    /**
     * 添加个人通知接口
     */
    @Override
    @CacheEvict(value="noticeObjectCache", allEntries=true)
    public void addMyselfNotice(ViewMyselfNotice viewMyselfNotice) {
        viewMyselfNoticeMapper.insertSelective(viewMyselfNotice);
    }


}
