package com.glut.dangjian.background.controller.exception;
/** 
* @author xulankong
* @date 创建时间:  2018年12月4日 下午8:22:52
* @version 1.0
*/
public enum HttpExceptionEnum {

    NOT_FOUND_EXCEPTION(404, "异常信息:没有找到请求处理方法"), 
    
    NOT_SUPPORTED_METHOD_EXCEPTION(405 ,  "异常信息:处理请求方式不支持"), 
    
    NOT_SUPPORTED_MEDIA_TYPE_EXCEPTION( 415,  "异常信息:不支持请求媒体类型"), 
    
    NOT_ACCEPTABLE_MEDIA_TYPE_EXCEPTION( 406,  "异常信息:不接受请求媒体类型"), 
     
    NOT_SUPPORTED_METHOD_PathVariable_EXCEPTION( 400, "异常信息:请求路径变量缺失"),
    
    MISSING_REQUEST_PARAMETER_EXCEPTION( 400,  "异常信息:请求出错， 服务器无法理解此请求"), 
    
    REQUEST_BINDING_EXCEPTION(  400, "异常信息:请求约束异常，请检查参数"), 
    
    NOT_SUPPORTED_CONVERSION_EXCEPTION( 500 ,  "异常信息:转换器不支持该转换"), 
    
    TYPE_MISMATCH_EXCEPTION(  500,  "异常信息:类型匹配错误"), 
    
    MESSAGE_NOT_READABLE_EXCEPTION( 400,  "异常信息:请求信息不可读"), 
    
    MESSAGE_NOT_WRITABLE_EXCEPTION(  500,  "异常信息:请求信息不可写"), 
    
    NOT_VALID_METHOD_ARGUMENT_EXCEPTION( 400  ,  "异常信息:参数有误"), 
    
    MISSING_REQUEST_PART_EXCEPTION(  500,  "异常信息:缺失请求参数"), 
    
    BIND_EXCEPTION( 500,  "异常信息:约束错误"), 
    
    ASYNC_REQUEST_TIMEOUT_EXCEPTION( 408 ,  "异常信息:请求超时，检查网络是否配置正常或者是否可以上网");
    
    private int code;
    
    private String message; 
    
    private HttpExceptionEnum(int code,  String message) {
        this.code = code;
        this.message = message;
    }
    
    public int getCode() {
        return code;
    }
    
    public String getMessage() {
        return message;
    }
}
