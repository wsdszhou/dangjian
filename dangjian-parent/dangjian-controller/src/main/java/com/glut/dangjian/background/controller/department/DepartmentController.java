package com.glut.dangjian.background.controller.department;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
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

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/8/3
 * Time: 下午4:48
 */

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.department.service.DepartmentService;
import com.glut.dangjian.background.news.service.PictureService;
import com.glut.dangjian.config.UrlConfig;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.department.Bmb;
import com.glut.dangjian.entity.news.XwTpb;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.pojo.PageBean;
import com.glut.dangjian.utils.Msg;
import com.glut.dangjian.utils.StringTools;
import com.glut.dangjian.utils.UploadFileUtils;

/**
 * 部门管理
 */
@Controller
@RequestMapping("back/department/")
public class DepartmentController {

	//定义模块视图根目录
	private final static String ROOT = "background/department/depaertmentList";

	@Autowired
	DepartmentService departmentService;
	
	@Autowired
    private PictureService pictureService;

	/**
	 * 部门管理首页
	 * @return
	 */
	@RequestMapping("toList")
	public String togoList(){
		return ROOT;
	}
	
	/**
	 * 加载部门信息
	 * @return
	 */
	@RequestMapping(value="loadBm",method=RequestMethod.POST)
    @ResponseBody
    public List<Bmb> loadBmByAjax() {
        
        List<Bmb> bmbs = departmentService.loadBmList();
        return bmbs;
    }

	/**
	 * 分页获取部门列表
	 * @param pageNum 页数
	 * @param pageSize 每页数据条数
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getDeptList",method=RequestMethod.POST)
	public PageBean getBmList(@RequestParam("page") Integer pageNum,
            @RequestParam("rows") Integer pageSize){

		PageInfo pageInfo = departmentService.getBmList(pageNum,pageSize);
		return new PageBean(pageInfo.getTotal(),pageInfo.getList());
	}
	
	/**
	 * 上传logo
	 * @param uploadFile
	 * @param request
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="uploadLogo", method=RequestMethod.POST)
	public Result uploadLogo(@RequestParam MultipartFile uploadFile, HttpServletRequest request,
	        Map<String, Object> map, HttpSession session) {
	    
	    //得到项目的绝对路径
	    String rootPath = request.getServletContext().getRealPath(UrlConfig.DEPARTMENT);
	    String saveUrl = request.getContextPath() +"/" + UrlConfig.DEPARTMENT;
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
	 * 添加部门
	 * @param bmMc
	 * @return
	 */
	@RequestMapping(value="addDept",method=RequestMethod.POST)
	@ResponseBody
	public Result addBm(Bmb bmb, HttpSession session){
	    Yhb yhb = (Yhb) session.getAttribute("yhb"); 
		String pictureIds = (String) session.getAttribute("pictureIds");
		departmentService.addBm(bmb, pictureIds, yhb);
        // 清除当前的新闻图片的session域
        session.setAttribute("pictureIds", null);
		return new Result(0, null, null);
	}

	/**
	 * 修改部门
	 * @param bmMc
	 * @return
	 */
	@RequestMapping(value="editDept", method=RequestMethod.POST)
	@ResponseBody
	public Result editBm( Bmb bmb){
		departmentService.editBm(bmb);
		return new Result(0, null, null);
	}

	/**
	 * 批量删除部门
	 * @param bmIds
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="deleteBm/{bmIds}", method=RequestMethod.POST)
	public Result deleteBm(@PathVariable("bmIds") String bmIds, HttpServletRequest request){
		String[] ids = bmIds.split(",");
		departmentService.deleteBms(request, ids);
		return new Result(0, null, null);
	}

}
