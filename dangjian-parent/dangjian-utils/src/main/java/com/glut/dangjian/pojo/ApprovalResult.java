package com.glut.dangjian.pojo;
/** 
* @author xulankong
* @date 创建时间:  2019年1月6日 下午10:02:51
* @version 1.0
*/
public class ApprovalResult {

    private int result;
    
    private String data;

    public ApprovalResult() {
        super();
    }

    public ApprovalResult(int result, String data) {
        super();
        this.result = result;
        this.data = data;
    }

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
    
    
}
