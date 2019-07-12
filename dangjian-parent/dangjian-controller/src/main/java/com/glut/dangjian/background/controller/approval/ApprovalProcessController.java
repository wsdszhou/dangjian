package com.glut.dangjian.background.controller.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.approval.service.ApprovalService;
import com.glut.dangjian.entity.approval.SpSplcb;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.pojo.PageBean;
/**
 * 
 * @author XuLanKong
 *
 */
@Controller
@RequestMapping("back/approval/process/")
public class ApprovalProcessController {
    
    // 审批项目管理的uri
    private static final String LIST = "background/approval/approvalProcessList";
    
    @Autowired
    private ApprovalService approvalService;
    
    /**
     * 进入审批流程列表
     * @return
     */
    @RequestMapping("toList")
    private String gotoApprovalList() {
        
        return LIST;
    }
    
    /**
     * 添加审批流程
     * @param splcb
     * @return
     */
    @RequestMapping(value="saveApproval", method=RequestMethod.POST)
    @ResponseBody
    public Result saveApproval(SpSplcb splcb) {
        
        approvalService.saveApproval(splcb);
        return new Result(0, null, null);
    }
    
    /**
     * 审批流程分页查询
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping(value="approvalList", method=RequestMethod.POST)
    @ResponseBody
    public PageBean approvalList(@RequestParam("page") Integer pageNum,
            @RequestParam("rows") Integer pageSize) {
        
        PageInfo<SpSplcb> info = approvalService.approvalList(pageNum, pageSize);
        PageBean pageBean = new PageBean( info.getTotal(), info.getList());
        return pageBean;
    } 
    
    /**
     * 修改审批流程
     * @param splcb
     * @return
     */
    @RequestMapping(value="updateApproval", method=RequestMethod.POST)
    @ResponseBody
    public Result updateApproval(SpSplcb splcb) {
        if (splcb.getSplcState() == null) {
            splcb.setSplcState(0);
        }
        approvalService.updateApproval(splcb);
        return new Result(0, null, null);
    }
    
    /**
     * 批量删除审批流程
     * @param ids
     */
    @RequestMapping(value="deleteApprovalBatch/{ids}", method=RequestMethod.POST)
    @ResponseBody
    public Result deleteApprovalBatch(@PathVariable("ids") String ids) {

        String[] id = ids.split(",");
        approvalService.deleteApprovalBatch(id);
        return new Result(0, null, null);
    }
    
    /**
     * 加载审批流程
     * @return
     */
    @RequestMapping(value="loadApprovalProcess", method=RequestMethod.POST)
    @ResponseBody
    public List<SpSplcb> loadApprovalProcess() {
        
        List<SpSplcb> splcbs = approvalService.loadApprovalProcess();
        return splcbs;
    }
    
}
