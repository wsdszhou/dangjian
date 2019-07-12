package com.glut.dangjian.background.controller.aspectj;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.glut.dangjian.background.log.service.OperationLogService;
import com.glut.dangjian.entity.log.Log;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.utils.StringTools;

/** 
* @author xulankong
* @date 创建时间:  2018年12月2日 下午6:58:03
* 日志aop控制
* @version 1.0
*/
@Aspect
@Component
public class OperationLogAspectJ {

    private HttpServletRequest request; 
    
    @Autowired 
    private OperationLogService operationLogService;
    
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
     * 权限操作写日志
     * @param pjd
     */
    @Around(value="execution(* com.glut.dangjian.background.controller.authority..*.save*(..))")
    public Object saveOperationLog(ProceedingJoinPoint pjd) {
        return saveLog(pjd);
    }
    
    /**
     * 权限操作写日志
     * @param pjd
     */
    @Around(value="execution(* com.glut.dangjian.background.controller.authority..*.add*(..))")
    public Object addOperationLog(ProceedingJoinPoint pjd) {
        return saveLog(pjd);
    }
    
    /**
     * 权限操作写日志
     * @param pjd
     */
    @Around(value="execution(* com.glut.dangjian.background.controller.authority..*.insert*(..))")
    public Object insertOperationLog(ProceedingJoinPoint pjd) {
        return saveLog(pjd);
    }
    
    /**
     * 权限操作写日志
     * @param pjd
     */
    @Around(value="execution(* com.glut.dangjian.background.controller.authority..*.update*(..))")
    public Object updateOperationLog(ProceedingJoinPoint pjd) {
        return saveLog(pjd);
    }
    
    /**
     * 权限操作写日志
     * @param pjd
     */
    @Around(value="execution(* com.glut.dangjian.background.controller.authority..*.edit*(..))")
    public Object editOperationLog(ProceedingJoinPoint pjd) {
        return saveLog(pjd);
    }
    
    /**
     * 权限操作写日志
     * @param pjd
     */
    @Around(value="execution(* com.glut.dangjian.background.controller.authority..*.delete*(..))")
    public Object deleteOperationLog(ProceedingJoinPoint pjd) {
        return saveLog(pjd);
    }
    
    /**
     * 用户操作写日志
     * @param pjd
     */
    @Around(value="execution(* com.glut.dangjian.background.controller.system.UserController.authority*(..))")
    public Object userOperationLog(ProceedingJoinPoint pjd) {
        return saveLog(pjd);
    }
    
    /** 环绕通知
     * 添加操作日志并记录到数据库
     */
    private Object saveLog(ProceedingJoinPoint pjd) {
        request = getHttpServletRequest();
        HttpSession session = request.getSession();
        Yhb yhb = (Yhb) session.getAttribute("yhb");
        Object proceed = null;
        //类名
        String className1 = pjd.getTarget().getClass().getName();
        String className = className1.toLowerCase();
        // 获取方法
        String methodName1 = pjd.getSignature().getName();
        String methodName = methodName1.toLowerCase();
        
        // 执行方法
        try {
            proceed  = pjd.proceed();
        } catch (Throwable e) {
            e.printStackTrace();
        }
        
        int type = 0;
        String operation = null;
        String content = "";
        if (className.indexOf("role") != -1) {
            content = "角色";
        } else if ( className.indexOf("function") != -1) {
            content = "模块";
        } else if ( className.indexOf("user") != -1) {
            content = "用户";
        }
        
        if (methodName.indexOf("add") != -1 || methodName.indexOf("save")!= -1 || methodName.indexOf("insert")!= -1) {
            type = 1;
            operation = "添加";
        } else if (methodName.indexOf("update")!= -1 || methodName.indexOf("edit")!= -1) {
            type = 2;
            operation = "修改";
        } else if (methodName.indexOf("delete")!= -1 ) {
            type = 3;
            operation = "删除";
        } else if (methodName.indexOf("authority")!= -1 ) {
            type = 4;
            operation = "授权";
        }
        
        Log log = new Log(
            StringTools.getUUID(), 
            yhb, 
            getIpAdrress(request), 
            type, 
            content + operation, 
            new Date(), 
            className1 + "." + methodName1);
         operationLogService.addLog(log);
         return proceed;
    }
    
    /**
     * 获取IP地址
     * @param request
     * @return
     */
    private static String getIpAdrress(HttpServletRequest request) {
        String Xip = request.getHeader("X-Real-IP");
        String XFor = request.getHeader("X-Forwarded-For");
        if(StringUtils.isNotEmpty(XFor) && !"unKnown".equalsIgnoreCase(XFor)){
            //多次反向代理后会有多个ip值，第一个ip才是真实ip
            int index = XFor.indexOf(",");
            if(index != -1){
                return XFor.substring(0,index);
            }else{
                return XFor;
            }
        }
        XFor = Xip;
        if(StringUtils.isNotEmpty(XFor) && !"unKnown".equalsIgnoreCase(XFor)){
            return XFor;
        }
        if (StringUtils.isBlank(XFor) || "unknown".equalsIgnoreCase(XFor)) {
            XFor = request.getHeader("Proxy-Client-IP");
        }
        if (StringUtils.isBlank(XFor) || "unknown".equalsIgnoreCase(XFor)) {
            XFor = request.getHeader("WL-Proxy-Client-IP");
        }
        if (StringUtils.isBlank(XFor) || "unknown".equalsIgnoreCase(XFor)) {
            XFor = request.getHeader("HTTP_CLIENT_IP");
        }
        if (StringUtils.isBlank(XFor) || "unknown".equalsIgnoreCase(XFor)) {
            XFor = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (StringUtils.isBlank(XFor) || "unknown".equalsIgnoreCase(XFor)) {
            XFor = request.getRemoteAddr();
        }
        return XFor;
    }
    
}
