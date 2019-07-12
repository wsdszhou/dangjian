package com.glut.dangjian.background.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.HttpMediaTypeNotAcceptableException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.controller.exception.BaseSystemException;
import com.glut.dangjian.background.news.service.NewsService;
import com.glut.dangjian.background.notice.service.NoticeObjectService;
import com.glut.dangjian.config.ApprovalTypeConfig;
import com.glut.dangjian.entity.notice.view.ViewNotice;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.pojo.PageBean;

/** 
* @author xulankong
* @date 创建时间:  2018年11月25日 下午3:44:53
* @version 1.0
*/

@Controller
@RequestMapping("/back/")
public class InformationController {

    public static final String INFORMATION = "background/information";
    
    public static final String COMMON = "background/information/common";
    
    public static final String NEWSAPPROVAL = "background/information/newsapprova";
    
    public static final String PUBLICITYAPPROVAL = "background/information/publicityapproval";
    
    public static final String SYSTEMBUG = "background/information/systembug";
    
    
    @Autowired
    private NoticeObjectService  noticeObjectService;
    
    /**
     * 加载消息中心
     * @throws HttpMediaTypeNotAcceptableException 
     */
    @RequestMapping("information")
    public String toInformation() {
     
       return INFORMATION;
    }
    
    /**
     * 公告页
     */
    @RequestMapping("commmon")
    public String commmon() {
        return COMMON;
    }
    
    /**
     * 新闻审批
     */
    @RequestMapping("newsApproval")
    public String newsApproval() {
        return NEWSAPPROVAL;
    }
    
    /**
     * 党务审批
     */
    @RequestMapping("publicityApproval")
    public String publicityApproval() {
        return PUBLICITYAPPROVAL;
    }
    
    /**
     * 系统bug反馈
     */
    @RequestMapping("systemBug")
    public String systemBug() {
        return SYSTEMBUG;
    }
    
    /**
     * 加载公告栏
     */
    @RequestMapping(value="getNoticPageList", method=RequestMethod.POST)
    @ResponseBody
    public PageBean getNoticePageList(@RequestParam("page") Integer pageNum,  
            @RequestParam("rows") Integer pageSize, HttpSession session) {
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        PageInfo<ViewNotice> pageInfo =  noticeObjectService.getNoticePageList(pageNum, pageSize, yhb);
        return new PageBean(pageInfo.getTotal(), pageInfo.getList());
    }
    
    /**
     * 加载新闻审批
     */
    @RequestMapping(value="getNewsApprovalPageList", method=RequestMethod.POST)
    @ResponseBody
    public PageBean getNewsApprovalPageList(@RequestParam("page") Integer pageNum,  
            @RequestParam("rows") Integer pageSize, HttpSession session) {
        
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        ViewNotice viewNotice = new ViewNotice();
        viewNotice.setTzBt(ApprovalTypeConfig.NEWSAPPROVAL);
        PageInfo<ViewNotice> pageInfo =  noticeObjectService.getSelfNoticePageList(pageNum, pageSize, yhb, viewNotice);
        return new PageBean(pageInfo.getTotal(), pageInfo.getList());
    }
    
    /**
     * 加载新闻评论审批
     */
    @RequestMapping(value="getNewsCommentPageList", method=RequestMethod.POST)
    @ResponseBody
    public PageBean getNewsCommentPageList(@RequestParam("page") Integer pageNum,  
            @RequestParam("rows") Integer pageSize, HttpSession session) {
        
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        ViewNotice viewNotice = new ViewNotice();
        viewNotice.setTzBt(ApprovalTypeConfig.NEWSCOMMENTAPPROVAL);
        PageInfo<ViewNotice> pageInfo =  noticeObjectService.getSelfNoticePageList(pageNum, pageSize, yhb, viewNotice);
        return new PageBean(pageInfo.getTotal(), pageInfo.getList());
    }
    
    /**
     * 加载党务审批
     */
    @RequestMapping(value="getPublicityApprovalPageList", method=RequestMethod.POST)
    @ResponseBody
    public PageBean getPublicityApprovalPageList(@RequestParam("page") Integer pageNum,  
            @RequestParam("rows") Integer pageSize, HttpSession session) {
        
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        ViewNotice viewNotice = new ViewNotice();
        viewNotice.setTzBt("党籍");
        PageInfo<ViewNotice> pageInfo =  noticeObjectService.getSelfNoticePageList(pageNum, pageSize, yhb, viewNotice);
        return new PageBean(pageInfo.getTotal(), pageInfo.getList());
    }

}
