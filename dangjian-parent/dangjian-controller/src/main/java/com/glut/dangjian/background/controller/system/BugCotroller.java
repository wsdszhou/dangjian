package com.glut.dangjian.background.controller.system;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.system.service.BugService;
import com.glut.dangjian.entity.other.Bug;
import com.glut.dangjian.entity.system.view.ViewBug;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.pojo.PageBean;

/** 
* @author xulankong
* @date 创建时间:  2018年12月18日 下午6:56:49
* @version 1.0
*/
@Controller
@RequestMapping("back/bug/")
public class BugCotroller {
    
    private static final String  BUG = "background/information/bugDisplay";
    
    @Autowired
    private BugService bugService;
    
    /**
     * 加载bug
     */
    @RequestMapping(value="getBugPageList", method=RequestMethod.POST)
    @ResponseBody
    public PageBean getBugPageList(@RequestParam("page") Integer pageNum,  
            @RequestParam("rows") Integer pageSize) {
        
        PageInfo<ViewBug> pageInfo = bugService.getBugPageList(pageNum, pageSize);
        return new PageBean(pageInfo.getTotal(), pageInfo.getList());
    }
    
    /**
     * 展示一个bug详细信息
     */
    @RequestMapping(value="{id}", method=RequestMethod.GET)
    public String toBugInfomation(@PathVariable("id") String id, Map<String, Object> map) {
        
        ViewBug viewBug = bugService.getBug(id);
        map.put("viewBug", viewBug);
        return BUG;
    }
    
    /**
     * 系统反馈
     * @param bug
     * @param session
     */
    @RequestMapping(value="add",method=RequestMethod.POST)
    @ResponseBody
    public void addBug(Bug bug, HttpSession session) {
        Yhb yhd = (Yhb) session.getAttribute("yhb");
        bug.setYhdm(yhd);
        bugService.addBug(bug);
    }
}
