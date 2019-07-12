package com.glut.dangjian.background.controller.other;

import java.util.Date;
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
import com.glut.dangjian.background.other.service.PartyInfoService;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.other.PartyInfo;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewPartyinfo;
import com.glut.dangjian.pojo.PageBean;

/** 
* @author xulankong
* @date 创建时间:  2018年11月30日 下午5:25:13
* @version 1.0
*/

@Controller
@RequestMapping("back/partyInfo/")
public class PartyInfoController {

    private static final String LIst = "background/partinfo/partInfo";
    
    private static final String PARTINFORMATIONDETAIL = "background/partinfo/partinformationDetail";
    
    @Autowired
    private PartyInfoService partyInfoService;
    
    @RequestMapping("toList")
    public String tolist() {
        return LIst;
    }
    
    /**
     * 党籍信息展示
     * @param id
     * @param map
     * @return
     */
    @RequestMapping("toDetail/{id}")
    public String toDetail(@PathVariable("id") String id, Map<String, Object> map) {
        
        ViewPartyinfo viewPartyinfo = partyInfoService.getViewPartyinfoByUserId(id);
        map.put("viewPartyinfo", viewPartyinfo);
        return PARTINFORMATIONDETAIL;
    }
    
    
    /**
     * 分页查询党籍信息
     * @param pageNum
     * @param pageSize
     * @param viewPartyinfo 党籍视图
     * @return
     */
    @RequestMapping(value="partyInfoList")
    @ResponseBody
    public PageBean getPartyInfoList(@RequestParam("page") Integer pageNum, 
            @RequestParam("rows") Integer pageSize, ViewPartyinfo viewPartyinfo) {
        
        PageInfo<ViewPartyinfo> pageInfo = partyInfoService.getPageList(pageNum, pageSize, viewPartyinfo);
        PageBean pageBean = new PageBean(pageInfo.getTotal(), pageInfo.getList());
        return pageBean;
    }
    
    /**
     * 添加党籍
     * @param partyInfo
     * @param session
     * @return
     */
    @RequestMapping(value="save", method=RequestMethod.POST)
    @ResponseBody
    public Result save(PartyInfo partyInfo,HttpSession session) {
        
        Yhb yhb  = (Yhb) session.getAttribute("yhb");
        ViewPartyinfo party = partyInfoService.getParty(yhb);
        if (party != null) {
            return new Result(1, "党籍已存在", null);
        }
        partyInfo.setSqsj(new Date());
        partyInfoService.save(partyInfo);
        return new Result(0, null, null);
    }
    
    /**
     * 修改党籍
     * @param partyInfo
     * @return
     */
    @RequestMapping(value="update", method=RequestMethod.POST)
    @ResponseBody
    public Result update(PartyInfo partyInfo) {
        partyInfoService.update(partyInfo);
        return new Result(0, null, null);
    }
    
    /**
     * 批量删除党籍
     * @param id
     */
    @RequestMapping(value="deleteBatch/{id}", method=RequestMethod.POST)
    @ResponseBody
    public Result deleteBatch(@PathVariable("id") String id) {
        partyInfoService.deleteBatch(id);
        return new Result(0, null, null);
    }
}
