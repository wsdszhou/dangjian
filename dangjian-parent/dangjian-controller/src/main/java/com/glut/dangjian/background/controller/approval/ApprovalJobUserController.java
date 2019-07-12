package com.glut.dangjian.background.controller.approval;

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
import com.glut.dangjian.entity.approval.view.ViewJobUser;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.pojo.PageBean;

/** 
* @author xulankong
* @date 创建时间:  2018年12月8日 下午5:13:10
* @version 1.0
*/
@Controller
@RequestMapping("back/approval/jobUserList/")
public class ApprovalJobUserController {

    @Autowired
    private ApprovalJobService approvalJobService;
    
    // 审批岗位人员列表
    private static final String  JOBUSERLIST ="background/approval/jobUserList";
    
    /**
     * 进入审批岗位人员列表
     * @return
     */
    @RequestMapping(value = "{spgwId}",method=RequestMethod.GET)
    public String tojobUserList(@PathVariable("spgwId") Integer spgwId, Map<String, Object> map) {
        
        SpSpgwb job = approvalJobService.getJobById(spgwId);
        map.put("job", job);
        return JOBUSERLIST;
    }
    
    
    /**
     * 分页查询岗位列表人员
     * @param pageNum
     * @param pageSize
     * @param spgwId
     * @return
     */
    @RequestMapping(value="jobUserPageList/{spgwId}", method=RequestMethod.POST)
    @ResponseBody
    public PageBean jobUserPageList(@RequestParam("page") Integer pageNum,
            @RequestParam("rows") Integer pageSize, @PathVariable("spgwId") Integer spgwId,  ViewJobUser viewJobUser) {
        
        viewJobUser.setSpgwId(spgwId);
        PageInfo<ViewApprovalJobUser> pageInfo = approvalJobService.jobUserPageList(pageNum, pageSize, viewJobUser);
        PageBean pageBean = new PageBean(pageInfo.getTotal(), pageInfo.getList());
        return pageBean;
    }

    /**
     * 添加审批人员
     * @param viewApprovalJobUser
     */
    @RequestMapping(value="saveApprovalUser", method=RequestMethod.POST)
    @ResponseBody
    public Result saveApprovalUser(ViewApprovalJobUser viewApprovalJobUser) {
        
        SpRyb spRyb = approvalJobService.getApprovalUserByUserId(viewApprovalJobUser.getUserId(), viewApprovalJobUser);
        if (spRyb != null) {
            return new Result(1, "用户已经存在", null);
        }
        Integer spgwId = approvalJobService.saveJobUser(viewApprovalJobUser);
        return new Result(0, null, null);
    }
    
    /**
     * 修改审批人员
     * @param viewApprovalJobUser
     */
    @RequestMapping(value="updateApprovalJobUser", method=RequestMethod.POST)
    @ResponseBody
    public Result updateApprovalJobUser(ViewApprovalJobUser viewApprovalJobUser) {
        
        Integer spgwId = approvalJobService.updateApprovalJobUser(viewApprovalJobUser);
        return new Result(0, null, null);
    }
    

    @RequestMapping(value="deleteApprovalJobUserBatch/{ids}", method=RequestMethod.POST)
    @ResponseBody
    public Result deleteApprovalJobUserBatch(@PathVariable("ids") String ids ) {
        
        String[] spryIds = ids.split(",");
        approvalJobService.deleteApprovalUserJobBatch(spryIds);
        return new Result(0, null, null);
    }
}
