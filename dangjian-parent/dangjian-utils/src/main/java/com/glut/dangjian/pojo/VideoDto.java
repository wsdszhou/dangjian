package com.glut.dangjian.pojo;
/** 
* @author xulankong
* @date 创建时间:  2018年11月30日 下午3:09:14
* @version 1.0
*/
public class VideoDto {

    private boolean state;
    
    private String msg;
    
    private String src;

    public boolean isState() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }
    
}
