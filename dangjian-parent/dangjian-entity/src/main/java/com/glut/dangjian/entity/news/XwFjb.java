package com.glut.dangjian.entity.news;

import java.io.Serializable;

/**
 * 新闻附加表
 * @author XuLanKong
 *
 */
public class XwFjb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 新闻附加id
    private Integer xwfjId;

    // 所属新闻
    private Xwb xwfjXwdm;

    // 新闻文件
    private XwWjb xwfjWjdm;

    public Integer getXwfjId() {
        return xwfjId;
    }

    public void setXwfjId(Integer xwfjId) {
        this.xwfjId = xwfjId;
    }

    public Xwb getXwfjXwdm() {
        return xwfjXwdm;
    }

    public void setXwfjXwdm(Xwb xwfjXwdm) {
        this.xwfjXwdm = xwfjXwdm;
    }

    public XwWjb getXwfjWjdm() {
        return xwfjWjdm;
    }

    public void setXwfjWjdm(XwWjb xwfjWjdm) {
        this.xwfjWjdm = xwfjWjdm;
    }

    @Override
    public String toString() {
        return "XwFjb [xwfjId=" + xwfjId + ", xwfjXwdm=" + xwfjXwdm + ", xwfjWjdm=" + xwfjWjdm + "]";
    }

   
    
    
}