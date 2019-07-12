package com.glut.dangjian.background.controller.exception;
/** 
* @author xulankong
* @date 创建时间:  2018年12月4日 下午8:05:42
* @version 1.0
*/
@SuppressWarnings("serial")
public class BaseSystemException extends RuntimeException{

    public BaseSystemException() {
        
    }
    
    public BaseSystemException(String message) {
        super(message);
    }
}
