package com.glut.dangjian.controller.other;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.glut.dangjian.entity.branch.Zbb;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.department.Bmb;
import com.glut.dangjian.entity.other.Dnzwb;
import com.glut.dangjian.entity.other.Jgb;
import com.glut.dangjian.entity.other.Mzb;
import com.glut.dangjian.entity.other.Xlb;
import com.glut.dangjian.entity.other.Xzzwb;
import com.glut.dangjian.entity.other.Zzmmb;
import com.glut.dangjian.service.other.CommonFrontService;

/** 
* @author xulankong
* @date 创建时间:  2018年12月21日 下午6:28:25
* @version 1.0
*/
@RestController
@CrossOrigin(methods = {RequestMethod.POST,RequestMethod.GET, RequestMethod.DELETE, RequestMethod.PUT})
@RequestMapping(value="mobile/common/")
public class CommonFrontController {

    @Autowired
    private CommonFrontService commonFrontService;
    
    /**
     * 获取所有部门列表
     * @return
     */
    @RequestMapping(value="getAllDepartment", method=RequestMethod.GET)
    public Result getDepartMentList() {
        
        List<Bmb> list = commonFrontService.getDepartMentList();
        return new Result(0, null, list);
    }
    
    /**
     * 获取所有支部
     * @return
     */
    @RequestMapping(value="getAllBranch", method=RequestMethod.GET)
    public Result getAllBranch() {
        
        List<Zbb> list = commonFrontService.getAllBranch();
        return new Result(0, null, list);
    }
    
    /**
     * 根据部门ID获取支部列表
     * @return
     */
    @RequestMapping(value="getBranchListByDeptId", method=RequestMethod.GET)
    public Result getBranchListByDeptId(@RequestParam("deptId") Integer deptId) {
        
        List<Zbb> list = commonFrontService.getBranchListByDeptId(deptId);
        return new Result(0, null, list);
    }
    
    /**
     * 获取政治面貌
     * @return
     */
    @RequestMapping(value="getAllPoliticsState", method=RequestMethod.GET)
    public Result getAllPoliticsState() {
       
        List<Zzmmb> list = commonFrontService.getAllPoliticsState();
        return new Result(0, null, list);
    }
    
    /**
     * 获取行政职务
     * @return
     */
    @RequestMapping(value="getAllAdministrativeJob", method=RequestMethod.GET)
    public Result getAllAdministrativeJob() {
        
        List<Xzzwb> list = commonFrontService.getAllAdministrativeJob();
        return new Result(0, null, list);
    } 
    
    /**
     * 获取党内职务
     * @return
     */
    @RequestMapping(value="getAllPartyJob", method=RequestMethod.GET)
    public Result getAllPartyJob() {
        
        List<Dnzwb> list = commonFrontService.getAllPartyJob();
        return new Result(0, null, list);
    }
    
    /**
     * 获取籍贯
     * @return
     */
    @RequestMapping(value="getPlace", method=RequestMethod.GET)
    public Result getPlace() {
        
        List<Jgb> list = commonFrontService.getPlace();
        return new Result(0, null, list);
    }
    
    /**
     * 根据所有在省获取籍贯
     * @return
     */
    @RequestMapping(value="getPlace/{province}", method=RequestMethod.GET)
    public Result getPlaceByProvince(@PathVariable("province") Integer province) {
        
        List<Jgb> list = commonFrontService.getPlaceByProvince(province);
        return new Result(0, null, list);
    }
    
    /**
     * 获取民族
     * @return
     */
    @RequestMapping(value="getNation", method=RequestMethod.GET)
    public Result getNation() {
        
        List<Mzb> list = commonFrontService.getNation();
        return new Result(0, null, list);
    }
    
    /**
     * 获取学历
     * @return
     */
    @RequestMapping(value="getEducation", method=RequestMethod.GET)
    public Result getEducation() {
        
        List<Xlb> list = commonFrontService.getEducation();
        return new Result(0, null, list);
    }
    
}
