package com.glut.dangjian.entity.authority;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
/**
 * 
 * @author XuLanKong
 *
 */
public class Function implements Serializable{
    
    private static final long serialVersionUID = 1L;

    // 模块id
    private Integer mkId;

    // 模块名称
    private String mkMc;

    // 模块关键字
    private String mkCode;

    // 模块父id
    private Integer mkFId;

    // 是否生成菜单
    private Integer mkSfsccd;

    // 排序
    private Integer mkPx;

    // 路径
    private String mkUrl;

    // 模块描述
    private String mkMs;

    // 模块图标
    private String mkIcon;

    // 修改日期
    private Date mkXgsj;
    
    // 一对多： 一个模块有多个角色
    private Set<Role> roles = new HashSet<Role>();
    
    // 一个模块有多个字模块
    private Set<Function> functions = new HashSet<Function>();
    
    public String getName() {
        return mkMc;
    }
    
    public Integer getPId() {
        return mkFId;
    }

    public Integer getMkId() {
        return mkId;
    }

    public void setMkId(Integer mkId) {
        this.mkId = mkId;
    }

    public String getMkMc() {
        return mkMc;
    }

    public void setMkMc(String mkMc) {
        this.mkMc = mkMc;
    }

    public String getMkCode() {
        return mkCode;
    }

    public void setMkCode(String mkCode) {
        this.mkCode = mkCode;
    }

    public Integer getMkFId() {
        return mkFId;
    }

    public void setMkFId(Integer mkFId) {
        this.mkFId = mkFId;
    }

    public Integer getMkSfsccd() {
        return mkSfsccd;
    }

    public void setMkSfsccd(Integer mkSfsccd) {
        this.mkSfsccd = mkSfsccd;
    }

    public Integer getMkPx() {
        return mkPx;
    }

    public void setMkPx(Integer mkPx) {
        this.mkPx = mkPx;
    }

    public String getMkUrl() {
        return mkUrl;
    }

    public void setMkUrl(String mkUrl) {
        this.mkUrl = mkUrl;
    }

    public String getMkMs() {
        return mkMs;
    }

    public void setMkMs(String mkMs) {
        this.mkMs = mkMs;
    }

    public String getMkIcon() {
        return mkIcon;
    }

    public void setMkIcon(String mkIcon) {
        this.mkIcon = mkIcon;
    }

    public Date getMkXgsj() {
        return mkXgsj;
    }

    public void setMkXgsj(Date mkXgsj) {
        this.mkXgsj = mkXgsj;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public Set<Function> getFunctions() {
        return functions;
    }

    public void setFunctions(Set<Function> functions) {
        this.functions = functions;
    }
    
    @Override
    public String toString() {
        return "Function [mkId=" + mkId + ", mkMc=" + mkMc + ", mkCode=" + mkCode + ", mkFId=" + mkFId + ", mkSfsccd="
                + mkSfsccd + ", mkPx=" + mkPx + ", mkUrl=" + mkUrl + ", mkMs=" + mkMs + ", mkIcon=" + mkIcon
                + ", mkXgsj=" + mkXgsj + ", roles=" + roles + ", functions=" + functions + "]";
    } 
    
    
    
}