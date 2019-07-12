package com.glut.dangjian.entity.common;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/12/10
 * Time: 7:58 PM
 * 简单的事情重复做，重复的事情坚持做，坚持的事情用心做
 **/



/**
 * 移动端数据接口，返回数据统一使用格式
 */
public class Result  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    /**
     * 状态码说明：
     * 101 表示用户未登录
     * 202 表示用户已经点赞
     * 310 表示用户已开始答题
     */

    //错误代码
    private int error;
    //错误信息
    private String msg;
    //返回的数据
    private Object data;

    public Result() {
    }

    public Result(int error, String msg, Object data) {
        this.error = error;
        this.msg = msg;
        this.data = data;
    }



    public int getError() {
        return error;
    }

    public void setError(int error) {
        this.error = error;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "Result{" +
                "error=" + error +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                '}';
    }
}
