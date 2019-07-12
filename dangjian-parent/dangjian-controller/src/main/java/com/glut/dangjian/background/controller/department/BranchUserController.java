package com.glut.dangjian.background.controller.department;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.department.service.BranchService;
import com.glut.dangjian.background.department.service.BranchUserService;
import com.glut.dangjian.entity.branch.Zbb;
import com.glut.dangjian.entity.branch.view.ViewBranchUser;
import com.glut.dangjian.pojo.PageBean;

/** 
* @author xulankong
* @date 创建时间:  2018年11月14日 下午4:21:27
* @version 1.0
*/
@Controller
@RequestMapping("back/branch/user/")
public class BranchUserController {

    //定义模块视图根目录
    private final static String ROOT = "background/department/branchUserList";
    
    @Autowired
    BranchUserService  branchUserService;
    
    @Autowired 
    BranchService branchService;

    /**
     * 支部管理首页
     * @return
     */
    @RequestMapping("{branchId}")
    public String toList(@PathVariable("branchId") Integer branchId, HttpSession session) {
        
        Zbb  zbb = branchService.getBranchById(branchId);
        session.setAttribute("branch", zbb);
        return ROOT;
    }
    
    /**
     * 分页获取支部用户
     * @param pageNum 页数
     * @param pageSize 每页数据条数
     * @return
     */
    @ResponseBody
    @RequestMapping(value="getBranchUserPageList/{branchId}",method=RequestMethod.POST)
    public PageBean getBranchUserPageList(@RequestParam("page") Integer pageNum,
            @RequestParam("rows") Integer pageSize, ViewBranchUser viewBranchUser, 
            @PathVariable("branchId") Integer branchId ){

        PageInfo pageInfo = branchUserService.getBranchUserPageList(pageNum,pageSize, viewBranchUser, branchId);
        return new PageBean(pageInfo.getTotal(),pageInfo.getList());
    }
    
    
}
