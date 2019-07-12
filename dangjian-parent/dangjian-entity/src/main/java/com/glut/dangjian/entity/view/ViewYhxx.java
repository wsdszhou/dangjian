package com.glut.dangjian.entity.view;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

public class ViewYhxx  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private String yhxxId;

    private String yhxxXm;

    private String yhxxXb;

    @JSONField(format = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date yhxxCsrq;

    private String yhxxSjh;

    private String yhxxMj;

    private String yhxxYx;
    
    private String yhxxDhhm;

    private String yhxxSfzh;

    private String yhxxMs;

    private String yhxxDa;

    private Integer xlId;

    private String xlMc;

    private Integer zzmmId;

    private String zzmmMc;

    private Integer jgId;

    private Integer jsSzsId;

    private String jsSzqxMc;

    private String jgSzsMc;
    
    private String jgMc;

    private Integer mzId;

    private String mzMc;

    private Integer dnzwId;

    private String dnzwMc;

    private Integer dnzwJb;

    private Integer xzzwId;

    private String xzzwMc;

    private Integer xzzwJb;

    private Integer bmId;

    private String bmMc;

    private Integer zbId;

    private String zbMc;

    private Integer zbSsbmdm;

    private Integer zbLxdm;

    private String zbMs;

    private String userId;

    private String userMc;

    private String userPwk;

    private String userMm;

    private String userWxId;

    private String userWxm;

    private String userMs;

    @JSONField(format = "yyyy/MM/dd")
    @DateTimeFormat(pattern="yyyy/MM/dd")
    private Date userCjrq;

    private Integer userZtId;
    
    private String userZtMc;

    private byte[] yhxxTx;
    
    private String userYhxxdm ;
    
    private Integer[] roleIds;
    
    private Integer userFlag;
    
    public ViewYhxx() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public ViewYhxx(String userId) {
        this.userId = userId;
    }

    public Integer getUserFlag() {
        return userFlag;
    }

    public void setUserFlag(Integer userFlag) {
        this.userFlag = userFlag;
    }
    
    
    public String getYhxxId() {
        return yhxxId;
    }

    public void setYhxxId(String yhxxId) {
        this.yhxxId = yhxxId;
    }

    public String getYhxxXm() {
        return yhxxXm;
    }

    public void setYhxxXm(String yhxxXm) {
        this.yhxxXm = yhxxXm;
    }

    public String getYhxxXb() {
        return yhxxXb;
    }

    public void setYhxxXb(String yhxxXb) {
        this.yhxxXb = yhxxXb;
    }

    public Date getYhxxCsrq() {
        return yhxxCsrq;
    }

    public void setYhxxCsrq(Date yhxxCsrq) {
        this.yhxxCsrq = yhxxCsrq;
    }

    public String getYhxxSjh() {
        return yhxxSjh;
    }

    public void setYhxxSjh(String yhxxSjh) {
        this.yhxxSjh = yhxxSjh;
    }

    public String getYhxxMj() {
        return yhxxMj;
    }

    public void setYhxxMj(String yhxxMj) {
        this.yhxxMj = yhxxMj;
    }

    public String getYhxxYx() {
        return yhxxYx;
    }

    public void setYhxxYx(String yhxxYx) {
        this.yhxxYx = yhxxYx;
    }

    public String getYhxxDhhm() {
        return yhxxDhhm;
    }

    public void setYhxxDhhm(String yhxxDhhm) {
        this.yhxxDhhm = yhxxDhhm;
    }

    public String getYhxxSfzh() {
        return yhxxSfzh;
    }

    public void setYhxxSfzh(String yhxxSfzh) {
        this.yhxxSfzh = yhxxSfzh;
    }

    public String getYhxxMs() {
        return yhxxMs;
    }

    public void setYhxxMs(String yhxxMs) {
        this.yhxxMs = yhxxMs;
    }

    public String getYhxxDa() {
        return yhxxDa;
    }

    public void setYhxxDa(String yhxxDa) {
        this.yhxxDa = yhxxDa;
    }

    public Integer getXlId() {
        return xlId;
    }

    public void setXlId(Integer xlId) {
        this.xlId = xlId;
    }

    public String getXlMc() {
        return xlMc;
    }

    public void setXlMc(String xlMc) {
        this.xlMc = xlMc;
    }

    public Integer getZzmmId() {
        return zzmmId;
    }

    public void setZzmmId(Integer zzmmId) {
        this.zzmmId = zzmmId;
    }

    public String getZzmmMc() {
        return zzmmMc;
    }

    public void setZzmmMc(String zzmmMc) {
        this.zzmmMc = zzmmMc;
    }

    public Integer getJgId() {
        return jgId;
    }

    public void setJgId(Integer jgId) {
        this.jgId = jgId;
    }

    public Integer getJsSzsId() {
        return jsSzsId;
    }

    public void setJsSzsId(Integer jsSzsId) {
        this.jsSzsId = jsSzsId;
    }

    public String getJsSzqxMc() {
        return jsSzqxMc;
    }

    public void setJsSzqxMc(String jsSzqxMc) {
        this.jsSzqxMc = jsSzqxMc;
    }

    public String getJgSzsMc() {
        return jgSzsMc;
    }

    public void setJgSzsMc(String jgSzsMc) {
        this.jgSzsMc = jgSzsMc;
    }

    public String getJgMc() {
        return jgMc;
    }

    public void setJgMc(String jgMc) {
        this.jgMc = jgMc;
    }

    public Integer getMzId() {
        return mzId;
    }

    public void setMzId(Integer mzId) {
        this.mzId = mzId;
    }

    public String getMzMc() {
        return mzMc;
    }

    public void setMzMc(String mzMc) {
        this.mzMc = mzMc;
    }

    public Integer getDnzwId() {
        return dnzwId;
    }

    public void setDnzwId(Integer dnzwId) {
        this.dnzwId = dnzwId;
    }

    public String getDnzwMc() {
        return dnzwMc;
    }

    public void setDnzwMc(String dnzwMc) {
        this.dnzwMc = dnzwMc;
    }

    public Integer getDnzwJb() {
        return dnzwJb;
    }

    public void setDnzwJb(Integer dnzwJb) {
        this.dnzwJb = dnzwJb;
    }

    public Integer getXzzwId() {
        return xzzwId;
    }

    public void setXzzwId(Integer xzzwId) {
        this.xzzwId = xzzwId;
    }

    public String getXzzwMc() {
        return xzzwMc;
    }

    public void setXzzwMc(String xzzwMc) {
        this.xzzwMc = xzzwMc;
    }

    public Integer getXzzwJb() {
        return xzzwJb;
    }

    public void setXzzwJb(Integer xzzwJb) {
        this.xzzwJb = xzzwJb;
    }

    public Integer getBmId() {
        return bmId;
    }

    public void setBmId(Integer bmId) {
        this.bmId = bmId;
    }

    public String getBmMc() {
        return bmMc;
    }

    public void setBmMc(String bmMc) {
        this.bmMc = bmMc;
    }

    public Integer getZbId() {
        return zbId;
    }

    public void setZbId(Integer zbId) {
        this.zbId = zbId;
    }

    public String getZbMc() {
        return zbMc;
    }

    public void setZbMc(String zbMc) {
        this.zbMc = zbMc;
    }

    public Integer getZbSsbmdm() {
        return zbSsbmdm;
    }

    public void setZbSsbmdm(Integer zbSsbmdm) {
        this.zbSsbmdm = zbSsbmdm;
    }

    public Integer getZbLxdm() {
        return zbLxdm;
    }

    public void setZbLxdm(Integer zbLxdm) {
        this.zbLxdm = zbLxdm;
    }

    public String getZbMs() {
        return zbMs;
    }

    public void setZbMs(String zbMs) {
        this.zbMs = zbMs;
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

    public Integer getUserZtId() {
        return userZtId;
    }

    public void setUserZtId(Integer userZtId) {
        this.userZtId = userZtId;
    }

    public String getUserZtMc() {
        return userZtMc;
    }

    public void setUserZtMc(String userZtMc) {
        this.userZtMc = userZtMc;
    }

    public byte[] getYhxxTx() {
        return yhxxTx;
    }

    public void setYhxxTx(byte[] yhxxTx) {
        this.yhxxTx = yhxxTx;
    }

    public String getUserYhxxdm() {
        return userYhxxdm;
    }

    public void setUserYhxxdm(String userYhxxdm) {
        this.userYhxxdm = userYhxxdm;
    }

    public Integer[] getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(Integer[] roleIds) {
        this.roleIds = roleIds;
    }

    @Override
    public String toString() {
        return "ViewYhxx [yhxxId=" + yhxxId + ", yhxxXm=" + yhxxXm + ", yhxxXb=" + yhxxXb + ", yhxxCsrq=" + yhxxCsrq
                + ", yhxxSjh=" + yhxxSjh + ", yhxxMj=" + yhxxMj + ", yhxxYx=" + yhxxYx + ", yhxxDhhm=" + yhxxDhhm
                + ", yhxxSfzh=" + yhxxSfzh + ", yhxxMs=" + yhxxMs + ", yhxxDa=" + yhxxDa + ", xlId=" + xlId + ", xlMc="
                + xlMc + ", zzmmId=" + zzmmId + ", zzmmMc=" + zzmmMc + ", jgId=" + jgId + ", jsSzsId=" + jsSzsId
                + ", jsSzqxMc=" + jsSzqxMc + ", jgSzsMc=" + jgSzsMc + ", jgMc=" + jgMc + ", mzId=" + mzId + ", mzMc="
                + mzMc + ", dnzwId=" + dnzwId + ", dnzwMc=" + dnzwMc + ", dnzwJb=" + dnzwJb + ", xzzwId=" + xzzwId
                + ", xzzwMc=" + xzzwMc + ", xzzwJb=" + xzzwJb + ", bmId=" + bmId + ", bmMc=" + bmMc + ", zbId=" + zbId
                + ", zbMc=" + zbMc + ", zbSsbmdm=" + zbSsbmdm + ", zbLxdm=" + zbLxdm + ", zbMs=" + zbMs + ", userId="
                + userId + ", userMc=" + userMc + ", userPwk=" + userPwk + ", userMm=" + userMm + ", userWxId="
                + userWxId + ", userWxm=" + userWxm + ", userMs=" + userMs + ", userCjrq=" + userCjrq + ", userZtId="
                + userZtId + ", userZtMc=" + userZtMc + ", yhxxTx=" + Arrays.toString(yhxxTx) + ", userYhxxdm="
                + userYhxxdm + ", roleIds=" + Arrays.toString(roleIds) + "]";
    }
    
    
    

    
    
    
}