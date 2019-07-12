package com.glut.dangjian.entity.branch;

import java.io.Serializable;

import com.glut.dangjian.entity.user.Yhb;

/**
 * 支部成员
 * @author XuLanKong
 *
 */
public class ZbCyb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 支部成员表id
    private Integer zbcyId;

    // 支部
    private Zbb zbcyZbdm;

    // 支部成员id
    private Yhb zbcyYhdm;

    // 支部职务
    private String zbcyZw;

    public Integer getZbcyId() {
        return zbcyId;
    }

    public void setZbcyId(Integer zbcyId) {
        this.zbcyId = zbcyId;
    }

    public Zbb getZbcyZbdm() {
        return zbcyZbdm;
    }

    public void setZbcyZbdm(Zbb zbcyZbdm) {
        this.zbcyZbdm = zbcyZbdm;
    }

    public Yhb getZbcyYhdm() {
        return zbcyYhdm;
    }

    public void setZbcyYhdm(Yhb zbcyYhdm) {
        this.zbcyYhdm = zbcyYhdm;
    }

    public String getZbcyZw() {
        return zbcyZw;
    }

    public void setZbcyZw(String zbcyZw) {
        this.zbcyZw = zbcyZw;
    }

    @Override
    public String toString() {
        return "ZbCyb [zbcyId=" + zbcyId + ", zbcyZbdm=" + zbcyZbdm + ", zbcyYhdm=" + zbcyYhdm + ", zbcyZw=" + zbcyZw
                + "]";
    }

    
    
    
}