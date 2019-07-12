package com.glut.dangjian.controller.notice;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.config.ApprovalTypeConfig;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.notice.view.ViewNotice;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.service.notice.NoticeFrontService;

/** 
* @author xulankong
* @date 创建时间:  2018年12月21日 下午6:48:02
* @version 1.0
*/
@RestController
@CrossOrigin(methods = {RequestMethod.POST,RequestMethod.GET, RequestMethod.DELETE, RequestMethod.PUT})
@RequestMapping(value="mobile/notice/")
public class NoticeFrontController {
    
    @Autowired
    private NoticeFrontService noticeFrontService;
    
    /**
     * 获取通知数量
     * @return
     */
    @RequestMapping(value="getNoticeNum", method=RequestMethod.GET)
    public Result getNoticeNum(HttpSession session) {
        
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        Integer countNum = noticeFrontService.getNoticeNum(yhb);
        return new Result(0, null, countNum);
    }

    /**
     * 获取公告列表
     * @return
     */
    @RequestMapping(value="getNoticePageList", method=RequestMethod.GET)
    public Result getNotice( @RequestParam("page") Integer pageNum,
            @RequestParam("limit") Integer pageSize, HttpSession session) {
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        PageInfo<ViewNotice> pageInfo =  noticeFrontService.getNotice(pageNum, pageSize, yhb);
        return new Result(0, null, pageInfo.getList());
    }
    
    /**
     * 获取公告详细信息
     * @return
     */
    @RequestMapping(value="getSingleNoticeInfo", method=RequestMethod.GET)
    public Result getSingleNoticeInfo(@RequestParam("noticeId") String noticeId) {
        
        ViewNotice viewNotice = noticeFrontService.getNoticeInfoByNoticeId(noticeId);
        return new Result(0, null, viewNotice);
    }
    
    /**
     * 获取党务审批列表
     * @return
     */
    @RequestMapping(value="getPartyNoticePageList", method=RequestMethod.GET)
    public Result getPartyNotice( @RequestParam("page") Integer pageNum,
            @RequestParam("limit") Integer pageSize, HttpSession session) {
        
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        PageInfo<ViewNotice> pageInfo =  noticeFrontService.getNotice(pageNum, pageSize, yhb, ApprovalTypeConfig.PARTINFOAPPROVAL, ApprovalTypeConfig.PARTINFOUPDATEAPPROVAL);
        return new Result(0, null, pageInfo.getList());
    }
    
    /**
     * 获取新闻审批列表
     * @return
     */
    @RequestMapping(value="getNewsNoticePageList", method=RequestMethod.GET)
    public Result getNewsNotice( @RequestParam("page") Integer pageNum,
            @RequestParam("limit") Integer pageSize, HttpSession session) {
        
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        PageInfo<ViewNotice> pageInfo =  noticeFrontService.getNotice(pageNum, pageSize, yhb, ApprovalTypeConfig.NEWSAPPROVAL, null);
        return new Result(0, null, pageInfo.getList());
    }
    
    /**
     * 获取新闻审评论审批批列表
     * @return
     */
    @RequestMapping(value="getNewsCommentNoticePageList", method=RequestMethod.GET)
    public Result getNewsCommentNotice( @RequestParam("page") Integer pageNum,
            @RequestParam("limit") Integer pageSize, HttpSession session) {
        
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        PageInfo<ViewNotice> pageInfo =  noticeFrontService.getNotice(pageNum, pageSize, yhb, ApprovalTypeConfig.NEWSCOMMENTAPPROVAL, null);
        return new Result(0, null, pageInfo.getList());
    }
    
}
