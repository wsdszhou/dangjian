package com.glut.dangjian.background.controller.dues;


import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.dues.service.DuesCollegeService;
import com.glut.dangjian.entity.dues.DuesCollege;
import com.glut.dangjian.pojo.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("back/dues/college/")
public class DuesCollegeController {

    private static final String COLLEGELIST = "background/dues/duesCollege";

    @Autowired
    private DuesCollegeService duesCollegeService;



    @RequestMapping(value = "list")
    public String gotCollegeList() {
        return COLLEGELIST;
    }

    //加载学院信息
    @RequestMapping(value = "/loadDuesCollege", method = RequestMethod.POST)
    @ResponseBody
    public List<DuesCollege> loadDuesCollege() {
        return duesCollegeService.loadDuesCollege();
    }


    /**
     * 分页查询党费学院信息
     *
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/duesCollegePageList", method = RequestMethod.POST)
    @ResponseBody
    public PageBean approvalJobPageList(@RequestParam("page") Integer pageNum,
                                        @RequestParam("rows") Integer pageSize) {

        PageInfo<DuesCollege> pageInfo = duesCollegeService.duesCollegePageList(pageNum, pageSize);
        return new PageBean(pageInfo.getTotal(), pageInfo.getList());
    }

//    /**
//     * 分页查询审批岗位
//     * @param pageNum
//     * @param pageSize
//     * @return
//     */
//    @RequestMapping(value="/approvalJobPageList", method=RequestMethod.POST)
//    @ResponseBody
//    public PageBean approvalJobPageList(@RequestParam("page") Integer pageNum,
//                                        @RequestParam("rows") Integer pageSize){
//
//        PageInfo<SpSpgwb> pageInfo = approvalJobService.approvalJobPageList(pageNum, pageSize);
//        return new PageBean(pageInfo.getTotal(), pageInfo.getList());
//    }




}
