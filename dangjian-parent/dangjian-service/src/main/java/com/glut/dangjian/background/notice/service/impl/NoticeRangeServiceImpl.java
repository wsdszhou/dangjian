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
import com.glut.dangjian.background.notice.service.NoticeRangeService;
import com.glut.dangjian.entity.notice.NoticeRange;
import com.glut.dangjian.mapper.notice.NoticeRangeMapper;

@Service("noticeRangeService")
@Transactional(propagation=Propagation.NESTED)
public class NoticeRangeServiceImpl implements NoticeRangeService {

    @Autowired
    private NoticeRangeMapper noticeRangeMapper;
    
    /**
     * 分页查询
     */
    @Override
    public PageInfo<NoticeRange> getNoticeRangePageList(Integer pageNum, Integer pageSize, NoticeRange noticeRange) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<NoticeRange> noticeRanges = noticeRangeMapper.getNoticeRangePageList(noticeRange);
        return new PageInfo<NoticeRange>(noticeRanges);
    }

    /**
     * 添加通知范围
     */
    @Override
    @CacheEvict(value="noticeRangeCache", allEntries=true)
    public void addNoticeRange(NoticeRange noticeRange) {
        
        noticeRangeMapper.insertSelective(noticeRange);
    }

    /**
     * 修改通知范围
     */
    @Override
    @CacheEvict(value="noticeRangeCache", allEntries=true)
    public void updateNoticeRange(NoticeRange noticeRange) {
        
        noticeRangeMapper.updateByIdSelective(noticeRange);
    }

    /**
     * 批量删除通知范围
     */
    @Override
    @CacheEvict(value="noticeRangeCache", allEntries=true)
    public void deleteNoticRangeeBatch(String[] noticeRangeId) {
        
        for(String id : noticeRangeId) {
            noticeRangeMapper.deleteById(Integer.parseInt(id));
        }
    }

    /**
     * 加载通知类型
     */
    @Override
    //@Cacheable(value="noticeRangeCache", key="'#root.methodName'+'#p0'"  )
    public List<NoticeRange> loadNoticeRange(String name) {
        return noticeRangeMapper.loadNoticeRange(name);
    }

}
