package com.glut.dangjian.background.controller.notice;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

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
@RequestMapping("back/notice/school/")
public class SchoolNoticeController {

    private static final String LIST = "background/notice/schoolNotice";
    
    @Autowired
    private NoticeService noticeService;
    
    @RequestMapping("toList")
    public String gotoList() {
        return LIST;
    }
    
    /**
     * 分页查询学校通知
     * @param pageNum
     * @param pageSize
     * @param notice
     * @return
     */
    @RequestMapping(value="getSchoolNoticePageList", method=RequestMethod.POST)
    @ResponseBody
    public PageBean getSchoolNoticePageList(@RequestParam("page") Integer pageNum,  
            @RequestParam("rows") Integer pageSize, Notice notice) {

        System.out.println(notice);
        
        notice.setTzFwdm(new NoticeRange("全校"));
        PageInfo<Notice> pageInfo =  noticeService.getNoticePageList(pageNum, pageSize, notice);
        return new PageBean(pageInfo.getTotal(), pageInfo.getList());
    }
    
    /**
     * 添加通知范围
     * @param
     */
    @RequestMapping(value="addSchoolNotice", method=RequestMethod.POST)
    @ResponseBody
    public Result addSchoolNotice(String data, HttpSession session) throws UnsupportedEncodingException {

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
        noticeService.addNotice(notice);
        return new Result(0, null, null);
    }

    /**
     * 修饰该通知范围
     * @param
     * @return
     */
    @RequestMapping(value="updateSchoolNotice", method=RequestMethod.POST)
    @ResponseBody
    public Result updateSchoolNotice(String data) {
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
    @RequestMapping(value="deleteSchoolNoticeBatch/{ids}", method=RequestMethod.POST)
    @ResponseBody
    public Result deleteNoticRangeeBatch(@PathVariable("ids") String ids) {
        
        String[] SchoolNoticeId = ids.split(",");
        noticeService.deleteNoticeBatch(SchoolNoticeId);
        return new Result(0,null,null);
    }
    
}
