package com.glut.dangjian.entity.news;

import java.io.Serializable;

import com.glut.dangjian.entity.user.Yhb;

/**
 * 点赞表
 * @author XuLanKong
 *
 */
public class XwDzb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    // 点赞表id
    private String dzId;

    // 新闻表id
    private String dzXwdm;

    // 用户表id
    private String dzYhdm;
    
    public XwDzb() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public XwDzb(String dzId, String dzXwdm, String dzYhdm) {
        super();
        this.dzId = dzId;
        this.dzXwdm = dzXwdm;
        this.dzYhdm = dzYhdm;
    }

    public String getDzId() {
        return dzId;
    }

    public void setDzId(String dzId) {
        this.dzId = dzId;
    }

    public String getDzXwdm() {
        return dzXwdm;
    }

    public void setDzXwdm(String dzXwdm) {
        this.dzXwdm = dzXwdm;
    }

    public String getDzYhdm() {
        return dzYhdm;
    }

    public void setDzYhdm(String dzYhdm) {
        this.dzYhdm = dzYhdm;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    
    

    
    
}