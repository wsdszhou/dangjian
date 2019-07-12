package com.glut.dangjian.pojo;
/** 
* @author xulankong
* @date 创建时间:  2018年12月4日 下午8:17:10
* @version 1.0
*/
public class JsonResult {

    private Integer code;
    
    private String message;
    
    public static JsonResult  fail(Integer code, String message) {
       return new  JsonResult(code, message);
    }
    
    public JsonResult(Integer code, String message) {
        super();
        this.code = code;
        this.message = message;
    }

    public JsonResult() {
        super();
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
