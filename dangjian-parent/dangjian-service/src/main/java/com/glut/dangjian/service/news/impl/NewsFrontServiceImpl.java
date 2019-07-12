package com.glut.dangjian.service.news.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.news.view.ViewNews;
import com.glut.dangjian.entity.other.Lmb;
import com.glut.dangjian.mapper.background.news.ColumnMapper;
import com.glut.dangjian.mapper.news.view.ViewNewsMapper;
import com.glut.dangjian.service.news.NewsFrontService;

/** 
* @author xulankong
* @date 创建时间:  2018年12月20日 上午11:02:12
* @version 1.0
*/
@Service
@Transactional(propagation=Propagation.NESTED)
public class NewsFrontServiceImpl implements NewsFrontService{

    @Autowired
    private ViewNewsMapper viewNewsMapper;
    
    @Autowired
    private ColumnMapper columnMapper;
    
    /**
     * 根据新闻id查询指定的新闻
     */
    @Override
    //@Cacheable(value="newsCache", key="'#p0'+'--'+'#root.methodName'"  )
    public ViewNews geSingletNewsByNewsId(String id) {
        
        return viewNewsMapper.geSingletNewsByNewsId(id);
    }

    /**
     * 根据新闻栏目id分页查询列表
     */
    @Override
    //@Cacheable(value="newsCache", key="'#p0'+'--'+'#p1'+'--'+'#p2'+'#root.methodName'"  )
    public PageInfo<ViewNews> getPageListByColumnId(Integer pageNum, Integer pageSize, Integer id) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<ViewNews> viewNews = viewNewsMapper.getPageListByColumnId(id);
        return new PageInfo<ViewNews>(viewNews);
    }

    /**
     * 根据新闻栏目id搜索分页查询列表
     */
    @Override
    @Cacheable(value="newsCache", key="'#p0'+'--'+'#p1'+'--'+'#p2'+'--'+'#p3'+'--'+'#root.methodName'"  )
    public PageInfo<ViewNews> getSearchPageListByColumnidAndNewstitle(Integer pageNum, Integer pageSize, 
            Integer id, String newsTitle) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<ViewNews> viewNews = viewNewsMapper.getSearchPageListByColumnidAndNewstitle(id, newsTitle);
        return new PageInfo<ViewNews>(viewNews);
    }

    /**
     * 全局搜索新闻分页查询列表
     */
    @Override
    @Cacheable(value="newsCache", key="'#p0'+'#root.methodName'+'--'+'#p1'+'--'+'#p2'+'--'"  )
    public PageInfo<ViewNews> getEntireSearchPageListByNewstitle(Integer pageNum, Integer pageSize, String newsTitle) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<ViewNews> viewNews = viewNewsMapper.getEntireSearchPageListByNewstitle(newsTitle);
        return new PageInfo<ViewNews>(viewNews);
    }

    /**
     * 获取一级栏目
     */
    @Override    
    @Cacheable(value="columnCache", key="#root.methodName"  )
    public List<Lmb> getFirstColumn() {
        return columnMapper.getFirstLmbList();
    }

    /**
     * 获取二级栏目
     */
    @Override
    @Cacheable(value="columnCache", key="#root.methodName"  )
    public List<Lmb> getSecondColumn(Integer columnId) {
        return columnMapper.getChildrenLmbListByFid(columnId);
    }

    /**
     * 根据通知id查询指定的新闻
     */
    @Override
    public ViewNews geSingletNewsByNoticeId(String noticeId) {
        // TODO Auto-generated method stub
        return viewNewsMapper.geSingletNewsByNoticeId(noticeId);
    }

}
