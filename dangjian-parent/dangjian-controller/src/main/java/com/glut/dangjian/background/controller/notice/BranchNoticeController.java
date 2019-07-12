package com.glut.dangjian.background.controller.notice;

import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.notice.service.NoticeService;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.notice.Notice;
import com.glut.dangjian.entity.notice.NoticeRange;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewYhxx;
import com.glut.dangjian.pojo.PageBean;

/**
 * 
 * @author XuLanKong
 *
 */
@Controller
@RequestMapping("back/notice/branch/")
public class BranchNoticeController {

    private static final String LIST = "background/notice/branchNotice";
    
    @Autowired
    private NoticeService noticeService;
    
    @RequestMapping("toList")
    public String gotoList() {
        return LIST;
    }

    /**
     * 分页查询
     * @param pageNum
     * @param pageSize
     * @param notice
     * @return
     */
    
    
    @RequestMapping(value="getBranchNoticePageList", method=RequestMethod.POST)
    @ResponseBody
    public PageBean getBranchNoticePageList(@RequestParam("page") Integer pageNum,  
            @RequestParam("rows") Integer pageSize, Notice notice) {
        
        notice.setTzFwdm(new NoticeRange("支部"));
        PageInfo<Notice> pageInfo =  noticeService.getNoticePageList(pageNum, pageSize, notice);
        PageBean pageBean = new PageBean(pageInfo.getTotal(), pageInfo.getList());
        for(Object str : pageBean.getRows()) {
            System.err.println(str);
        }
        return pageBean;
    }
    
    
    /**
     * 添加支部通知
     * @param
     */
    @RequestMapping(value="addBranchNotice", method=RequestMethod.POST)
    @ResponseBody
    public Result addBranchNotice(String data, HttpSession session) {

        if(data == null || "".equals(data)){
            return new Result(1,"参数错误",null);
        }
        //解析字符串
        JSONObject jsonObject = JSON.parseObject(data);
        Notice notice = new Notice();
        notice.setTzBt(jsonObject.getString("tzBt"));
        notice.setTzYxj(jsonObject.getInteger("tzYxj"));
        notice.setTzFbsj(jsonObject.getDate("tzFbsj"));
        notice.setTzJssj(jsonObject.getDate("tzJssj"));
        notice.setTzNr(jsonObject.getString("tzNr"));
        NoticeRange range = new NoticeRange();
        range.setTzfwId(jsonObject.getInteger("tzFwdm.tzfwId"));
        notice.setTzFwdm(range);
        
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        notice.setTzFbrdm(new ViewYhxx(yhb.getUserId()));
        
        noticeService.addBranchNotice(notice);
        return new Result(0, null, null);
    }

    /**
     * 修饰该通知范围
     * @param
     * @return
     */
    @RequestMapping(value="updateBranchNotice", method=RequestMethod.POST)
    @ResponseBody
    public Result updateBranchNotice(String data) {
        if(data == null || "".equals(data)){
            return new Result(1,"参数错误",null);
        }
        //解析字符串
        JSONObject jsonObject = JSON.parseObject(data);
        Notice notice = new Notice();
        notice.setTzId(jsonObject.getString("tzId"));
        notice.setTzBt(jsonObject.getString("tzBt"));
        notice.setTzYxj(jsonObject.getInteger("tzYxj"));
        notice.setTzFbsj(jsonObject.getDate("tzFbsj"));
        notice.setTzJssj(jsonObject.getDate("tzJssj"));
        notice.setTzNr(jsonObject.getString("tzNr"));
        NoticeRange range = new NoticeRange();
        range.setTzfwId(jsonObject.getInteger("tzFwdm.tzfwId"));
        notice.setTzFwdm(range);
        noticeService.updateNotice(notice);
        return new Result(0, null, null);
    }
    
    /*
     * 批量删除通知范围
     */
    @RequestMapping(value="deleteBranchNoticeBatch/{ids}", method=RequestMethod.POST)
    @ResponseBody
    public Result deleteNoticRangeeBatch(@PathVariable("ids") String ids) {
        
        String[] BranchNoticeId = ids.split(",");
        noticeService.deleteNoticeBatch(BranchNoticeId);
        return new Result(0,null,null);
    }
    
}
