package com.glut.dangjian.background.controller.department;

import java.util.List;

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
import com.glut.dangjian.entity.branch.ZbLxb;
import com.glut.dangjian.entity.branch.Zbb;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.department.Bmb;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.pojo.PageBean;

/**
 * 
 * @author lanlan
 *
 */
@Controller
@RequestMapping("back/branch")
public class BranchController {

    //定义模块视图根目录
    private final static String ROOT = "background/department/branchList";

    @Autowired
    BranchService  branchService;

    /**
     * 支部管理首页
     * @return
     */
    @RequestMapping("toList")
    public String togoList(){
        return ROOT;
    }
    
    /**
     * 加载支部信息根据部门
     * @return
     */
    @RequestMapping(value="loadBranch/{deptId}",method=RequestMethod.POST)
    @ResponseBody
    public List<Zbb> loadBranch(@PathVariable("deptId") Integer deptId) {
        
        if (deptId == -1) {
            deptId = null;
        }
        List<Zbb> zbbs = branchService.loadBranch(deptId);
        return zbbs;
    }
    
    /**
     * 分页获取支部
     * @param pageNum 页数
     * @param pageSize 每页数据条数
     * @return
     */
    @ResponseBody
    @RequestMapping(value="getBranchList",method=RequestMethod.POST)
    public PageBean getBranchList(@RequestParam("page") Integer pageNum,
            @RequestParam("rows") Integer pageSize, Zbb zbb){

        PageInfo pageInfo = branchService.getBranchPageList(pageNum,pageSize, zbb);
        return new PageBean(pageInfo.getTotal(),pageInfo.getList());
    }
    
    
    /**
     * 添加支部
     * @return
     */
    @RequestMapping(value="addBranch",method=RequestMethod.POST)
    @ResponseBody
    public Result addBranch(Zbb zbb){
        branchService.addBranch(zbb);
        return new Result(0, null, null);
    }

    /**
     * 修改支部
     * @param BranchMc
     * @return
     */
    @RequestMapping(value="editBranch", method=RequestMethod.POST)
    @ResponseBody
    public Result editBranch( Zbb zbb){
        System.err.println(zbb);
        branchService.editBranch(zbb);
        return new Result(0, null, null);
    }

    /**
     * 批量删除支部
     * @param BranchIds
     * @return
     */
    @RequestMapping(value="deleteBranch/{branchIds}", method=RequestMethod.POST)
    public Result deleteBranch(@PathVariable("branchIds") String branchIds){
        String[] ids = branchIds.split(",");
        branchService.deleteBranchBatch(ids);
        return new Result(0, null, null);
    }
    
    
    /**
     * 加载支部list
     * @param zbbId
     * @param session
     * @return
     */
    @RequestMapping(value="loadZb/{zbbId}")
    @ResponseBody
    public List<Zbb> loadZbList(@PathVariable("zbbId") Integer zbbId, HttpSession session) {
        
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        return branchService.getZbbListByUserId(yhb.getUserId());
    }
    
    /**
     * 加载支部类型
     * @return
     */
    @RequestMapping(value="loadBranchTypeList", method=RequestMethod.POST)
    @ResponseBody
    public List<ZbLxb> loadBranchTypeList() {
        
        return branchService.loadBranchTypeList();
    }
    
    /**
     * 加载所有支部
     * @return
     */
    @RequestMapping(value="loadBranchAllList", method=RequestMethod.POST)
    @ResponseBody
    public List<Zbb> loadBranchAllList() {
        
        return branchService.loadBranchAllList();
    }
    
    /**
     * 根据部门和支部类型加载支部列表
     * @return
     */
    @RequestMapping(value="loadBranchByDepartmentList/{deptId}", method=RequestMethod.POST)
    @ResponseBody
    public List<Zbb> loadBranchByDepartmentList(@PathVariable("deptId") Integer deptId) {
        
        return branchService.loadBranchByDepartmentList( deptId );
    }
    
    /**
     * 根据部门和支部类型加载支部列表
     * @return
     */
    @RequestMapping(value="loadBranchByDepartmentList/{deptId}/{branchTypeId}", method=RequestMethod.POST)
    @ResponseBody
    public List<Zbb> loadBranchByDepartmentAndBranchTypeList(@PathVariable("deptId") Integer deptId,
            @PathVariable("branchTypeId") Integer branchTypeId) {
        
        return branchService.loadBranchByDepartmentAndBranchTypeList( deptId, branchTypeId );
    }


}
