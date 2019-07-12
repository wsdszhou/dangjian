package com.glut.dangjian.entity.notice;

import java.io.Serializable;

/**
 * 通知范围表
 * @author XuLanKong
 *
 */
public class NoticeRange implements Serializable{
    
    private static final long serialVersionUID = 1L;

    // 通知范围id
    private Integer tzfwId;

    // 通知范围名称
    private String tzfwMc;
    
    public NoticeRange() {
        
    }

    public NoticeRange(String tzfwMc) {
        this.tzfwMc = tzfwMc;
    }

    public NoticeRange(Integer tzfwId) {
        this.tzfwId = tzfwId;
    }

    public Integer getTzfwId() {
        return tzfwId;
    }

    public void setTzfwId(Integer tzfwId) {
        this.tzfwId = tzfwId;
    }

    public String getTzfwMc() {
        return tzfwMc;
    }

    public void setTzfwMc(String tzfwMc) {
        this.tzfwMc = tzfwMc == null ? null : tzfwMc.trim();
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    @Override
    public String toString() {
        return "NoticeRange [tzfwId=" + tzfwId + ", tzfwMc=" + tzfwMc + "]";
    }
    
    
}