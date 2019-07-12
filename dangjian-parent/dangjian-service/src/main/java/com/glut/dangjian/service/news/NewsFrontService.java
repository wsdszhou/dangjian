package com.glut.dangjian.service.news;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.news.view.ViewNews;
import com.glut.dangjian.entity.other.Lmb;

/** 
* @author xulankong
* @date 创建时间:  2018年12月20日 上午11:02:02
* @version 1.0
*/
public interface NewsFrontService {

    // 根据新闻id查询指定的新闻
    ViewNews geSingletNewsByNewsId(String id);

    // 根据新闻栏目id分页查询列表
    PageInfo<ViewNews> getPageListByColumnId(Integer pageNum, Integer pageSize, Integer id);

    // 根据新闻栏目id搜索分页查询列表
    PageInfo<ViewNews> getSearchPageListByColumnidAndNewstitle(Integer pageNum, Integer pageSize, Integer id,
            String newsTitle);

    // 全局搜索新闻分页查询列表
    PageInfo<ViewNews> getEntireSearchPageListByNewstitle(Integer pageNum, Integer pageSize, String newsTitle);

    // 获取一级栏目
    List<Lmb> getFirstColumn();

    // 获取二级栏目
    List<Lmb> getSecondColumn(Integer columnId);

    // 根据通知id查询指定的新闻
    ViewNews geSingletNewsByNoticeId(String noticeId);

}
