package com.glut.dangjian.controller.news;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.news.XwPlHf;
import com.glut.dangjian.entity.news.XwPlb;
import com.glut.dangjian.entity.news.view.ViewCommentReply;
import com.glut.dangjian.entity.news.view.ViewNewsComment;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.service.news.NewsCommentFrontService;

/** 
* @author xulankong
* @date 创建时间:  2018年12月20日 下午6:46:11
* @version 1.0
*/
@RestController
@RequestMapping(value="mobile/news/comment")
public class NewsCommentFrontController {

    @Autowired
    private NewsCommentFrontService newsCommentService;
    
    /**
     * 根据新闻id分页查询评论和点赞数量
     * @param newsId
     * @param pageNum
     * @param pageSize
     * @return
     */
    @CrossOrigin(methods = RequestMethod.GET)
    @RequestMapping(value="/getSingletNewsComment",method = RequestMethod.GET)
    public Result getSingletNewsComment(@RequestParam("newsId") String newsId,
            @RequestParam("page") Integer pageNum, @RequestParam("limit") Integer pageSize) {
     
      PageInfo<ViewNewsComment> pageInfo = newsCommentService.getNewsCommentByNewsId(pageNum, pageSize, newsId);
      List<ViewNewsComment> viewNewsComments = new ArrayList<>();
      for(ViewNewsComment viewNewsComment : pageInfo.getList() ) {
          viewNewsComment.setPraiseNum(viewNewsComment.getPraiseNum()-1);
          viewNewsComments.add(viewNewsComment);
      }
      pageInfo.setList(viewNewsComments);
      return new Result(0, null, pageInfo.getList());
    }
    
    /**
     * 保存一条评论
     * @param xwPlb
     * @param session
     * @return
     */
    @CrossOrigin(methods = RequestMethod.POST)
    @RequestMapping(value="",method = RequestMethod.POST)
    public Result saveNewsComment(XwPlb xwPlb, HttpSession session) {
        
        Yhb user = (Yhb) session.getAttribute("yhb");
        newsCommentService.saveComment(xwPlb, user);
        return new Result(0, null, null);
    }
    
    /**
     * 删除一条文章评论
     * @param xwPlb
     * @return
     */
    @CrossOrigin(methods = RequestMethod.DELETE)
    @RequestMapping(value="",method = RequestMethod.DELETE)
    public Result deleteNewsComment(String id) {
        XwPlb xwPlb = new XwPlb();
        xwPlb.setId(id);
        newsCommentService.deleteNewsComment(xwPlb);
        return new Result(0, null, null);
    }
    
    /**
     * 获取评论
     * @param commentId
     * @return
     */
    @CrossOrigin(methods = RequestMethod.GET)
    @RequestMapping(value="",method = RequestMethod.GET)
    public Result getViewNewsComment(@RequestParam("commentId") String commentId) {
        
        ViewNewsComment viewNewsComment = newsCommentService.getViewNewsComment(commentId);
        return new Result(0, null, viewNewsComment);
    } 
    
    
}
