package com.glut.dangjian.entity.branch.view;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author lanlan
 *
 */
public class ViewBranchUser implements Serializable{
    
    private static final long serialVersionUID = 1L;

    private String userId;

    private String userMc;

    private String yhxxXm;

    private String yhxxXb;

    private Date yhxxCsrq;

    private Integer dnzwId;

    private String dnzwMc;

    private Integer dnzwJb;

    private Integer xzzwId;

    private String xzzwMc;

    private Integer xzzwJb;

    private Integer zbId;

    private String zbMc;

    private String zbMs;

    private Integer zblxId;

    private String zblxMc;

    private Integer bmId;

    private String bmMc;
    
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

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getUserMc() {
        return userMc;
    }

    public void setUserMc(String userMc) {
        this.userMc = userMc == null ? null : userMc.trim();
    }

    public String getYhxxXm() {
        return yhxxXm;
    }

    public void setYhxxXm(String yhxxXm) {
        this.yhxxXm = yhxxXm == null ? null : yhxxXm.trim();
    }

    public String getYhxxXb() {
        return yhxxXb;
    }

    public void setYhxxXb(String yhxxXb) {
        this.yhxxXb = yhxxXb == null ? null : yhxxXb.trim();
    }

    public Date getYhxxCsrq() {
        return yhxxCsrq;
    }

    public void setYhxxCsrq(Date yhxxCsrq) {
        this.yhxxCsrq = yhxxCsrq;
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
        this.dnzwMc = dnzwMc == null ? null : dnzwMc.trim();
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
        this.zbMc = zbMc == null ? null : zbMc.trim();
    }

    public String getZbMs() {
        return zbMs;
    }

    public void setZbMs(String zbMs) {
        this.zbMs = zbMs == null ? null : zbMs.trim();
    }

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
        this.bmMc = bmMc == null ? null : bmMc.trim();
    }

    @Override
    public String toString() {
        return "ViewBranchUser [userId=" + userId + ", userMc=" + userMc + ", yhxxXm=" + yhxxXm + ", yhxxXb=" + yhxxXb
                + ", yhxxCsrq=" + yhxxCsrq + ", dnzwId=" + dnzwId + ", dnzwMc=" + dnzwMc + ", dnzwJb=" + dnzwJb
                + ", xzzwId=" + xzzwId + ", xzzwMc=" + xzzwMc + ", xzzwJb=" + xzzwJb + ", zbId=" + zbId + ", zbMc="
                + zbMc + ", zbMs=" + zbMs + ", zblxId=" + zblxId + ", zblxMc=" + zblxMc + ", bmId=" + bmId + ", bmMc="
                + bmMc + "]";
    }
    
    
}