package com.glut.dangjian.controller.department;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.branch.Zbry;
import com.glut.dangjian.entity.branch.view.ViewBranch;
import com.glut.dangjian.entity.branch.view.ViewBranchUser;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.service.department.BranchFrontService;

/** 
* @author xulankong
* @date 创建时间:  2018年12月21日 下午7:08:06
* @version 1.0
*/
@RestController
@CrossOrigin(methods = {RequestMethod.POST,RequestMethod.GET, RequestMethod.DELETE, RequestMethod.PUT})
@RequestMapping(value="mobile/branch/")
public class BranchFrontController {

    @Autowired
    private BranchFrontService branchFrontService;
    
    /**
     * 获取支部人员信息
     * @return
     */
    @RequestMapping(value="getBranchUser", method=RequestMethod.GET)
    public Result getBranchUser(HttpSession session) {
        
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        List<ViewBranchUser> viewBranchUsers = branchFrontService.getBranchUserInfo(yhb);
        return new Result(0, null, viewBranchUsers);
    }
    
    /**
     * 获取支部信息
     * @return
     */
    @RequestMapping(value="getBranchInfo", method=RequestMethod.GET)
    public Result getBranchInfo(HttpSession session) {
        
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        ViewBranch viewBranch = branchFrontService.getBranchInfo(yhb);
        return new Result(0, null, viewBranch);
    }
    
    /**
     * 获取荣誉列表
     * @return
     */
    @RequestMapping(value="getBranchHonorPageList", method=RequestMethod.GET)
    public Result getBranchHonorPageList( @RequestParam("page") Integer pageNum,
            @RequestParam("limit") Integer pageSize) {
        
        PageInfo<Zbry> pageInfo = branchFrontService.getBranchHonorPageList(pageNum, pageSize);
        return new Result(0, null, pageInfo.getList());
    }
    
    /**
     * 获取单个荣誉信息
     * @return
     */
    @RequestMapping(value="getSingleBranchHonor", method=RequestMethod.GET)
    public Result getSingleBranchHonor(@RequestParam("honorId") String honorId) {
        
        Zbry zbry = branchFrontService.getBranchHonorByHonorid(honorId);
        return new Result(0, null, zbry);
    }
}
