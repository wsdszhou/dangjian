package com.glut.dangjian.controller.news;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.service.news.NewsPraiseFrontService;

/** 
* @author xulankong
* @date 创建时间:  2018年12月21日 下午4:06:47
* @version 1.0
*/
@RestController
@CrossOrigin(methods = RequestMethod.GET)
@RequestMapping(value="mobile/news/praise/")
public class NewsPraiseFrontController {

    @Autowired
    private NewsPraiseFrontService newsPraiseFrontService;
    
    /**
     * 获取新闻点赞数量
     * @param newsId
     * @return
     */
    @RequestMapping(value="getNewsPraiseNum")
    public Result getNewsPraiseNum(@RequestParam("newsId") String newsId) {
        
        Integer praiseNum = newsPraiseFrontService.getNewsPraiseNum(newsId);
        return new Result(0, null, praiseNum);    
    } 
    
    /**
     * 新闻点赞
     * @param newsId
     * @param session
     * @return
     */
    @RequestMapping(value="getNewsPraise")
    public Result newsPraise(@RequestParam("newsId") String newsId, HttpSession session) {
        
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        boolean hasPraise = newsPraiseFrontService.newsPraise(newsId, yhb.getUserId());
        if (hasPraise) {
            return new Result(0, null, null);
        }
        return new Result(202, "您已经点赞过了", null);
    }
    
    /**
     * 新闻是否已经点赞
     * @param newsId
     * @param session
     * @return
     */
    @RequestMapping(value="comment/newsIsPraise")
    public Result newsIsPraise(@RequestParam("newsId") String newsId, HttpSession session) {
        
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        boolean hasPraise = newsPraiseFrontService.newsIsPraise(newsId, yhb.getUserId());
        if (hasPraise) {
            return new Result(0, "您已经点赞过了", null);
        }
        return new Result(1, "没有点赞过", null);
    }
    
    /**
     * 新闻评论点赞
     * @param commentId
     * @param session
     * @return
     */
    @RequestMapping(value="comment/commentPraise")
    public Result commentPraise(@RequestParam("commentId") String commentId, HttpSession session) {
        
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        boolean hasPraise = newsPraiseFrontService.commentPraise(commentId, yhb.getUserId());
        if (hasPraise) {
            return new Result(0, null, null);
        }
        return new Result(0, "您已经点赞过了", null);
    }
    
    
    
}
