package com.glut.dangjian.controller.news;

import java.nio.charset.StandardCharsets;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.news.view.ViewNews;
import com.glut.dangjian.entity.other.Lmb;
import com.glut.dangjian.service.news.NewsFrontService;

/** 
* @author xulankong
* @date 创建时间:  2018年12月20日 上午9:13:07
* @version 1.0
*/
@RestController
@CrossOrigin(methods = {RequestMethod.POST,RequestMethod.GET, RequestMethod.DELETE, RequestMethod.PUT})
@RequestMapping(value="mobile/news/")
public class NewsFrontController {

    @Autowired
    private NewsFrontService newsFrontService;
    
    /**
     * 获取所有栏目
     * @return
     */
    @RequestMapping(value="getFirstColumn",method=RequestMethod.GET)
    public Result getFirstColumn() {
        List<Lmb> lmbs = newsFrontService.getFirstColumn();
        return new Result(0, null, lmbs);
    }
    
    /**
     * 获取所有栏目
     * @return
     */
    @RequestMapping(value="getSecondColumn/{columnId}",method=RequestMethod.GET)
    public Result getAllColumn( @PathVariable("columnId") Integer columnId) {
        List<Lmb> lmbs = newsFrontService.getSecondColumn(columnId);
        return new Result(0, null, lmbs);
    }
    
    /**
     * 根据通知id查询指定的新闻
     * @param
     * @return
     */
    @RequestMapping(value="geSingleNewsByNoticeId", method=RequestMethod.GET)
    public Result geSingletNewsByNoticeId( @RequestParam("noticeId") String noticeId ) {
        
        ViewNews viewNews = newsFrontService.geSingletNewsByNoticeId(noticeId);
        viewNews.setNewsContext(new String(viewNews.getXwZw(), StandardCharsets.UTF_8));
        viewNews.setXwZw(null);
        return new Result(0, null, viewNews);
    }
    
    /**
     * 根据新闻id查询指定的新闻
     * @param
     * @return
     */
    @RequestMapping(value="geSingletNewsByNewsId", method=RequestMethod.GET)
    public Result geSingletNewsByNewsId( @RequestParam("newId") String newId ) {
        
        ViewNews viewNews = newsFrontService.geSingletNewsByNewsId(newId);
        viewNews.setNewsContext(new String(viewNews.getXwZw(), StandardCharsets.UTF_8));
        viewNews.setXwZw(null);
        return new Result(0, null, viewNews);
    }
    
    /**
     * 根据新闻栏目id分页查询列表
     * @return
     */
    @RequestMapping(value="column", method=RequestMethod.GET)
    public Result getPageListByColumnId(  @RequestParam("page") Integer pageNum,
            @RequestParam("limit") Integer pageSize, @RequestParam("columnId") Integer columnId ) {
        
        PageInfo<ViewNews> pageInfo = newsFrontService.getPageListByColumnId(pageNum, pageSize, columnId);
        return new Result(0, null, pageInfo.getList());
    }
    
    /**
     * 根据新闻栏目id搜索分页查询列表
     * @return
     */
    @RequestMapping(value="getSearchColumnNewsPageList", method=RequestMethod.GET)
    public Result getSearchPageListByColumnidAndNewstitle(  @RequestParam("page") Integer pageNum,
            @RequestParam("limit") Integer pageSize, @RequestParam("columnId") Integer columnId,
            @RequestParam("newsTitle") String newsTitle) {
        
        PageInfo<ViewNews> pageInfo = newsFrontService.getSearchPageListByColumnidAndNewstitle(pageNum, pageSize, columnId, newsTitle);
        return new Result(0, null, pageInfo.getList());
    }
    
    /**
     * 全局搜索新闻分页查询列表
     * @return
     */
    @RequestMapping(value="getSearchNewsPageList", method=RequestMethod.GET)
    public Result getEntireSearchPageListByNewstitle( @RequestParam("page") Integer pageNum,
            @RequestParam("limit") Integer pageSize, @RequestParam("newsTitle") String newsTitle) {
        
        PageInfo<ViewNews> pageInfo = newsFrontService.getEntireSearchPageListByNewstitle(pageNum, pageSize, newsTitle);
        return new Result(0, null, pageInfo.getList());
    }
}
