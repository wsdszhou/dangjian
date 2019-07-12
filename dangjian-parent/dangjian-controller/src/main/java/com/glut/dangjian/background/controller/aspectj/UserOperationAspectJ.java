package com.glut.dangjian.background.controller.aspectj;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.glut.dangjian.entity.user.Yhb;

/** 
* @author xulankong
* 
* @date 创建时间:  2018年12月4日 下午12:00:09
* @version 1.0
*/

public class UserOperationAspectJ {

    /**
     * 获取当前请求的HttpServletRequest
     * @return
     */
    private HttpServletRequest getHttpServletRequest() {
        RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        ServletRequestAttributes sra = (ServletRequestAttributes)ra;
        return sra.getRequest();
    }
    
    /**
     * 对操作进行记录
     * @param point
     */
    @AfterReturning(value = "execution(* com.glut.dangjian.background.controller..*.*(..))")
    public void afterAdvice(JoinPoint  point) {
        String methodName = null;
        Logger logger = null;
        String classMethod = null;
        String loggerMsg = "";
        HttpSession session = getHttpServletRequest().getSession();
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        if (yhb != null) {
            loggerMsg = yhb.getUserMc();
        }
        // 获取捕获方法
        methodName = point.getSignature().getName();
        // 获取捕获方法的所属类
        Class<?> declaringClass = point.getTarget().getClass();
        //定义日志记录类
        logger  = LoggerFactory.getLogger(declaringClass);
        classMethod = declaringClass.getName() + "." + methodName;
        loggerMsg += "执行" + judeOperateType(methodName) + ":   " + classMethod;
        // 写日志到文件中
        logger.info(loggerMsg );
    }
    
    
    /**
     * 对异常进行记录
     * @param point
     */
    @AfterThrowing(value = "execution(* com.glut.dangjian.background..*.impl.*(..))", throwing="e")
    public void afterThrowingAdvice(JoinPoint point,  Exception e) {
        String methodName = null;
        Logger logger = null;
        String classMethod = null;
        String loggerMsg = "";
        HttpSession session = getHttpServletRequest().getSession();
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        if (yhb != null) {
            loggerMsg = yhb.getUserMc();
        }
        // 获取捕获方法
        methodName = point.getSignature().getName();
        // 获取捕获方法的所属类
        Class<?> declaringClass = point.getTarget().getClass();
        //定义日志记录类
        logger  = LoggerFactory.getLogger(declaringClass);
        classMethod = declaringClass.getName() + "." + methodName;
        loggerMsg = "执行" + judeOperateType(methodName) + ":   " + classMethod;
        //获取异常信息
        String throwMsg = e.getMessage();
        if (throwMsg != null && throwMsg.contains("异常信息:")) {
            loggerMsg += "|" + "出错:" + throwMsg.replace("异常信息:", "");
        } else  {
            loggerMsg += "|" + "出错:未知错误" + throwMsg;
        }
        logger.error(loggerMsg, e);
    }
    
    
    /**
     * 判断操作类型
     * @param methodName
     * @return
     */
    private String judeOperateType(String methodName) {
        if (methodName.indexOf("get") != -1 || methodName.indexOf("load")!= -1 || methodName.indexOf("find")!= -1 || methodName.indexOf("select")!= -1) {
            return "查询";
        } else
        if (methodName.indexOf("add") != -1 || methodName.indexOf("save")!= -1 || methodName.indexOf("insert")!= -1) {
            return "添加";
        } else if (methodName.indexOf("update")!= -1 || methodName.indexOf("edit")!= -1) {
            return "修改";
        } else if (methodName.indexOf("delete")!= -1 ) {
            return "删除";
        } else if (methodName.indexOf("authority")!= -1 ) {
            return "授权";
        }
        return "";
    }
}
