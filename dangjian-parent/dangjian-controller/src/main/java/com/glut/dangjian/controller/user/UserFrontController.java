package com.glut.dangjian.controller.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.glut.dangjian.config.UrlConfig;
import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewYhxx;
import com.glut.dangjian.service.user.UserService;
import com.glut.dangjian.utils.UploadFileUtils;

/** 
* @author xulankong
* @date 创建时间:  2018年12月21日 下午6:43:05
* @version 1.0
*/
@RestController
@CrossOrigin(methods = {RequestMethod.POST,RequestMethod.GET, RequestMethod.DELETE, RequestMethod.PUT})
@RequestMapping(value="mobile/user/")
public class UserFrontController {
    
    @Autowired
    private UserService userService;

    /**
     * 获取用户信息
     * @param session
     * @return
     */
    @RequestMapping(value="info", method=RequestMethod.GET)
    public Result getUserInfo(HttpSession session) {
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        ViewYhxx viewYhxx = userService.getYhxx(yhb);
        return new Result(0, null, viewYhxx);
    }
    
    /**
     * 注册用户
     * @return
     */
    @RequestMapping(value="saveUser", method=RequestMethod.POST)
    public Result saveUser(ViewYhxx viewYhxx) {
        
        Yhb yhb = userService.getUserByuserName(viewYhxx.getUserMc()); 
        if (yhb != null) {
            return new Result(0, "用户名或者用户已经存在", viewYhxx);
        }
        userService.saveUser(viewYhxx);
        viewYhxx.setUserFlag(0);
        return new Result(0, null, viewYhxx);
    }
    
    /**
     * 修改用户信息
     * @param viewYhxx
     * @return
     */
    @RequestMapping(value="updateUser", method=RequestMethod.POST)
    public Result updateUser(ViewYhxx viewYhxx) {
        userService.updateUser(viewYhxx);
        return new Result(0, null, viewYhxx);
    }
    
    /**
     * 修改密码
     * @param oldPassword
     * @param newPassword
     * @param session
     * @return
     */
    @RequestMapping(value="validatePassword", method=RequestMethod.POST)
    public Result validatePassword(@RequestBody String data, HttpSession session) {
        
        JSONObject jsonObject = JSONObject.parseObject(data);
        String newPassword = null;
        String oldPassword = null;
        if(jsonObject.getString("newPassword") != null && !jsonObject.getString("oldPassword").equals("")){
            newPassword = jsonObject.getString("newPassword");
        }else {
            return new Result(0, "新密码不能为空", null);
        }
        if(jsonObject.getString("oldPassword") != null && !jsonObject.getString("oldPassword").equals("")){
            oldPassword = jsonObject.getString("oldPassword");
        }else {
            return new Result(0, "旧密码不能为空", null);
        }
        
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        boolean validate = userService.validatePassword(oldPassword, newPassword, yhb);
        if (validate) {
            return new Result(0, null, null);
        } else {
            return new Result(1, "密码不对应", null);
        }
    }
    
    /**
     * 上传头像
     * @return
     */
    @RequestMapping(value="uploadPortrait", method=RequestMethod.POST)
    public Result uploadPortrait(@RequestParam MultipartFile uploadFile, 
            HttpServletRequest request, HttpSession session, Map<String, Object> map) {
        
        //得到项目的绝对路径
        String rootPath = request.getServletContext().getRealPath(UrlConfig.PORTRAIT);
        String saveUrl = request.getContextPath() +"/" + UrlConfig.PORTRAIT;
        UploadFileUtils uploadFileUtils = new UploadFileUtils();
        map = uploadFileUtils.uploadFile(uploadFile, request, rootPath, saveUrl, map);
        if (map.get("src") == null) {
            return new Result(1, (String)map.get("message"), null);
        } else {
            Yhb yhb = (Yhb) session.getAttribute("yhb");
            userService.updatePortrait((String) map.get("src"), yhb);
            return new Result(0, (String)map.get("message"), map.get("src"));
        }
    }
    
}
