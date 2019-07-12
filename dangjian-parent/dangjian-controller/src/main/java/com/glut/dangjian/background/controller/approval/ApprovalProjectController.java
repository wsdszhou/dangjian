package com.glut.dangjian.background.controller.approval;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.approval.service.ApprovalProjectService;
import com.glut.dangjian.background.news.service.NewsService;
import com.glut.dangjian.background.other.service.PartyInfoService;
import com.glut.dangjian.entity.approval.view.ViewApprovalProjectProcessNode;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.news.XwZtb;
import com.glut.dangjian.entity.news.Xwb;
import com.glut.dangjian.entity.other.PartyInfo;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewYhxx;
import com.glut.dangjian.pojo.PageBean;
/**
 * 
 * @author XuLanKong
 *
 */
@Controller
@RequestMapping("back/approval/project/")
public class ApprovalProjectController {

    private static final String LIST = "background/approval/approvalProjectList";
    
    @Autowired
    private ApprovalProjectService approvalProjectService;
    
    @Autowired 
    private NewsService newsService;
    
    @Autowired
    private PartyInfoService  partyInfoService;
    /**
     * 进入主页面
     * @return
     */
    @RequestMapping("toList")
    public String gotoList() {
        
        return LIST;
    }
    
    /**
     * 分页查询审批列表
     * @return
     */
    @RequestMapping(value="getApprovalProjectPageList", method=RequestMethod.POST)
    @ResponseBody
    public PageBean getApprovalProjectPageList( @RequestParam(value = "page",defaultValue = "1") Integer pageNum,  @RequestParam(value = "rows",defaultValue = "10") Integer pageSize,
            ViewApprovalProjectProcessNode viewApprovalProjectProcessNode) {
        
        PageInfo<ViewApprovalProjectProcessNode> pageInfo = approvalProjectService.getApprovalProjectPageList(pageNum, pageSize, viewApprovalProjectProcessNode);
        PageBean pageBean = new PageBean(pageInfo.getTotal(), pageInfo.getList());
        return pageBean;
    }
    
    /**
     * 批量删除审批项目
     */
    @RequestMapping(value="deleteApprovalProjectBatch/{ids}", method=RequestMethod.POST)
    @ResponseBody
    public Result deleteApprovalProjectBatch(@PathVariable("ids") String ids) {
        
        String[] projectIds = ids.split(",");
        approvalProjectService.deleteApprovalProjectBatch(projectIds);
        return new Result(0, null, null);
    }
    
    /**
     * 同意新闻审批
     */
    @ResponseBody
    @RequestMapping(value="agree", method=RequestMethod.POST)
    @Transactional(propagation=Propagation.NESTED)
    public String agreeNews(@RequestParam("objectId") String objectId, HttpSession session) {
        
        int result = approvalProjectService.agreeApproval(objectId, (Yhb)session.getAttribute("yhb"));
        if (result == 1) {
            Xwb xwb = new Xwb();
            xwb.setXwId(objectId);
            xwb.setXwFbsj(new Date());
            xwb.setXwXwztdm(new XwZtb(3));
            newsService.approvalEnd(xwb);
        }
        return "200";
    }
     
    /**
     * 不同意新闻审批
     */
    @ResponseBody
    @RequestMapping(value="disagree", method=RequestMethod.POST)
    @Transactional(propagation=Propagation.NESTED)
    public String disagreeApproval(@RequestParam("objectId") String objectId, HttpSession session) {
        approvalProjectService.disagreeApproval(objectId, (Yhb)session.getAttribute("yhb"));
        Xwb xwb = new Xwb();
        xwb.setXwId(objectId);
        xwb.setXwFbsj(new Date());
        xwb.setXwXwztdm(new XwZtb(4));
        newsService.approvalEnd(xwb);
        return "200";
    }
    
    /**
     * 同意党务审批
     */
    @ResponseBody
    @RequestMapping(value="agreePartInfo", method=RequestMethod.POST)
    @Transactional(propagation=Propagation.NESTED)
    public String agreePartInfo(@RequestParam("objectId") String objectId, HttpSession session) {
        Yhb yhb = (Yhb) session.getAttribute("yhb");

        int result = approvalProjectService.agreeApproval(objectId, yhb);

        if (result == 1) {
            partyInfoService.updatePartyInfoAgreeApproval(objectId);
        }
        return "200";
    }
     
    /**
     * 不同意党务审批
     */
    @ResponseBody
    @RequestMapping(value="disagreePartInfo", method=RequestMethod.POST)
    @Transactional(propagation=Propagation.NESTED)
    public String disagreePartInfo(@RequestParam("objectId") String objectId, HttpSession session) {
        approvalProjectService.disagreeApproval(objectId, (Yhb)session.getAttribute("yhb"));
        partyInfoService.deleteBatch(objectId);
        return "200";
    }
    
    /**
     * 同意评论
     * @param commentId
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value="commentAgree", method=RequestMethod.POST)
    public String commentAgree(@RequestParam("commentId") String commentId, HttpSession session) {
        
        approvalProjectService.commentAgree(commentId, (Yhb)session.getAttribute("yhb"));
        return "200";
    }
    
    /**
     * 不同意评论审批
     */
    @ResponseBody
    @RequestMapping(value="commentDisagree", method=RequestMethod.POST)
    public String commentDisagree(@RequestParam("commentId") String commentId, HttpSession session) {
        approvalProjectService.disagreeApproval(commentId, (Yhb)session.getAttribute("yhb"));
        return "200";
    }
}
