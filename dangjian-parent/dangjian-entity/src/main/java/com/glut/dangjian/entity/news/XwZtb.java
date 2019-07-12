package com.glut.dangjian.entity.news;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
/**
 * 新闻状态
 * @author XuLanKong
 *
 */
public class XwZtb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 新闻状态id
    private Integer xwztId;

    // 新闻状态名称
    private String xwztMc;
    
    // 一对多：一个新闻状态有多个新闻
    private Set<Xwb> xwbs = new HashSet<Xwb>();
    
    

    public XwZtb() {
        
    }

    public XwZtb(Integer xwztId) {
        this.xwztId = xwztId;
    }
    
    public XwZtb(Integer xwztId, String xwztMc) {
        super();
        this.xwztId = xwztId;
        this.xwztMc = xwztMc;
    }

    public XwZtb(Integer xwztId, String xwztMc, Set<Xwb> xwbs) {
        this.xwztId = xwztId;
        this.xwztMc = xwztMc;
        this.xwbs = xwbs;
    }

    public Integer getXwztId() {
        return xwztId;
    }

    public void setXwztId(Integer xwztId) {
        this.xwztId = xwztId;
    }

    public String getXwztMc() {
        return xwztMc;
    }

    public void setXwztMc(String xwztMc) {
        this.xwztMc = xwztMc == null ? null : xwztMc.trim();
    }

    public Set<Xwb> getXwbs() {
        return xwbs;
    }

    public void setXwbs(Set<Xwb> xwbs) {
        this.xwbs = xwbs;
    }

    @Override
    public String toString() {
        return "XwZtb [xwztId=" + xwztId + ", xwztMc=" + xwztMc + ", xwbs=" + xwbs + "]";
    }
    
    
    
    
}