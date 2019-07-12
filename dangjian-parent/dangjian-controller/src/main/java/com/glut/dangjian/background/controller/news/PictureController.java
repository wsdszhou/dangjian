package com.glut.dangjian.background.controller.news;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.news.service.PictureService;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.news.XwTpb;
import com.glut.dangjian.pojo.PageBean;

@Controller
@RequestMapping("back/news/picture/")
public class PictureController {
    
    // 图片列表
    private static final String PICTURE = "background/system/picture/pictureList";

    @Autowired
    private PictureService pictureService;
    
    @RequestMapping
    public String gotopicture() {
        return PICTURE;
    }
    
    /**
     * 加载图片列表
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping(value="pictureList")
    @ResponseBody
    public PageBean picturePageList(@RequestParam("page") Integer pageNum, 
            @RequestParam("rows") Integer pageSize, XwTpb xwTpb) {

        // 获取分页数据
        PageInfo<XwTpb> pageInfo = pictureService.getLocalXwTpbPageList(pageNum, pageSize, xwTpb);
        // 把分页数据封装到pageBean中
        PageBean pageBean = new PageBean(pageInfo.getTotal(), pageInfo.getList());
        return pageBean;
        
    }
    
    /**
     * 批量删除图片
     * @param ids
     * @return
     */
    @RequestMapping(value="deletePictureBatchPicture/{ids}",method=RequestMethod.POST)
    @ResponseBody
    public Result deletePictureBatchPicture(@PathVariable("ids") String ids) {
        
        String[] tpIds = ids.split(","); 
        pictureService.deletePictureBatchPicture(tpIds);
        return new Result(0, null, null);
    }
    
}
