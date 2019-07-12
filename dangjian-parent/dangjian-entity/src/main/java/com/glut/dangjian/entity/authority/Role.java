package com.glut.dangjian.entity.authority;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.glut.dangjian.entity.other.Mkb;
import com.glut.dangjian.entity.user.Yhb;

/**
 * 
 * @author XuLanKong
 *
 */
public class Role implements Serializable{
    
    private static final long serialVersionUID = 1L;

    // 角色id
    private Integer jsId;

    // 角色名称
    private String jsMc;

    // 角色修改时间
    private Date jsXgsj;

    // 角色标识
    private String jsCode;

    // 角色描述
    private String jsMs;
    
    private String qxIds;

    //角色优先级（权限等级）,默认新角色优先级为99即普通角色，优先级为0表示超级管理员
    private int jsYxj;
    
    // 一对多：一个角色有多个权限
    private Set<Mkb> functions = new HashSet<Mkb>();

    // 一对多：一个角色有多个用户
    private Set<Yhb> yhbs = new HashSet<Yhb>();

    public int getJsYxj() {
        return jsYxj;
    }

    public void setJsYxj(int jsYxj) {
        this.jsYxj = jsYxj;
    }

    public String getQxIds() {
        return qxIds;
    }

    public void setQxIds(String qxIds) {
        this.qxIds = qxIds;
    }

    public Integer getJsId() {
        return jsId;
    }

    public void setJsId(Integer jsId) {
        this.jsId = jsId;
    }

    public String getJsMc() {
        return jsMc;
    }

    public void setJsMc(String jsMc) {
        this.jsMc = jsMc;
    }

    public Date getJsXgsj() {
        return jsXgsj;
    }

    public void setJsXgsj(Date jsXgsj) {
        this.jsXgsj = jsXgsj;
    }

    public String getJsCode() {
        return jsCode;
    }

    public void setJsCode(String jsCode) {
        this.jsCode = jsCode;
    }

    public String getJsMs() {
        return jsMs;
    }

    public void setJsMs(String jsMs) {
        this.jsMs = jsMs;
    }

    public Set<Mkb> getFunctions() {
        return functions;
    }

    public void setFunctions(Set<Mkb> functions) {
        this.functions = functions;
    }

    public Set<Yhb> getYhbs() {
        return yhbs;
    }

    public void setYhbs(Set<Yhb> yhbs) {
        this.yhbs = yhbs;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    @Override
    public String toString() {
        return "Role{" +
                "jsId=" + jsId +
                ", jsMc='" + jsMc + '\'' +
                ", jsXgsj=" + jsXgsj +
                ", jsCode='" + jsCode + '\'' +
                ", jsMs='" + jsMs + '\'' +
                ", qxIds='" + qxIds + '\'' +
                ", jsYxj=" + jsYxj +
                ", functions=" + functions +
                ", yhbs=" + yhbs +
                '}';
    }
}