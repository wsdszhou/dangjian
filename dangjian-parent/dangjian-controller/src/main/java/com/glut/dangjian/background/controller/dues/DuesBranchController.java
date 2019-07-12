package com.glut.dangjian.background.controller.dues;


import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.dues.service.DuesBranchService;
import com.glut.dangjian.background.dues.service.DuesCollegeService;
import com.glut.dangjian.entity.dues.DuesCollege;
import com.glut.dangjian.entity.dues.view.ViewDuesCollegeBranch;
import com.glut.dangjian.pojo.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("back/dues/branchList/")
public class DuesBranchController {

    @Autowired
    private DuesBranchService duesBranchService;

    @Autowired
    private DuesCollegeService duesCollegeService;
    // 党费支部列表
    private static final String  BRANCHLIST ="background/dues/duesBranch";



    /**
     * 进入审批岗位人员列表
     * @return
     */
    @RequestMapping(value = "{collegeId}",method=RequestMethod.GET)
    public String toCollegeBranchList(@PathVariable("collegeId") Integer collegeId, Map<String, Object> map) {

        DuesCollege college = duesCollegeService.getCollegeById(collegeId);
        map.put("college", college);
        return BRANCHLIST;
    }

    /**
     * 分页查询岗位列表人员
     * @param pageNum
     * @param pageSize
     * @param collegeId
     * @return
     */
    @RequestMapping(value="duesBranchPageList/{collegeId}", method=RequestMethod.POST)
    @ResponseBody
    public PageBean duesBranchPageList(@RequestParam("page") Integer pageNum,
                                    @RequestParam("rows") Integer pageSize, @PathVariable("collegeId") Integer collegeId) {

        PageInfo<ViewDuesCollegeBranch> pageInfo = duesBranchService.duesBranchPageList(pageNum, pageSize, collegeId);
        PageBean pageBean = new PageBean(pageInfo.getTotal(), pageInfo.getList());
        return pageBean;
    }
}
