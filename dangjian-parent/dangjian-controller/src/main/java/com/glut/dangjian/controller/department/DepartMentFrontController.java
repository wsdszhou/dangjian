package com.glut.dangjian.controller.department;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.branch.Zbry;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.department.Bmb;
import com.glut.dangjian.entity.department.Bmry;
import com.glut.dangjian.entity.department.view.ViewDepartment;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.service.department.DepartMentFrontService;

/** 
* @author xulankong
* @date 创建时间:  2018年12月21日 下午7:07:23
* @version 1.0
*/
@RestController
@CrossOrigin(methods = {RequestMethod.POST,RequestMethod.GET, RequestMethod.DELETE, RequestMethod.PUT})
@RequestMapping(value="mobile/dept/")
public class DepartMentFrontController {

    @Autowired
    private DepartMentFrontService departMentFrontService;
    
    /**
     * 获取部门信息
     * @return
     */
    @RequestMapping(value="getDeptInfo", method=RequestMethod.GET)
    public Result getDeptInfo(HttpSession session) {
        
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        ViewDepartment viewDepartment = departMentFrontService.getDeptInfo(yhb);
        return new Result(0, null, viewDepartment);
    }
    
    /**
     * 获取荣誉列表
     * @return
     */
    @RequestMapping(value="getDeptHonorPageList", method=RequestMethod.GET)
    public Result getDeptHonorPageList( @RequestParam("page") Integer pageNum,
            @RequestParam("limit") Integer pageSize ) {
        
        PageInfo<Bmry> pageInfo = departMentFrontService.getDeptHonorPageList(pageNum, pageSize);
        return new Result(0, null, pageInfo.getList());
    }
    
    /**
     * 获取单个荣誉信息
     * @return
     */
    @RequestMapping(value="getSingleDeptHonor", method=RequestMethod.GET)
    public Result getDeptHonor(@RequestParam("honorId") String honorId) {
        
        Bmry bmry = departMentFrontService.getDeptHonorByHonorid(honorId);
        return new Result(0, null, bmry);
    }
}
