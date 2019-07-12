package com.glut.dangjian.controller;

import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.glut.dangjian.entity.common.Result;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.utils.MD5Utils;

/**
 * @author xulankong
 * @date 创建时间:  2018年12月13日 下午7:48:27
 * @version 1.0
 */
@Controller
@CrossOrigin(methods = RequestMethod.POST)
public class LoginFrontController {

    /**
     * 用户登录
     * @param session
     * @return
     */
    @RequestMapping(value="mobile/login")
    @ResponseBody
    public Result login(@RequestBody String data, HttpSession session) {

        Result result = new Result();
        JSONObject jsonObject = JSONObject.parseObject(data);
        String username;
        String password;
        String checkcode;

        if(jsonObject.getString("username") != null && !jsonObject.getString("username").equals("")){
            username = jsonObject.getString("username");
        }else {
            result.setError(1);
            result.setMsg("用户名为空！");
            return result;
        }

        if(jsonObject.getString("password") != null && !jsonObject.getString("password").equals("")){
            password = jsonObject.getString("password");
        }else {
            result.setError(1);
            result.setMsg("密码为空！");
            return result;
        }

        if(jsonObject.getString("authcode") != null && !jsonObject.getString("authcode").equals("")){
            checkcode = jsonObject.getString("authcode");
        }else {
            result.setError(1);
            result.setMsg("验证码为空！");
            return result;
        }

        Yhb yhb = new Yhb();
        yhb.setUserMc(username);
        yhb.setUserMm(password);
        if (StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password) ) {
            String sessionCheckcode =  (String) session.getAttribute("key");
            if (/*StringUtils.isNotBlank(checkcode) || StringUtils.isNotBlank(sessionCheckcode*/checkcode !=null && sessionCheckcode != null) {
                // 验证码验证
                if (sessionCheckcode.toUpperCase().equals(checkcode.toUpperCase())) {
                    //使用shiro框架提供的方式进行认证
                    //获得当前用户的对象,并且状态是没有认证
                    Subject subject = SecurityUtils.getSubject();
                    // 创建用户名密码令牌对象
                    UsernamePasswordToken token = new UsernamePasswordToken(username, MD5Utils.getMD5Str(password));
                    try {
                        subject.login(token);
                    } catch (Exception e) {
                        e.printStackTrace();
                        // 密码不正确
                    }
                    //Realm返回一个成功验证的用户
                    yhb = (Yhb) subject.getPrincipal();
                    session.setAttribute("yhb", yhb);
                    return new Result(0, null, yhb);
                } else {
                    // 验证不正确
                    return new Result(1, "验证码不正确", yhb);
                }
            } else {
                // 没有输入验证码
                return new Result(1, "请输入验证码", yhb);
            }
        }else {
            // 没有填写完登录密码或者账号
            return new Result(1, "输入账号密码", yhb);
        }
    }

    /**
     * 判断用户是否登录
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("mobile/isLogin")
    public Result isLogin(HttpSession session){
        Result result = new Result();
        Yhb isLoginyhb = (Yhb) session.getAttribute("yhb");
        if(isLoginyhb == null){
            result.setError(1);
            result.setMsg("用户未登录！");
        }else {
            result.setError(0);
            result.setData(isLoginyhb.getUserMc());
        }
        return result;
    }

    /**
     * 退出登录
     * @param session 当前会话
     * @return 返回到登录页面
     */
    @RequestMapping({"mobile/logout","logout"})
    @ResponseBody
    public Result logout(HttpSession session) {

        // 清除当前会话的session信息
        session.setAttribute("yhb",null);
        // 重定向到登录页面
        return new Result(0, null, null);
    }

}
