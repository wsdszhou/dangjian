package com.glut.dangjian.background.controller.log;
/** 
* @author xulankong
* @date 创建时间:  2018年12月4日 下午1:04:39
* @version 1.0
*/

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.log.service.OperationLogService;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.view.ViewLog;
import com.glut.dangjian.pojo.PageBean;

@Controller
@RequestMapping("back/log/")
public class LogController {
    
    private static final String List = "background/log/logList";

    @Autowired
    private OperationLogService operationLogService;
    
    @RequestMapping("toList")
    public String toList() {
        return List;
    }
    
    
    /**
     * 分页查询
     * @param pageNum
     * @param pageSize
     * @param
     * @return
     */
    @RequestMapping(value="getLogPageList", method=RequestMethod.POST)
    @ResponseBody
    public PageBean getLogPageList(@RequestParam("page") Integer pageNum,  
            @RequestParam("rows") Integer pageSize, String data) {

        JSONObject jsonObject = JSONObject.parseObject(data);
        ViewLog viewLog = new ViewLog();
        if(jsonObject != null){
            if(!"".equals(jsonObject.getString("type"))){
                viewLog.setOperation(jsonObject.getString("type"));
            }
            if(!"".equals(jsonObject.getString("createTime"))){
                viewLog.setCreateTime(jsonObject.getDate("createTime"));
            }
            if(!"".equals(jsonObject.getString("endTime"))){
                viewLog.setEndTime(jsonObject.getDate("endTime"));
            }
        }

        PageInfo<ViewLog> pageInfo =  operationLogService.getLogPageList(pageNum, pageSize, viewLog);
        PageBean pageBean = new PageBean(pageInfo.getTotal(), pageInfo.getList());
        return pageBean;
    }
    
    @RequestMapping(value="deleteBatch/{id}",method=RequestMethod.POST)
    @ResponseBody
    public Result deleteBatch(@PathVariable("id") String id) {
        operationLogService.deleteBatch(id);
        return new Result(0, null, null);
    }
}
