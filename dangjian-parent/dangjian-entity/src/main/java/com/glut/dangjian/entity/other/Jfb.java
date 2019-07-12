package com.glut.dangjian.entity.other;

import java.io.Serializable;

/**
 * 积分表对象
 * @author XuLanKong
 *
 */
public class Jfb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 积分id
    private Integer jfId;

    // 积分所属用户
    private String jfYhdm;

    // 具体积分
    private Integer jfJfs;

    // 用户名称
    private String jfYhmc;

    public Integer getJfId() {
        return jfId;
    }

    public void setJfId(Integer jfId) {
        this.jfId = jfId;
    }

    public String getJfYhdm() {
        return jfYhdm;
    }

    public void setJfYhdm(String jfYhdm) {
        this.jfYhdm = jfYhdm == null ? null : jfYhdm.trim();
    }

    public Integer getJfJfs() {
        return jfJfs;
    }

    public void setJfJfs(Integer jfJfs) {
        this.jfJfs = jfJfs;
    }

    public String getJfYhmc() {
        return jfYhmc;
    }

    public void setJfYhmc(String jfYhmc) {
        this.jfYhmc = jfYhmc == null ? null : jfYhmc.trim();
    }

    @Override
    public String toString() {
        return "Jfb [jfId=" + jfId + ", jfYhdm=" + jfYhdm + ", jfJfs=" + jfJfs + ", jfYhmc=" + jfYhmc + "]";
    }
    
    
}