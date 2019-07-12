package com.glut.dangjian.service.other;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.news.view.ViewNews;
import com.glut.dangjian.entity.other.Sp;

/** 
* @author xulankong
* @date 创建时间:  2018年12月23日 上午10:37:57
* @version 1.0
*/
public interface VideoFrontService {

    // 分页查询网络党校视频列表
    PageInfo<Sp> getVideoPageList(Integer pageNum, Integer pageSize);

    // 获取视频
    Sp getSingleVideo(String videoId);

}
