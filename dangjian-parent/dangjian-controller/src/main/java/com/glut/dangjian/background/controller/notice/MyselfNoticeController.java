package com.glut.dangjian.background.controller.notice;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.notice.service.NoticeService;
import com.glut.dangjian.entity.notice.Notice;
import com.glut.dangjian.entity.notice.NoticeRange;
import com.glut.dangjian.entity.notice.view.ViewMyselfNotice;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.pojo.PageBean;

/**
 * 
 * @author XuLanKong
 *
 */
@Controller
@RequestMapping("back/notice/myself/")
public class MyselfNoticeController {

    private static final String LIST = "background/notice/myselfNotice";
    
    @Autowired
    private NoticeService noticeService;
    
    /**
     * 进入个人通知
     * @return
     */
    @RequestMapping("toList")
    public String gotoList() {
        return LIST;
    }
    
    /**
     * 分页查询个人通知
     * @param pageNum
     * @param pageSize
     * @param notice
     * @return
     */
    @RequestMapping(value="getMyselfNoticePageList", method=RequestMethod.POST)
    @ResponseBody
    public PageBean getMyselfNoticePageList(@RequestParam("page") Integer pageNum,  
            @RequestParam("rows") Integer pageSize, ViewMyselfNotice viewMyselfNotice) {
        
        PageInfo<ViewMyselfNotice> pageInfo =  noticeService.getMyselNoticePageList(pageNum, pageSize, viewMyselfNotice);
        PageBean pageBean = new PageBean(pageInfo.getTotal(), pageInfo.getList());
        return pageBean;
    }
    
    /*
     * 批量删除通知范围
     */
    @RequestMapping(value="deleteMyselfNoticeBatch/{ids}", method=RequestMethod.POST)
    @ResponseBody
    public void deleteNoticRangeeBatch(@PathVariable("ids") String ids) {
        
        String[] MyselfNoticeId = ids.split(",");
        noticeService.deleteNoticeBatch(MyselfNoticeId);
    }
    
    
    
}
