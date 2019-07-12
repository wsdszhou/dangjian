package com.glut.dangjian.entity.user;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.alibaba.fastjson.annotation.JSONField;
import com.glut.dangjian.entity.authority.Role;
/**
 * 用户表对象
 * @author XuLanKong
 *
 */
public class Yhb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 用户id
    private String userId;

    // 用户名称
    private String userMc;

    // 密码加密密文
    private String  userPwk;
    
    // 密码
    private String userMm;

    //  微信id
    private String userWxId;

    // 微信名
    private String userWxm;

    // 用户描述
    private String userMs;

    // 用创建日期
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date userCjrq;

    // 状态表
    private Integer userZtdm;

    // 用户详细信息表
    private String userYhxxdm;
    
    private Integer userFlag;
    
    //  一对多：一个用户有多个角色
    private Set<Role> jsbs = new HashSet<Role>();
    
    public Yhb() {
        
    }

    public Yhb(String userId) {
        super();
        this.userId = userId;
    }

    public Yhb(String userId, String userMc, String userPwk, String userMm, String userWxId, String userWxm,
            String userMs, Date userCjrq, Integer userZtdm, String userYhxxdm) {
        super();
        this.userId = userId;
        this.userMc = userMc;
        this.userPwk = userPwk;
        this.userMm = userMm;
        this.userWxId = userWxId;
        this.userWxm = userWxm;
        this.userMs = userMs;
        this.userCjrq = userCjrq;
        this.userZtdm = userZtdm;
        this.userYhxxdm = userYhxxdm;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserMc() {
        return userMc;
    }

    public void setUserMc(String userMc) {
        this.userMc = userMc;
    }

    public String getUserPwk() {
        return userPwk;
    }

    public void setUserPwk(String userPwk) {
        this.userPwk = userPwk;
    }

    public String getUserMm() {
        return userMm;
    }

    public void setUserMm(String userMm) {
        this.userMm = userMm;
    }

    public String getUserWxId() {
        return userWxId;
    }

    public void setUserWxId(String userWxId) {
        this.userWxId = userWxId;
    }

    public String getUserWxm() {
        return userWxm;
    }

    public void setUserWxm(String userWxm) {
        this.userWxm = userWxm;
    }

    public String getUserMs() {
        return userMs;
    }

    public void setUserMs(String userMs) {
        this.userMs = userMs;
    }

    public Date getUserCjrq() {
        return userCjrq;
    }

    public void setUserCjrq(Date userCjrq) {
        this.userCjrq = userCjrq;
    }

    public Integer getUserZtdm() {
        return userZtdm;
    }

    public void setUserZtdm(Integer userZtdm) {
        this.userZtdm = userZtdm;
    }

    public String getUserYhxxdm() {
        return userYhxxdm;
    }

    public void setUserYhxxdm(String userYhxxdm) {
        this.userYhxxdm = userYhxxdm;
    }

    public Integer getUserFlag() {
        return userFlag;
    }

    public void setUserFlag(Integer userFlag) {
        this.userFlag = userFlag;
    }

    public Set<Role> getJsbs() {
        return jsbs;
    }

    public void setJsbs(Set<Role> jsbs) {
        this.jsbs = jsbs;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    @Override
    public String toString() {
        return "Yhb [userId=" + userId + ", userMc=" + userMc + ", userPwk=" + userPwk + ", userMm=" + userMm
                + ", userWxId=" + userWxId + ", userWxm=" + userWxm + ", userMs=" + userMs + ", userCjrq=" + userCjrq
                + ", userZtdm=" + userZtdm + ", userYhxxdm=" + userYhxxdm + ", userFlag=" + userFlag + ", jsbs=" + jsbs
                + "]";
    }
    
    
    
   
}