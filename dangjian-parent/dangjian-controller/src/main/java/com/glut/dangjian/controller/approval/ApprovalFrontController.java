package com.glut.dangjian.controller.approval;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.SessionScope;

import com.glut.dangjian.background.approval.service.ApprovalProjectService;
import com.glut.dangjian.background.news.service.NewsService;
import com.glut.dangjian.background.other.service.PartyInfoService;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.news.XwZtb;
import com.glut.dangjian.entity.news.Xwb;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.pojo.ApprovalResult;
import com.glut.dangjian.service.approval.ApprovalFrontService;

/** 
* @author xulankong
* @date 创建时间:  2018年12月21日 下午5:11:53
* @version 1.0
*/
@RestController
@CrossOrigin(methods = {RequestMethod.POST,RequestMethod.GET, RequestMethod.DELETE, RequestMethod.PUT})
@RequestMapping(value="mobile/approval/")
public class ApprovalFrontController {

    @Autowired
    private PartyInfoService  partyInfoService;
    
    @Autowired
    private ApprovalFrontService approvalFrontService;
    
    @Autowired 
    private NewsService newsService;
    
    /**
     * 获取审批数量
     * @param session
     * @return
     */
    @RequestMapping(value="getApprovalNum",method=RequestMethod.GET)
    @ResponseBody
    @CrossOrigin(methods=RequestMethod.GET)
    public Result getApprovalNum(HttpSession session ) {
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        Integer num = approvalFrontService.getApprovalNum(yhb);
        return new Result(0, null, num);
        
    }
    
    
    /**
     * 同意新闻审批
     * @param newsId
     * @return
     */
    @RequestMapping(value="agreeNewsApproval",method=RequestMethod.POST)
    public Result agreeNewsApproval(@RequestParam("noticeId") String noticeId,
            HttpSession session) {
        
        //int result = approvalProjectService.agreeApproval(newsId, (Yhb)session.getAttribute("yhb"));
        ApprovalResult approvalResult =  approvalFrontService.agreeNewsApprovalByNotice(noticeId, (Yhb)session.getAttribute("yhb"));
        if (approvalResult.getResult() == 1) {
            Xwb xwb = new Xwb();
            xwb.setXwId(approvalResult.getData());
            xwb.setXwFbsj(new Date());
            xwb.setXwXwztdm(new XwZtb(3));
            newsService.approvalEnd(xwb);
        }
        return new Result(0, null, approvalResult.getData());
    }
    
    /**
     * 不同意新闻审批
     * @param newsId
     * @return
     */
    @RequestMapping(value="disAgreeNewsApproval",method=RequestMethod.POST)
    public Result disagreeApproval(@RequestParam("noticeId") String noticeId,
            HttpSession session) {
        
        //approvalProjectService.disagreeApproval(newsId, (Yhb)session.getAttribute("yhb"));
        ApprovalResult approvalResult  =  approvalFrontService.disagreeApprovalByNotice(noticeId, (Yhb)session.getAttribute("yhb"));
        Xwb xwb = new Xwb();
        xwb.setXwId(approvalResult.getData());
        xwb.setXwFbsj(new Date());
        xwb.setXwXwztdm(new XwZtb(4));
        newsService.approvalEnd(xwb);
        return new Result(0, null, approvalResult.getData());
    }
    
    /**
     * 同意新闻评论审批
     * @param commentId
     * @return
     */
    @RequestMapping(value="agreeNewsCommentApproval",method=RequestMethod.POST)
    public Result agreeNewsCommentApproval(@RequestParam("noticeId") String noticeId,
            HttpSession session) {
        
        //approvalProjectService.commentAgree(commentId, (Yhb)session.getAttribute("yhb"));
        ApprovalResult approvalResult  =  approvalFrontService.agreeNewsCommentApprovalByNotice(noticeId, (Yhb)session.getAttribute("yhb"));
        return new Result(0, null, null);
        
    }
    
    /**
     * 不同意新闻评论审批
     * @param commentId
     * @return
     */
    @RequestMapping(value="disagreeApprovalCommentApproval",method=RequestMethod.POST)
    public Result disagreeApprovalCommentApproval(@RequestParam("noticeId") String noticeId,
            HttpSession session) {
        
        //approvalProjectService.disagreeApproval(commentId, (Yhb)session.getAttribute("yhb"));
        ApprovalResult approvalResult  =  approvalFrontService.disagreeApprovalCommentApprovalByNotice(noticeId, (Yhb)session.getAttribute("yhb"));
        return new Result(0, null, null);
    }
    
    /**
     * 同意党籍审批
     * @param partyId
     * @return
     */
    @RequestMapping(value="agreePartyApproval",method=RequestMethod.POST)
    public Result agreePartyApproval(@RequestParam("noticeId") String noticeId,
            HttpSession session) {
        
        //int result = approvalProjectService.agreeApproval(partyId, (Yhb)session.getAttribute("yhb"));
        ApprovalResult approvalResult  =  approvalFrontService.agreePartyApprovalByNotice(noticeId, (Yhb)session.getAttribute("yhb"));
        if (approvalResult.getResult() == 1) {
            partyInfoService.updatePartyInfoAgreeApproval(approvalResult.getData());
        }
        return new Result(0, null, approvalResult.getData());
    }
    
    /**
     * 不同意党籍审批
     * @param partyId
     * @return
     */
    @RequestMapping(value="disAgreePartyApproval",method=RequestMethod.POST)
    public Result disAgreePartyApproval(@RequestParam("noticeId") String noticeId,
            HttpSession session) {
        
        //int result = approvalProjectService.agreeApproval(partyId, (Yhb)session.getAttribute("yhb"));
        ApprovalResult approvalResult  =  approvalFrontService.disAgreePartyApprovalByNotice(noticeId, (Yhb)session.getAttribute("yhb"));
        if (approvalResult.getResult() == 1) {
            partyInfoService.updatePartyInfoDisagreeApproval(approvalResult.getData());
        }
        return new Result(0, null, approvalResult.getData());
    }
    
}
