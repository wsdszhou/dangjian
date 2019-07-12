package com.glut.dangjian.background.controller.system;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.view.ViewYhxx;
import com.glut.dangjian.service.user.UserService;

/** 
* @author xulankong
* @date 创建时间:  2018年12月19日 下午7:00:17
* @version 1.0
*/
@Controller
@RequestMapping("back/")
public class ForgetPasswordController {

    private static final String FORGET = "background/system/forget/forgetPassword";
    
    private static final String SETPASSWORD =  "background/system/forget/setPassword";
    
    @Autowired
    private UserService userService;
    
    /**
     * 进入展会密码页面
     */
    @RequestMapping("toForgetPassword")
    public String toForgetPassword() {
        System.err.println(123);
        return FORGET;
    }
    
    /**
     * 验证信息
     * @return
     */
    @RequestMapping(value="/validateInformation", method=RequestMethod.POST)
    public String validateInformation(ViewYhxx viewYhxx, Map<String, Object> map,HttpSession session) {
        
        boolean validate = userService.validateInformation(viewYhxx);
        if (validate) {
            session.setAttribute("userMc", viewYhxx.getUserMc());
            return SETPASSWORD;
        } else {
            map.put("message", "用户名与身份证对应不一致");
            return FORGET;
        }
    }
    
    /**
     * 验证信息
     * @return
     */
    @RequestMapping(value="/setPassword", method=RequestMethod.POST)
    public String setPassword(@RequestParam("password") String password, HttpSession session) {
        String userMc = (String) session.getAttribute("userMc");
        System.err.println(userMc);
        userService.setPasswordByUserMc(userMc, password);
        session.removeAttribute("userMc");
        return "redirect:/back/index";
    }
}
