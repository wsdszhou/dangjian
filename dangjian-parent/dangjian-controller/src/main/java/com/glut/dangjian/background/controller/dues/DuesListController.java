package com.glut.dangjian.background.controller.dues;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.dues.service.DuesBranchService;
import com.glut.dangjian.background.dues.service.DuesListService;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.dues.DuesBranch;
import com.glut.dangjian.entity.dues.view.ViewDuesList;
import com.glut.dangjian.pojo.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("back/dues/list/")
public class DuesListController {


    @Autowired
    DuesBranchService duesBranchService;

    @Autowired
    DuesListService duesListService;

    private static final String  DUESLIST ="background/dues/duesList";

    /**
     * 进入党费列表
     * @return
     */
    @RequestMapping(value = "{branchId}",method= RequestMethod.GET)
    public String toDuesList(@PathVariable("branchId") Integer branchId, Map<String, Object> map) {

        DuesBranch branch = duesBranchService.getBranchById(branchId);
        map.put("branch", branch);
        return DUESLIST;
    }


    /**
     * 分页查询党费列表
     * @return
     */
    @RequestMapping(value = "duesPageList/{branchId}",method = RequestMethod.POST)
    @ResponseBody
    public PageBean duesPageList(@RequestParam("page") Integer pageNum,
                                 @RequestParam("rows") Integer pageSize,@PathVariable("branchId") Integer branchId, ViewDuesList viewDuesList){
        viewDuesList.setBranchId(branchId);
        PageInfo<ViewDuesList> pageInfo = duesListService.duesPageList(pageNum,pageSize,viewDuesList);
        PageBean pageBean = new PageBean(pageInfo.getTotal(), pageInfo.getList());
        return pageBean;
    }

    /**
     * 党费提醒
     * @return
     */
    @RequestMapping(value="duesNotice/{listIds}", method=RequestMethod.POST)
    @ResponseBody
    public Result duesNotice(@PathVariable("listIds") String listIds){
        String[] listId = listIds.split(",");
        duesListService.duesNotice(listId);
        return new Result(0, null, null);
    }

}
