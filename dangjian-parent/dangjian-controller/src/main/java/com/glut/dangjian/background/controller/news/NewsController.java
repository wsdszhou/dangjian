package com.glut.dangjian.background.controller.news;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.news.service.NewStateService;
import com.glut.dangjian.background.news.service.NewsService;
import com.glut.dangjian.background.news.service.OtherFileService;
import com.glut.dangjian.background.news.service.PictureService;
import com.glut.dangjian.background.news.service.VideoService;
import com.glut.dangjian.background.user.service.YhxxService;
import com.glut.dangjian.config.UrlConfig;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.news.XwPlb;
import com.glut.dangjian.entity.news.XwQtwjb;
import com.glut.dangjian.entity.news.XwTpb;
import com.glut.dangjian.entity.news.XwZtb;
import com.glut.dangjian.entity.news.Xwb;
import com.glut.dangjian.entity.news.view.ViewNewsComment;
import com.glut.dangjian.entity.notice.NoticeObject;
import com.glut.dangjian.entity.other.Lmb;
import com.glut.dangjian.entity.other.Sp;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewYhxx;
import com.glut.dangjian.pojo.PageBean;
import com.glut.dangjian.utils.StringTools;
import com.glut.dangjian.utils.UploadFileUtils;

import net.sf.json.JSONArray;
/**
 * 
 * @author XuLanKong
 *
 */
@Controller
@RequestMapping("back/news/")
public class NewsController {
    
    private static final String NEWSLIST = "background/news/newList";
    
    private static final String NEWSDISPLAY = "background/news/newsDisplay";
    
    @Autowired
    private NewsService newsService;
    
    @Autowired
    private YhxxService yhxxService ;
    
    @Autowired
    private PictureService pictureService;
    
    @Autowired
    private VideoService videoService;
    
    @Autowired
    private OtherFileService otherFileService;
    
    @Autowired
    private NewStateService  newStateService;
    
    /**
     * 上传缩略图
     * @param uploadFile
     * @param request
     * @param session
     * @param map
     * @return
     */
    @RequestMapping(value="uploadCorePicture",method=RequestMethod.POST)
    @ResponseBody
    public Result uploadCorePicture(@RequestParam MultipartFile uploadFile, HttpServletRequest request,
            HttpSession session,Map<String, Object> map) {
        
       //得到项目的绝对路径
        String rootPath = request.getServletContext().getRealPath(UrlConfig.NEWS);
        String saveUrl = request.getContextPath() +"/" + UrlConfig.NEWS;
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
        return new Result(0, null, (String)map.get("src"));
    }
    
    /**
     * 获取评论
     * @param commentId
     * @return
     */
    @RequestMapping(value="comment/{commentId}",method=RequestMethod.GET)
    public ViewNewsComment getViewNewsComment(@PathVariable("commentId") String commentId) {
        
        return newsService.getViewNewsComment(commentId);
    }
    
    /**
     * 获取评论
     * @param commentId
     * @return
     */
    @RequestMapping(value="getViewNewsCommentByNoticeId/{noticeId}",method=RequestMethod.GET)
    @ResponseBody
    public ViewNewsComment getViewNewsCommentByNoticeId(@PathVariable("noticeId") String noticeId) {
        
        return newsService.getViewNewsCommentByNoticeIId(noticeId);
    }
    
    /**
     * 展示新闻页面
     * @param id
     * @param map
     * @return
     */
    @RequestMapping("/notice/{id}")
    public String getNewsDisplayByNoticeId(@PathVariable("id") String id,
            Map<String, Object> map, HttpSession session) {
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        Xwb xwb  = newsService.getNewsByNoticeId(id);
        int approval = newsService.getJudeIsApprovalByNoticeId(id, yhb.getUserId());
        map.put("xwb", xwb);
        map.put("approval", approval);
        return NEWSDISPLAY;
    }
    
    /**
     * 获取单个新闻内容
     * @param id
     * @param map
     * @return
     */
    @RequestMapping("{id}")
    public String getNewsById(@PathVariable("id") String id,Map<String, Object> map) {
        
        Xwb xwb  = newsService.getNewsById(id);
        List<NoticeObject> noticeObjects = newsService.isApproval(xwb.getXwId());
        boolean isApproval = true;
        for(NoticeObject noticeObject : noticeObjects) {
            if (noticeObject.getTzdxSfyd() == 1) {
                isApproval = false;
                break;
            }
        }
        map.put("xwb", xwb);
        map.put("isApproval", isApproval);
        return NEWSDISPLAY;
    }

    
    /**
     * 进入新闻列表
     * @param session
     * @param map
     * @return
     */
    @RequestMapping("gotoNewList")
    public String gotoNewList( HttpSession session, Map<String, Object> map) {
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        ViewYhxx viewYhxx = yhxxService.getYhxxByYhId(yhb.getUserId());
        ViewYhxx myviewYhxx = new ViewYhxx();
        myviewYhxx.setYhxxXm(viewYhxx.getYhxxXm());
        myviewYhxx.setBmMc(viewYhxx.getZbMc());
        map.put("viewYhxx", myviewYhxx);
        session.setAttribute("currentLmId", 5);
        return NEWSLIST;
    }


    /**
     * 根据通知ID获取新闻评论的内容
     * @param noticeId
     * @return
     */
    @RequestMapping("getNewsCommentByNoticeId/{noticeId}")
    public ViewNewsComment getNewsCommentByNoticeId(@PathVariable("noticeId") String noticeId){
        //1.查出新闻评论的ID
        String commentId = null;
        return newsService.getViewNewsComment(commentId);
    }
    
    /**
     * 开启评论
     * @param newId
     * @return
     */
    @RequestMapping(value="openComment/{newId}",method=RequestMethod.POST)
    @ResponseBody
    public String openComment( @PathVariable("newId") String newId) {
        
        newsService.openCommentByNewId(newId);
        return "defeat";
    }
    
    /**
     * 关闭评论
     * @param newId
     * @return
     */
    @RequestMapping(value="closeComment/{newId}",method=RequestMethod.POST)
    @ResponseBody
    public String closeComment( @PathVariable("newId") String newId) {
        
        newsService.closeComment(newId);
        return "defeat";
    }
    
    /**
     * 根据栏目id加载新闻列表
     * @param lmId
     * @return
     */
    @RequestMapping("loadNewsListByLmId")
    @ResponseBody
    public String loadNewsListByLmId(@RequestParam("lmId") Integer lmId,HttpSession session) {
        
        List<Xwb> xwbs = null;
        if (lmId != null) {
            xwbs =  newsService.getNewsTitleAndIdListByLmId(lmId);
            session.setAttribute("currentLmId", lmId);
        }else {
            xwbs = newsService.getNewsAllTitleAndIdList();
            session.setAttribute("currentLmId", lmId);
        }
        String json = JSONArray.fromObject(xwbs).toString();
        return json;
    }
    
    /**
     * 分页查询新闻列表
     * @param pageNum
     * @param pageSize
     * @param
     * @return
     */
    @RequestMapping(value="loadNewsPage/{lmId}", method=RequestMethod.POST)
    @ResponseBody
    public PageBean getNewsPageList(@RequestParam("page") Integer pageNum, Xwb  xwb,
            @RequestParam("rows") Integer pageSize, @PathVariable("lmId") Integer lmId, HttpSession session) {

        if (lmId != null) {
            xwb.setXwLmdm(new Lmb(lmId));
        }
        session.setAttribute("currentLmId", lmId);
        PageInfo<Xwb> info = newsService.getNewsPageList(pageNum, pageSize, xwb);
        PageBean pageBean = new PageBean( info.getTotal(), info.getList());
        return pageBean;
    }
    
    /**
     * 文件上传
     * @param request 
     * @param
     * @param dirName 上传文件目录
     * @return
     */
    @RequestMapping(value="fileUpload",method=RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadFile(HttpServletRequest request, @RequestParam("imgFile") MultipartFile imgFile,
            @RequestParam("dir") String dirName, HttpSession session ) {
        
        //得到项目的绝对路径
        String rootPath = request.getServletContext().getRealPath("upload/images/news/");
        // 获取当前栏目Id
        Integer lmId = (Integer) session.getAttribute("currentLmId");
        Lmb lmb = new Lmb(lmId);
        UploadFileUtils uploadfileUtils = new UploadFileUtils();
        Map<String, Object> uploadMap = uploadfileUtils.uploadFile(request, imgFile, rootPath, dirName);
        if (uploadMap != null ) {
            if (dirName.equals("file")) {  // 上传的是压缩包
                XwQtwjb otherFile =  new XwQtwjb();
                otherFile.setJqwjId(StringTools.getUUID());
                otherFile.setJqwjSjmc( (String) uploadMap.get("actualName") );
                otherFile.setJqwjXsmc( (String) uploadMap.get("showName") );
                otherFile.setJqwjXdlj( (String) uploadMap.get("url") );
                otherFile.setJqwjJdlj( (String) uploadMap.get("absoluteUrl"));
                otherFile.setJqwjLmdm( lmb );
                String otherFileId = otherFileService.saveOtherFile( otherFile );
                String  otherFileIds =  (String) session.getAttribute("otherFileIds");
                if (otherFileIds != null) {
                    session.setAttribute("otherFileIds",  session.getAttribute("otherFileIds") + "," +otherFileId );
                } else {
                    session.setAttribute("otherFileIds",  otherFileId );
                }
            }  else {  // 上传的是图片
                XwTpb xwTpb = new XwTpb();
                xwTpb.setTpId(  StringTools.getUUID() );
                xwTpb.setTpSjmc( (String) uploadMap.get("actualName") );
                xwTpb.setTpXsmc( (String) uploadMap.get("showName") );
                xwTpb.setTpXdlj( (String) uploadMap.get("url") );
                xwTpb.setTpJdlj( (String) uploadMap.get("absoluteUrl"));
                xwTpb.setTpLmdm( lmb );
                String pictureId = pictureService.saveFarPicture(xwTpb);
                String  pictureIds =  (String) session.getAttribute("pictureIds");
                if (pictureIds != null) {
                    session.setAttribute("pictureIds",  session.getAttribute("pictureIds") + "," +pictureId );
                } else {
                    session.setAttribute("pictureIds",  pictureId );
                }
            }
            return uploadMap;
        } else {
            return null;
        }
        
    }
    
    /**
     * 文件返回管理
     * @param request
     * @param response
     * @param dirName
     */
    @RequestMapping(value = "fileManager", method = RequestMethod.GET)
    public void fileManager(HttpServletRequest request, HttpServletResponse response,
            @RequestParam("dir") String dirName) {
        
        UploadFileUtils uploadfileUtils = new UploadFileUtils();
        uploadfileUtils.fileManager(request, response, dirName);
        
    }
   
    /**
     * 添加新闻
     * @param xwb
     * @param session
     */
    @RequestMapping(value="saveNews", method=RequestMethod.POST)
    @ResponseBody
    public Result saveNews( Xwb xwb, HttpSession session) {
        
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        Integer lmId = (Integer) session.getAttribute("currentLmId");
        xwb.setXwLmdm( new Lmb( lmId ));
        String pictureIds = (String) session.getAttribute("pictureIds");
        String otherFiles = (String) session.getAttribute("otherFileIds");
        newsService.saveNews(xwb, pictureIds,otherFiles, yhb);
        // 清除当前的新闻图片的session域
        session.setAttribute("pictureIds", null);
        session.setAttribute("otherFiles", null);
        return new Result(0, null, null);
    }
    
    /**
     * 修改新闻
     * @param xwb
     * @param session
     * @return
     */
    @RequestMapping(value="updateNews", method=RequestMethod.POST)
    @ResponseBody
    public Result updateNews( Xwb xwb, HttpSession session) {
        
        xwb.setXwLmdm( new Lmb( (Integer)session.getAttribute("currentLmId") ));
        String pictureIds = (String) session.getAttribute("pictureId");
        newsService.updateNews(xwb, (Yhb)session.getAttribute("yhb") , pictureIds);
        // 清除当前的新闻图片的session域
        session.setAttribute("pictureId", null);
        return new Result(0, null, null);
    }
    
    
    /**
     * 加载新闻状态
     * @return
     */
    @RequestMapping(value="loadNewsState",method=RequestMethod.POST)
    @ResponseBody
    public List<XwZtb> loadNewsState() { 
        
        return newStateService.getNewsStateListAll();
    }
    
    /**
     * 删除新闻
     * @param ids
     * @param request
     * @return
     */
    @RequestMapping(value="deleteNewsBatch/{ids}", method=RequestMethod.POST)
    @ResponseBody
    public Result deleteNewsBatch(@PathVariable("ids") String ids,  HttpServletRequest request) {
        String[] newsIds = ids.split(","); 
        newsService.deleteNewsBatch(request, newsIds);
        return new Result(0, null, null);
    }
}
