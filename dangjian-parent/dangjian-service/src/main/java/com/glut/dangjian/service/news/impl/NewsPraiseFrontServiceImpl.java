package com.glut.dangjian.service.news.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.glut.dangjian.entity.news.XwDzb;
import com.glut.dangjian.entity.news.XwPldzb;
import com.glut.dangjian.mapper.background.news.CommentPraiseMapper;
import com.glut.dangjian.mapper.background.news.NewsPraiseMapper;
import com.glut.dangjian.service.news.NewsPraiseFrontService;
import com.glut.dangjian.utils.StringTools;

/** 
* @author xulankong
* @date 创建时间:  2018年12月21日 下午4:10:43
* @version 1.0
*/
@Service
@Transactional(propagation=Propagation.NESTED)
public class NewsPraiseFrontServiceImpl implements NewsPraiseFrontService{

    @Autowired
    private NewsPraiseMapper newsPraiseMapper;
    
    @Autowired
    private CommentPraiseMapper commentPraiseMapper;
     
    /**
     * 新闻新闻点赞
     */
    @Override
    public boolean newsPraise(String newsId, String userId) {
        String newsPraiseId= newsPraiseMapper.getNewsPraiseByNewsidAnuserid(newsId, userId);
        if (newsPraiseId == null || newsPraiseId.equals("")) {
            newsPraiseMapper.insertSelective(new XwDzb(StringTools.getUUID(), newsId, userId));
            return true; 
        } else {
          return false;  
        }
    }

    /**
     * 新闻评论点赞
     */
    @Override
    public boolean commentPraise(String commentId, String userId) {
        String praiseId = commentPraiseMapper.getCommentPraiseByCommentidAnuserid(commentId, userId);
        if (praiseId == null || praiseId.equals("")) {
            commentPraiseMapper.insertSelective(new XwPldzb(StringTools.getUUID(),  commentId, userId));
            return true; 
        } else {
          return false;  
        }
    }

    /**
     * 新闻是否已经点赞过
     */
    @Override
    public boolean newsIsPraise(String newsId, String userId) {
        String praiseId = newsPraiseMapper.getNewsPraiseByNewsidAnuserid(newsId, userId);
        if (praiseId == null || praiseId.equals("")) {
            return false;
        }else {
            return true;
        }
    }
    
    /**
     *  获取新闻点赞数量
     */
    @Override
    public Integer getNewsPraiseNum(String newsId) {
        
        return newsPraiseMapper.getNewsPraiseNum(newsId);
    }



}
