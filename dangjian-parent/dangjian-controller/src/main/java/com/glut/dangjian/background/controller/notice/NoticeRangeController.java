package com.glut.dangjian.background.controller.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.notice.service.NoticeRangeService;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.notice.NoticeRange;
import com.glut.dangjian.pojo.PageBean;

/**
 * 
 * @author XuLanKong
 *
 */
@Controller
@RequestMapping("back/notice/range/")
public class NoticeRangeController {

    private static final String LIST = "background/notice/noticeTypeList";
    
    @Autowired
    private NoticeRangeService noticeRangeService;
    
    @RequestMapping("toList")
    public String gotoList() {
        return LIST;
    }
    
    /**
     * 分页查询
     * @param pageNum
     * @param pageSize
     * @param noticeRange
     * @return
     */
    @RequestMapping(value="getNoticeRangePageList", method=RequestMethod.POST)
    @ResponseBody
    public PageBean getNoticeRangePageList(@RequestParam("page") Integer pageNum,  
            @RequestParam("rows") Integer pageSize, NoticeRange noticeRange) {
        
        PageInfo<NoticeRange> pageInfo =  noticeRangeService.getNoticeRangePageList(pageNum, pageSize, noticeRange);
        PageBean pageBean = new PageBean(pageInfo.getTotal(), pageInfo.getList());
        return pageBean;
    }
    
    /**
     * 添加通知范围
     * @param noticeRange
     */
    @RequestMapping(value="addNoticeRange", method=RequestMethod.POST)
    @ResponseBody
    public Result addNoticeRange(NoticeRange noticeRange) {
        
        noticeRangeService.addNoticeRange(noticeRange);
        return new Result(0, null, null);
    }

    /**
     * 修饰该通知范围
     * @param noticeRange
     * @return
     */
    @RequestMapping(value="updateNoticeRange", method=RequestMethod.POST)
    @ResponseBody
    public Result updateNoticeRange(NoticeRange noticeRange) {
        
        noticeRangeService.updateNoticeRange(noticeRange);
        return new Result(0, null, null);
    }
    
    /*
     * 批量删除通知范围
     */
    @RequestMapping(value="deleteNoticRangeeBatch/{ids}", method=RequestMethod.POST)
    @ResponseBody
    public Result deleteNoticRangeeBatch(@PathVariable("ids") String ids) {
        
        String[] noticeRangeId = ids.split(",");
        noticeRangeService.deleteNoticRangeeBatch(noticeRangeId);
        return new Result(0, null, null);
    }
    
    @RequestMapping(value="loadNoticeRange/{name}", method=RequestMethod.POST)
    @ResponseBody
    public List<NoticeRange> loadNoticeRange(@PathVariable("name") String name){
        
        List<NoticeRange> noticeRanges = noticeRangeService.loadNoticeRange(name);
        return noticeRanges;
    }
}
