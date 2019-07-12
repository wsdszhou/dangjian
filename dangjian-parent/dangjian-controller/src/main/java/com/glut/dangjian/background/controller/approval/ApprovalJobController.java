package com.glut.dangjian.background.controller.approval;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.approval.service.ApprovalJobService;
import com.glut.dangjian.entity.approval.SpRyb;
import com.glut.dangjian.entity.approval.SpSpgwb;
import com.glut.dangjian.entity.approval.view.ViewApprovalJobUser;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.mapper.approval.view.ViewApprovalJobUserMapper;
import com.glut.dangjian.pojo.PageBean;
import com.glut.dangjian.service.news.NewsPraiseFrontService;

/**
 * 1111
 * @author XuLanKong
 *
 */
@Controller
@RequestMapping("back/approval/job/")
public class ApprovalJobController {
    
    // 审批岗位列表
    private static final String  JOBLIST ="background/approval/jobList";

    @Autowired
    private ApprovalJobService approvalJobService;
    
    /**
     * 进入审批岗位列表
     * @return
     */
    @RequestMapping(value = "list")
    public String gotojobList() {
        return JOBLIST;
    }
    
    
    
    /**
     * 分页查询审批岗位
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping(value="/approvalJobPageList", method=RequestMethod.POST)
    @ResponseBody
    public PageBean approvalJobPageList(@RequestParam("page") Integer pageNum,
    @RequestParam("rows") Integer pageSize){
        
        PageInfo<SpSpgwb> pageInfo = approvalJobService.approvalJobPageList(pageNum, pageSize);
        return new PageBean(pageInfo.getTotal(), pageInfo.getList());
    }
  
    /**
     * 添加审批岗位
     * @param spgwb
     * @return
     */
    @RequestMapping(value="saveApproval", method=RequestMethod.POST)
    @ResponseBody
    public Result saveApproval(SpSpgwb spgwb){
        return new Result(0, null, null);
    }
    
    /**
     * 修改审批岗位
     * @param spgwb
     * @return
     */
    @RequestMapping(value="updateApprovalJob", method=RequestMethod.POST)
    @ResponseBody
    public Result updateApprovalJob(SpSpgwb spgwb){
        
        approvalJobService.updateApprovalJob(spgwb);
        return new Result(0, null, null);
    }
    
    /**
     * 删除审批岗位
     * @param spgwb
     * @return
     */
    @RequestMapping(value="deleteApprovalJobBatch/{ids}", method=RequestMethod.POST)
    @ResponseBody
    public Result deleteApprovalJobBatch(@PathVariable("ids") String ids ){
        String[] jobId = ids.split(",");
        approvalJobService.deleteApprovalJobBatch(jobId);
        return new Result(0, null, null);
    }
    
    
    
    /**
     * 加载审批岗位列表
     * @return
     */
    @RequestMapping(value="/loadApprovalJob", method=RequestMethod.POST)
    @ResponseBody
    public List<SpSpgwb> loadApprovalJob(){
        
        return approvalJobService.loadApprovalJob();
    }
    
    
}
