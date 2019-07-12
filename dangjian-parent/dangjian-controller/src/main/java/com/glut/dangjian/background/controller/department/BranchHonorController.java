package com.glut.dangjian.background.controller.department;

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
import com.glut.dangjian.background.department.service.BranchHonorService;
import com.glut.dangjian.background.news.service.PictureService;
import com.glut.dangjian.config.UrlConfig;
import com.glut.dangjian.entity.branch.Zbry;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.news.XwTpb;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.pojo.PageBean;
import com.glut.dangjian.utils.StringTools;
import com.glut.dangjian.utils.UploadFileUtils;

/** 
* @author xulankong
* @date 创建时间:  2018年11月7日 下午9:07:17
* @version 1.0
*/
@Controller
@RequestMapping("back/branch/honor/")
public class BranchHonorController {
    
    private final static String ROOT = "background/department/branchHonor";
    
    @Autowired 
    BranchHonorService branchHonorService;
    
    @Autowired
    private PictureService pictureService;
    
    /**
     * 进入list页面
     * @return
     */
    @RequestMapping(value="toList")
    public String gotoList() {
        return ROOT;
    }
    
    /**
     * 分页获取部门列表
     * @param pageNum 页数
     * @param pageSize 每页数据条数
     * @return
     */
    @ResponseBody
    @RequestMapping(value="getBranchHonorList",method=RequestMethod.POST)
    public PageBean getBranchHonorPageList(@RequestParam("page") Integer pageNum,
            @RequestParam("rows") Integer pageSize, Zbry  zbry){

        PageInfo pageInfo = branchHonorService.getBranchHonorPageList(pageNum, pageSize, zbry);
        return new PageBean(pageInfo.getTotal(),pageInfo.getList());
    }
    
    /**
     * 上传荣誉图片
     * @param uploadFile
     * @param request
     * @param map
     * @return
     */
    @ResponseBody
    @RequestMapping(value="uploadHonor", method=RequestMethod.POST)
    public Result uploadHonor(@RequestParam MultipartFile uploadFile, HttpServletRequest request,
            Map<String, Object> map, HttpSession session) {
        
        //得到项目的绝对路径
        String rootPath = request.getServletContext().getRealPath(UrlConfig.BRANCHHONOR);
        String saveUrl = request.getContextPath() +"/" + UrlConfig.BRANCHHONOR;
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
     * 添加部门荣誉
     * @param bmb
     * @return
     */
    @RequestMapping(value="addBranchHonor",method=RequestMethod.POST)
    @ResponseBody
    public Result addBm(Zbry  zbry,HttpSession session){
        
        Yhb yhb = (Yhb) session.getAttribute("yhb"); 
        String pictureIds = (String) session.getAttribute("pictureIds");
        branchHonorService.addBranchHonor(zbry, pictureIds, yhb);
        // 清除当前的新闻图片的session域
        session.setAttribute("pictureIds", null);
        return new Result(0, null, null);
    }
    
    /**
     * 修改部门荣誉信息
     * @param bmb
     * @return
     */
    @RequestMapping(value="editBranchHonor", method=RequestMethod.POST)
    @ResponseBody
    public Result editBm( Zbry  zbry){
        branchHonorService.editBranchHonor(zbry);
        return new Result(0, null, null);
    }
    
    /**
     * 批量删除
     * @param bmIds
     * @return
     */
    @ResponseBody
    @RequestMapping(value="deleteBranchHonor/{zbryIds}", method=RequestMethod.POST)
    public Result deleteBm(@PathVariable("zbryIds") String zbryIds,   HttpServletRequest request){
        String[] ids = zbryIds.split(",");
        branchHonorService.deleteBranchHonorBratch(request, ids);
        return new Result(0, null, null);
    }
    

}
