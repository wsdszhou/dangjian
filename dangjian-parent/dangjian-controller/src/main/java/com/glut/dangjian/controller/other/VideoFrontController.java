package com.glut.dangjian.controller.other;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.news.view.ViewNews;
import com.glut.dangjian.entity.other.Sp;
import com.glut.dangjian.pojo.VideoDto;
import com.glut.dangjian.service.other.VideoFrontService;

/** 
* @author xulankong
* @date 创建时间:  2018年12月21日 下午7:00:55
* @version 1.0
*/
@RestController
@CrossOrigin(methods = RequestMethod.GET)
@RequestMapping(value="mobile/video/")
public class VideoFrontController {

    @Autowired
    private VideoFrontService videoFrontService;
    
    /**
     * 分页查询网络党校视频列表
     * @return
     */
    @RequestMapping(value="videoPageList")
    public Result getVideoPageList( @RequestParam("page") Integer pageNum,
            @RequestParam("limit") Integer pageSize) {
       
        PageInfo<Sp> pageInfo = videoFrontService.getVideoPageList(pageNum, pageSize);
        return new Result(0, null, pageInfo.getList());
    }
    
    /**
     * 获取单个网络党校视频列表
     * @return
     */
    @RequestMapping(value="getSingleVideo")
    public Result getSingleVideo( @RequestParam("videoId") String videoId ) {
        Sp sp = videoFrontService.getSingleVideo(videoId);
        return new Result(0, null, sp);
    }
}
