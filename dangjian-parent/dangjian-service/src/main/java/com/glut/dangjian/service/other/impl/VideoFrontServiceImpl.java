package com.glut.dangjian.service.other.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.other.Sp;
import com.glut.dangjian.mapper.background.other.VideoMapper;
import com.glut.dangjian.service.other.VideoFrontService;

/** 
* @author xulankong
* @date 创建时间:  2018年12月23日 上午10:38:03
* @version 1.0
*/
@Service
@Transactional(propagation=Propagation.NESTED)
public class VideoFrontServiceImpl implements VideoFrontService{

    @Autowired
    private VideoMapper videoMapper;
    
    /**
     * 分页查询网络党校视频列表
     */
    @Override
    public  PageInfo<Sp> getVideoPageList(Integer pageNum, Integer pageSize) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<Sp> viewNews = videoMapper.getPageList();
        return new PageInfo<Sp>(viewNews);
    }

    /**
     * 获取视频
     */
    @Override
    public Sp getSingleVideo(String videoId) {
        
        return videoMapper.getSingleVideo(videoId);
    }

    
    

}
