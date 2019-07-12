package com.glut.dangjian.background.controller.exception;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.ConversionNotSupportedException;
import org.springframework.beans.TypeMismatchException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindException;
import org.springframework.web.HttpMediaTypeNotAcceptableException;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingPathVariableException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.context.request.async.AsyncRequestTimeoutException;
import org.springframework.web.multipart.support.MissingServletRequestPartException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonJsonView;
import com.glut.dangjian.pojo.JsonResult;
/** 
* @author xulankong
* @date 创建时间:  2018年12月4日 下午8:01:42
* @version 1.0
*/

public class AppliciationHandlerExceptionResolver implements HandlerExceptionResolver {
    
    private static Logger logger = LoggerFactory.getLogger(AppliciationHandlerExceptionResolver.class);

    private FastJsonConfig fastJsonConfig;
    
    public AppliciationHandlerExceptionResolver(FastJsonConfig fastJsonConfig) {
        this.fastJsonConfig = fastJsonConfig;
    }
    
    public AppliciationHandlerExceptionResolver() {
        super();
    }

    /**
     * 重写异常处理
     */
    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, 
            Object handler, Exception ex) {
        ModelAndView mv = specialExceptionResolve(ex, request);
        if (null == mv) {
            String message = "系统异常，请联系管理员";
            /*
             * 当没有捕获到异常时候，执行下面的操作
             * BaseSystemException是自定义的异常基类，继承自RuntimeException
             * 
             */
            if (ex instanceof BaseSystemException) {
                message = ex.getMessage();
            }
            System.err.println(message);
            mv = errorResult(message, "/error", request);
        }
        return mv;
    }

    /**
     * @param ex      异常信息
     * @param request 当前请求对象(用于判断当前请求是否为ajax请求)
     * @return 视图模型对象
     */
    private ModelAndView specialExceptionResolve(Exception ex, HttpServletRequest request) {
        try {
            if (ex instanceof NoSuchRequestHandlingMethodException 
                || ex instanceof NoHandlerFoundException) {
                return result(HttpExceptionEnum.NOT_FOUND_EXCEPTION, request);
            }
            else if (ex instanceof HttpRequestMethodNotSupportedException) {
                return result(HttpExceptionEnum.NOT_SUPPORTED_METHOD_EXCEPTION, request);
            }
            else if (ex instanceof HttpMediaTypeNotSupportedException) {
                return result(HttpExceptionEnum.NOT_SUPPORTED_MEDIA_TYPE_EXCEPTION, request);
            }
            else if (ex instanceof HttpMediaTypeNotAcceptableException) {
                return result(HttpExceptionEnum.NOT_ACCEPTABLE_MEDIA_TYPE_EXCEPTION, request);
            }
            else if (ex instanceof MissingPathVariableException) {
                return result(HttpExceptionEnum.NOT_SUPPORTED_METHOD_PathVariable_EXCEPTION, request);
            }
            else if (ex instanceof MissingServletRequestParameterException) {
                return result(HttpExceptionEnum.MISSING_REQUEST_PARAMETER_EXCEPTION, request);
            }
            else if (ex instanceof ServletRequestBindingException) {
                return result(HttpExceptionEnum.REQUEST_BINDING_EXCEPTION, request);
            }
            else if (ex instanceof ConversionNotSupportedException) {
                return result(HttpExceptionEnum.NOT_SUPPORTED_CONVERSION_EXCEPTION, request);
            }
            else if (ex instanceof TypeMismatchException) {
                return result(HttpExceptionEnum.TYPE_MISMATCH_EXCEPTION, request);
            }
            else if (ex instanceof HttpMessageNotReadableException) {
                return result(HttpExceptionEnum.MESSAGE_NOT_READABLE_EXCEPTION, request);
            }
            else if (ex instanceof HttpMessageNotWritableException) {
                return result(HttpExceptionEnum.MESSAGE_NOT_WRITABLE_EXCEPTION, request);
            }
            else if (ex instanceof MethodArgumentNotValidException) {
                return result(HttpExceptionEnum.NOT_VALID_METHOD_ARGUMENT_EXCEPTION, request);
            }
            else if (ex instanceof MissingServletRequestPartException) {
                return result(HttpExceptionEnum.MISSING_REQUEST_PART_EXCEPTION, request);
            }
            else if (ex instanceof BindException) {
                return result(HttpExceptionEnum.BIND_EXCEPTION, request);
            }
            else if (ex instanceof AsyncRequestTimeoutException) {
                return result(HttpExceptionEnum.ASYNC_REQUEST_TIMEOUT_EXCEPTION, request);
            }
        } catch (Exception handlerException) {
            logger.warn("Handling of [" + ex.getClass().getName() + "] resulted in Exception", handlerException);
        }
        return null;
    }

    /**
     * 判断是否ajax请求
     *
     * @param request 请求对象
     * @return true:ajax请求  false:非ajax请求
     */
    private boolean isAjax(HttpServletRequest request) {
        return "XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"));
    }

    /**
     * 返回错误信息
     *
     * @param message 错误信息
     * @param url     错误页url
     * @param request 请求对象
     * @return 模型视图对象
     */
    private ModelAndView errorResult(String message, String url, HttpServletRequest request) {
        
        logger.warn("请求处理失败，请求url=[{}], 失败原因 : {}", request.getRequestURI(), message);
        if (isAjax(request)) {
            return jsonResult(500, message);
        } else {
            System.err.println(url);
            return normalResult(message, url);
        }
    }

    /**
     * 返回异常信息
     *
     * @param httpException 异常信息
     * @param request 请求对象
     * @return 模型视图对象
     */
    private ModelAndView result(HttpExceptionEnum httpException, HttpServletRequest request) {
        
        logger.warn("请求处理失败，请求url=[{}], 失败原因 : {}", request.getRequestURI(), httpException.getMessage());
        if (isAjax(request)) {
            return jsonResult(httpException.getCode(), httpException.getMessage());
        } else {
            return normalResult(httpException.getMessage(), "errors/error");
        }
    }

    /**
     * 返回错误页
     *
     * @param message 错误信息
     * @param url     错误页url
     * @return 模型视图对象
     */
    private ModelAndView normalResult(String message, String url) {
        Map<String, String> model = new HashMap<String, String>();
        model.put("errorMessage", message);
        return new ModelAndView(url, model);
    }

    /**
     * 返回错误数据
     *
     * @param message 错误信息
     * @return 模型视图对象
     */
    private ModelAndView jsonResult(int code, String message) {
        ModelAndView mv = new ModelAndView();
        FastJsonJsonView view = new FastJsonJsonView();
        view.setFastJsonConfig(fastJsonConfig);
        view.setAttributesMap((JSONObject) JSON.toJSON(JsonResult.fail(code, message)));
        mv.setView(view);
        return mv;
    }
}

