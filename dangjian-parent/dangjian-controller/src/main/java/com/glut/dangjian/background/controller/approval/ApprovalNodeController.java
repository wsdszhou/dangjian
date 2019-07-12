package com.glut.dangjian.background.controller.approval;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.request;

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
import com.glut.dangjian.background.approval.service.ApprovalNodeService;
import com.glut.dangjian.entity.approval.SpLcxmb;
import com.glut.dangjian.entity.approval.SpSpjdb;
import com.glut.dangjian.entity.approval.SpSplcb;
import com.glut.dangjian.entity.approval.view.ViewApprovalNode;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.pojo.PageBean;

/**
 * 
 * @author XuLanKong
 *
 */
@Controller
@RequestMapping("back/approval/node/")
public class ApprovalNodeController {

    private static final String NODELIST = "background/approval/approvalNodeList";
    
    @Autowired
    private ApprovalNodeService approvalNodeService;
   
    /**
     * 进入审批界节点列表
     * @param splcId
     * @param map
     * @return
     */
    @RequestMapping(value = "{splcId}")
    public String gotoNodeList(@PathVariable("splcId") Integer splcId, Map<String, Object> map) {
       
        map.put("map", splcId);
        return NODELIST;
        
    }
    
    /**
     * 分页查询所有审批流程所有节点
     * @param pageNum
     * @param pageSize
     * @param splcId
     * @return
     */
    @RequestMapping(value="list/{splcId}", method=RequestMethod.POST)
    @ResponseBody
    public PageBean NodePageList(@RequestParam("page") Integer pageNum,
            @RequestParam("rows") Integer pageSize, @PathVariable("splcId") Integer splcId) {
        
        PageInfo<ViewApprovalNode> pageInfo = approvalNodeService.nodePageListBySplcId(pageNum, pageSize, splcId);
        PageBean pageBean = new PageBean(pageInfo.getTotal(), pageInfo.getList());
        return pageBean;
    }
    
    /**
     * 添加审批节点
     * @param spjdb
     * @param splcId
     * @param map
     * @return
     */
    @RequestMapping(value="saveApprovalNode/{splcId}", method=RequestMethod.POST)
    @ResponseBody
    public Result saveApprovalNode( SpSpjdb spjdb, @PathVariable("splcId") Integer splcId, Map<String, Object> map) {
        spjdb.setSpjdLcdm( new SpSplcb( splcId ) );
        approvalNodeService.saveApprovalNode(spjdb);
        return new Result(0, null, null);
    }
    
    /**
     * 修改审批节点信息
     */
    @RequestMapping(value="updateApprovalNodeInformat/{splcId}", method=RequestMethod.POST)
    @ResponseBody
    public Result updateApprovalNodeInformat( SpSpjdb spjdb, @PathVariable("splcId") Integer splcId, Map<String, Object> map) {
        
        spjdb.setSpjdLcdm( new SpSplcb( splcId ) );
        approvalNodeService.updateApprovalNodeInformat(spjdb);
        return new Result(0, null, null);
    }
    
    /**
     * 删除审批节点
     */
    @RequestMapping(value="deleteApprovalBatch/{nodeId}/{processId}", method=RequestMethod.POST)
    @ResponseBody
    public Result deleteApprovalBatch(@PathVariable("nodeId") Integer nodeId,
            @PathVariable("processId") Integer processId) {
        approvalNodeService.deleteApprovalBatch(nodeId, processId);
        return new Result(0, null, null);
    }
    
    
    
    /**
     * 加载审批流程的所有节点
     * @param splcId
     * @return
     */
    @RequestMapping(value="loadNodeApproval/{splcId}", method=RequestMethod.POST)
    @ResponseBody
    public List<SpSpjdb> loadNextApproval(@PathVariable("splcId") Integer splcId){
        if (splcId == 0) {
            splcId = null;
        }
        List<SpSpjdb> spjdbs = approvalNodeService.loadNodeApprovalBySplcId(splcId);
        return spjdbs;
    }
   
    
}
