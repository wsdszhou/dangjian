package com.glut.dangjian.background.controller.notice;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.glut.dangjian.background.notice.service.NoticeObjectService;
import com.glut.dangjian.background.notice.service.NoticeService;
import com.glut.dangjian.entity.notice.view.ViewNotice;

/** 
* @author xulankong
* @date 创建时间:  2018年11月27日 下午8:05:43
* @version 1.0
*/
@Controller
@RequestMapping("/back/notice/")
public class NoticeController {

    private static final String NOTICE= "background/information/notice";
    
    @Autowired
    private NoticeObjectService noticeObjectService;
    
    /**
     * 查看通知内容
     * @param noticeId
     * @param map
     * @return
     */
    @RequestMapping(value="{id}", method=RequestMethod.GET)
    public String getViewNotice(@PathVariable("id") String noticeId, Map<String, Object> map ) {
        //TODO 根据通知ID，查不出内容

        /**
         * 2019.01.04
         * 已修改，但不知道是否是需要的那样
         */
        ViewNotice viewNotice = noticeObjectService.getViewNoticeByNoticeId(noticeId);
        map.put("viewNotice", viewNotice);
        return NOTICE;
    }
    
    /**
     * 阅读通知
     */
    @RequestMapping(value="readNotice/{id}", method=RequestMethod.POST)
    @ResponseBody
    public void readNotice(@PathVariable("id") String noticeId) {
        noticeObjectService.readNotice(noticeId);
    }
    
    
}
