package com.glut.dangjian.background.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.service.user.UserService;
import com.glut.dangjian.utils.MD5Utils;

@Controller
@RequestMapping("back/")
public class LoginController extends BaseController{
    
    // 注入用户业务逻辑层
    @Autowired
    private UserService yhService;
    
    @RequestMapping("index")
    public String home() {
        return BackIndex;
    }
    
    /**
     * 用户登录
     * @param userName
     * @param password
     * @param checkcode
     * @param map
     * @return
     */
    @RequestMapping(value="login", method= RequestMethod.POST)
    public String login(@RequestParam("userName") String userName,@RequestParam("password") String password,
            @RequestParam("checkcode") String checkcode, HttpSession session,
            Map<String, Object> map) {
        
        // 创建一个用户对象
        Yhb yhb = new Yhb();
        if (StringUtils.isNotBlank(userName) && StringUtils.isNotBlank(password) ) {

            String sessionCheckcode =  (String) session.getAttribute("key");
            if (StringUtils.isNotBlank(checkcode)) {
                // 验证码验证
                if (sessionCheckcode.toUpperCase().equals(checkcode.toUpperCase())) {
                    //使用shiro框架提供的方式进行认证
                    //获得当前用户的对象,并且状态是没有认证
                    Subject subject = SecurityUtils.getSubject();
                    // 创建用户名密码令牌对象
                    UsernamePasswordToken token = new UsernamePasswordToken(userName, MD5Utils.getMD5Str(password));
                    try {
                        subject.login(token);
                        //Realm返回一个成功验证的用户
                        yhb = (Yhb) subject.getPrincipal();
                        if (yhb.getUserFlag() !=1) {
                            map.put("msg", "用户不存在或者密码不正确");
                            return BackLogin; 
                        }
                        session.setAttribute("yhb", yhb);
                        return "redirect:/back/index"  ;
                    } catch (Exception e) {
                        e.printStackTrace();
                        // 密码不正确
                        map.put("userName", userName);
                        map.put("password", password);
                        map.put("msg", "用户不存在或者密码不正确");
                        return BackLogin; 
                    }
                } else {
                    // 验证不正确
                    map.put("userName", userName);
                    map.put("password", password);
                    map.put("msg", "验证码不正确");
                    return BackLogin;             
                }
            } else {
                // 没有输入验证码
                map.put("userName", userName);
                map.put("password", password);
                map.put("msg", "请输入验证码");
                return BackLogin;          
            }
        }else { 
            // 没有填写完登录密码或者账号
            map.put("userName", userName);
            map.put("password", password);
            map.put("msg", "输入账号密码");
            return BackLogin;
        }
        
    }
    
    /**
     * 退出登录
     * @param session 当前会话
     * @return 返回到登录页面
     */
    @RequestMapping("logout")
    public String logout(HttpSession session) {

        // 清除当前会话的session信息
        session.setAttribute("yhb",null);
        // 重定向到登录页面
        return BackLogin;
    }
}
