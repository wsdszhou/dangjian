package com.glut.dangjian.background.controller.other;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.news.service.PictureService;
import com.glut.dangjian.background.news.service.VideoService;
import com.glut.dangjian.config.UrlConfig;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.news.XwTpb;
import com.glut.dangjian.entity.other.Sp;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewYhxx;
import com.glut.dangjian.pojo.PageBean;
import com.glut.dangjian.pojo.VideoDto;
import com.glut.dangjian.utils.StringTools;
import com.glut.dangjian.utils.UploadFileUtils;

@Controller
@RequestMapping("back/video/")
public class ViedeoController {

    // 视频列表
    private static final String VIDEO = "background/video/videoList";

    @Autowired
    private VideoService videoService;

    @Autowired
    private PictureService pictureService;
    
    /**
     * 跳转到视频
     * @return
     */
    @RequestMapping("toList")
    public String toVideoList() {
        return VIDEO;
    }
    
    /**
     * 分页查询视频
     * @param pageNum
     * @param pageSize
     * @param xwSp
     * @return
     */
    @RequestMapping(value="videoList")
    @ResponseBody
    public PageBean videoPageList(@RequestParam("page") Integer pageNum, 
            @RequestParam("rows") Integer pageSize, Sp xwSp) {
        
        PageInfo<Sp> pageInfo = videoService.getVideoPageList(pageNum, pageSize, xwSp);
        PageBean pageBean = new PageBean(pageInfo.getTotal(), pageInfo.getList());
        return pageBean;
    }
    
    /**
     * 上传视频
     * @param uploadFile
     * @param request
     * @param map
     * @return
     */
    @ResponseBody
    @RequestMapping(value="uploadVideoSlt", method=RequestMethod.POST)
    public Result uploadHonor(@RequestParam MultipartFile uploadFile, HttpServletRequest request,
            Map<String, Object> map, HttpSession session) {
        
        //得到项目的绝对路径
        String rootPath = request.getServletContext().getRealPath(UrlConfig.VIDEOSLT);
        String saveUrl = request.getContextPath() +"/" + UrlConfig.VIDEOSLT;
        UploadFileUtils uploadFileUtils = new UploadFileUtils();
        map = uploadFileUtils.uploadFile(uploadFile, request, rootPath, saveUrl, map);
        XwTpb xwTpb = new XwTpb();
        xwTpb.setTpId(StringTools.getUUID());
        xwTpb.setTpXdlj((String) map.get("src"));
        String pictureId = pictureService.saveFarPicture(xwTpb);
        String  pictureIds =  (String) session.getAttribute("pictureIds");
        if (pictureIds != null) {
            session.setAttribute("pictureIds",  session.getAttribute("pictureIds") + "," +pictureId );
        } else {
            session.setAttribute("pictureIds",  pictureId );
        }
        return new Result(0, null, map);
    }
    
    /**
     * 上传视频
     * @param uploadFile
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value="fileUpload", method=RequestMethod.POST)
    public VideoDto uploadLogo(@RequestParam MultipartFile uploadFile, HttpServletRequest request) {
        //得到项目的绝对路径
        String saveUrl = UrlConfig.VIDEO;
        UploadFileUtils uploadFileUtils = new UploadFileUtils();
        return uploadFileUtils.uploadVideo(uploadFile, request, saveUrl, new VideoDto());
    }
    
    /**
     * 保存视频
     * @return
     */
    @RequestMapping(value="saveVideo", method=RequestMethod.POST)
    @ResponseBody
    public Result saveVideo(Sp sp,HttpSession session) {
        Yhb yhb  = (Yhb) session.getAttribute("yhb");
        String pictureIds = (String) session.getAttribute("pictureIds");
        sp.setSpScyhdm(new ViewYhxx(  yhb.getUserId()) );
        videoService.saveVideo(sp, pictureIds,yhb);
     // 清除当前的新闻图片的session域
        session.setAttribute("pictureIds", null);
        return new Result(0, null, null);
    }
    
    /**
     * 修改视频信息
     * @param xwSp
     * @return
     */
    @RequestMapping(value="updateVideo", method=RequestMethod.POST)
    @ResponseBody
    public Result updateVideo(Sp xwSp) {
        System.err.println(xwSp);
        videoService.updateVideo(xwSp);
        return new Result(0, null, null);
    }
    
    
    /**
     * 批量删除视频
     * @param ids
     * @return
     */
    @RequestMapping(value="deleteBatchVideo/{ids}")
    public Result deleteBatchVIDEO(@PathVariable("ids") String ids,HttpServletRequest request) {
        
        String[] videoIds = ids.split(",");
        String rootPath = request.getServletContext().getRealPath("/");
        videoService.deleteBatchPicture(videoIds,rootPath);
        return new Result(0, null, null);
    }
    
}
