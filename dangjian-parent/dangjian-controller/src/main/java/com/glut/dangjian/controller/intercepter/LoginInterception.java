package com.glut.dangjian.controller.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.glut.dangjian.entity.common.Result;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.glut.dangjian.entity.user.Yhb;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/** 
* @author xulankong
* @date 创建时间:  2018年8月22日 上午9:35:40
* @version 1.0
*/

public class LoginInterception implements HandlerInterceptor {

    /*@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();
        // 服务后台登录
        if (url.indexOf("background.jsp") >= 0 || url.indexOf("background/index.jsp") >= 0 ) {
            return true;
        }

        // 跨域请求
        if (request.getHeader(HttpHeaders.ORIGIN) != null) {
            response.addHeader("Access-Control-Allow-Origin", "http://localhost:8080");
            response.addHeader("Access-Control-Allow-Credentials", "true");
            response.addHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE, PUT, HEAD");
            response.addHeader("Access-Control-Allow-Headers", "Content-Type");
            response.addHeader("Access-Control-Max-Age", "3600");
        }
        
        HttpSession session = request.getSession();
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        // 已经登录
        if (yhb != null ) {
            return true;
        }else {
            //未登录
            if(url.indexOf("mobile")  >= 0 ) {
                // 进行手机端登录
                Result result = new Result(1,"用户未登录！",null);
                response.setContentType("application/json; charset=UTF-8");
                response.getWriter().write(JSON.toJSONString(result));
                return false;
            } else {
              // 服务端登录
                request.getRequestDispatcher("/background.jsp").forward(request, response);
                return false;
            }
        }



    }
*/

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Yhb yhb = (Yhb) session.getAttribute("yhb");

        //判断用户是否已经登陆
        if(yhb != null){
            return true;
        }else {
            String url = request.getRequestURI();
            //判断是否移动端请求
            if(url.indexOf("mobile") > 0){
                if (request.getHeader(HttpHeaders.ORIGIN) != null) {
                    //String []  allowDomain= {"http://localhost:8080","http://localhost","http://111.231.76.233","http://111.231.76.233:8080"};
                    //String [] allowDomain= {"http://132.12.11.11:8888“,”http://123.112.112.12:80“,”http://123.16.12.23“,”http://121.12.18.13:10195"};
                    //Set allowedOrigins= new HashSet(Arrays.asList(allowDomain));
                    String originHeader= request.getHeader("Origin");
                    response.addHeader("Access-Control-Allow-Origin", originHeader);
                    response.addHeader("Access-Control-Allow-Credentials", "true");
                    response.addHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE, PUT, HEAD");
                    response.addHeader("Access-Control-Allow-Headers", "Content-Type");
                    response.addHeader("Access-Control-Max-Age", "3600");
                }
                // 错误码101表示用户未登录
                Result result = new Result(101,"用户未登录！",null);
                response.setContentType("application/json; charset=UTF-8");
                response.getWriter().write(JSON.toJSONString(result));
                return false;
            }else {
                request.getRequestDispatcher("/background.jsp").forward(request, response);
                return false;
            }
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        
    }

}
