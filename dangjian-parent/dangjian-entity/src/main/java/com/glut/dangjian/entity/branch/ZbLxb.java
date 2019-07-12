package com.glut.dangjian.entity.branch;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * 支部类型
 * @author XuLanKong
 *
 */
public class ZbLxb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 支部类型id
    private Integer zblxId;

    // 支部类型名称
    private String zblxMc;
    
    // 一对多：一个类型有多个支部
    private Set<Zbb> zbbs = new HashSet<Zbb>();

    public Integer getZblxId() {
        return zblxId;
    }

    public void setZblxId(Integer zblxId) {
        this.zblxId = zblxId;
    }

    public String getZblxMc() {
        return zblxMc;
    }

    public void setZblxMc(String zblxMc) {
        this.zblxMc = zblxMc == null ? null : zblxMc.trim();
    }
}