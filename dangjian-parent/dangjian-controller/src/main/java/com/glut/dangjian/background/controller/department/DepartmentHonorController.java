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
import com.glut.dangjian.background.department.service.DepartmentHonorService;
import com.glut.dangjian.background.news.service.PictureService;
import com.glut.dangjian.config.UrlConfig;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.department.Bmb;
import com.glut.dangjian.entity.department.Bmry;
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
@RequestMapping("back/department/honor/")
public class DepartmentHonorController {
    
    private final static String ROOT = "background/department/depaertmentHonor";
    
    @Autowired 
    DepartmentHonorService departmentHonorService;

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
    @RequestMapping(value="getDeptHonorList",method=RequestMethod.POST)
    public PageBean getDeptHonorPageList(@RequestParam("page") Integer pageNum,
            @RequestParam("rows") Integer pageSize, Bmry bmry){

        PageInfo pageInfo = departmentHonorService.getDeptHonorListPage(pageNum, pageSize, bmry);
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
        String rootPath = request.getServletContext().getRealPath(UrlConfig.DEPARTMENTNOHOR);
        String saveUrl = request.getContextPath() +"/" + UrlConfig.DEPARTMENTNOHOR;
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
    @RequestMapping(value="addDeptHonor",method=RequestMethod.POST)
    @ResponseBody
    public Result addBm(Bmry bmry, HttpSession session){
        
        Yhb yhb = (Yhb) session.getAttribute("yhb"); 
        String pictureIds = (String) session.getAttribute("pictureIds");
        departmentHonorService.addDeptHonor(bmry, pictureIds, yhb);
        // 清除当前的新闻图片的session域
        session.setAttribute("pictureIds", null);
        return new Result(0, null, null);
    }
    
    /**
     * 修改部门荣誉信息
     * @param bmb
     * @return
     */
    @RequestMapping(value="editDeptHonor", method=RequestMethod.POST)
    @ResponseBody
    public Result editBm( Bmry bmry){
        departmentHonorService.editDeptHonor(bmry);
        return new Result(0, null, null);
    }
    
    /**
     * 批量删除
     * @param bmIds
     * @return
     */
    @ResponseBody
    @RequestMapping(value="deleteDeptHonor/{bmryIds}", method=RequestMethod.POST)
    public Result deleteBm(@PathVariable("bmryIds") String bmryIds, HttpServletRequest request){
        String[] ids = bmryIds.split(",");
        departmentHonorService.deleteDeptHonorBratch(request,ids);
        return new Result(0, null, null);
    }
    

}
