package com.glut.dangjian.entity.view;

import java.io.Serializable;
import java.util.Date;

public class ViewPartyinfo implements Serializable{
    
    private static final long serialVersionUID = 1L;

    private String id;
    
    private Date sqsj;
    
    private Date spsj;

    private Date rdsj;

    private String ms;

    private Date zrsj;

    private String zcdd;

    private Integer zt;

    private Integer bmdm;

    private Integer zbdm;

    private Integer dnzwdm;

    private Integer zzmmdm;

    private String userId;

    private String userMc;

    private String yhxxId;

    private String yhxxXm;

    private String yhxxXb;

    private Date yhxxCsrq;

    private String yhxxDhhm;

    private String yhxxSjh;

    private String yhxxYx;

    private String yhxxSfzh;

    private Integer xlId;

    private String xlMc;

    private Integer zzmmId;

    private String zzmmMc;

    private Integer jgId;

    private String jsSzqxMc;

    private String jgSzsMc;

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
    
    private Integer result;
    
    public Integer getResult() {
        return result;
    }

    public void setResult(Integer result) {
        this.result = result;
    }
    public Date getSqsj() {
        return sqsj;
    }

    public void setSqsj(Date sqsj) {
        this.sqsj = sqsj;
    }

    public Date getSpsj() {
        return spsj;
    }

    public void setSpsj(Date spsj) {
        this.spsj = spsj;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Date getRdsj() {
        return rdsj;
    }

    public void setRdsj(Date rdsj) {
        this.rdsj = rdsj;
    }

    public String getMs() {
        return ms;
    }

    public void setMs(String ms) {
        this.ms = ms == null ? null : ms.trim();
    }

    public Date getZrsj() {
        return zrsj;
    }

    public void setZrsj(Date zrsj) {
        this.zrsj = zrsj;
    }

    public String getZcdd() {
        return zcdd;
    }

    public void setZcdd(String zcdd) {
        this.zcdd = zcdd == null ? null : zcdd.trim();
    }

    public Integer getZt() {
        return zt;
    }

    public void setZt(Integer zt) {
        this.zt = zt;
    }

    public Integer getBmdm() {
        return bmdm;
    }

    public void setBmdm(Integer bmdm) {
        this.bmdm = bmdm;
    }

    public Integer getZbdm() {
        return zbdm;
    }

    public void setZbdm(Integer zbdm) {
        this.zbdm = zbdm;
    }

    public Integer getDnzwdm() {
        return dnzwdm;
    }

    public void setDnzwdm(Integer dnzwdm) {
        this.dnzwdm = dnzwdm;
    }

    public Integer getZzmmdm() {
        return zzmmdm;
    }

    public void setZzmmdm(Integer zzmmdm) {
        this.zzmmdm = zzmmdm;
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

    public String getYhxxId() {
        return yhxxId;
    }

    public void setYhxxId(String yhxxId) {
        this.yhxxId = yhxxId == null ? null : yhxxId.trim();
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

    public String getYhxxDhhm() {
        return yhxxDhhm;
    }

    public void setYhxxDhhm(String yhxxDhhm) {
        this.yhxxDhhm = yhxxDhhm == null ? null : yhxxDhhm.trim();
    }

    public String getYhxxSjh() {
        return yhxxSjh;
    }

    public void setYhxxSjh(String yhxxSjh) {
        this.yhxxSjh = yhxxSjh == null ? null : yhxxSjh.trim();
    }

    public String getYhxxYx() {
        return yhxxYx;
    }

    public void setYhxxYx(String yhxxYx) {
        this.yhxxYx = yhxxYx == null ? null : yhxxYx.trim();
    }

    public String getYhxxSfzh() {
        return yhxxSfzh;
    }

    public void setYhxxSfzh(String yhxxSfzh) {
        this.yhxxSfzh = yhxxSfzh == null ? null : yhxxSfzh.trim();
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
        this.xlMc = xlMc == null ? null : xlMc.trim();
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
        this.zzmmMc = zzmmMc == null ? null : zzmmMc.trim();
    }

    public Integer getJgId() {
        return jgId;
    }

    public void setJgId(Integer jgId) {
        this.jgId = jgId;
    }

    public String getJsSzqxMc() {
        return jsSzqxMc;
    }

    public void setJsSzqxMc(String jsSzqxMc) {
        this.jsSzqxMc = jsSzqxMc == null ? null : jsSzqxMc.trim();
    }

    public String getJgSzsMc() {
        return jgSzsMc;
    }

    public void setJgSzsMc(String jgSzsMc) {
        this.jgSzsMc = jgSzsMc == null ? null : jgSzsMc.trim();
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
        this.mzMc = mzMc == null ? null : mzMc.trim();
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
        this.xzzwMc = xzzwMc == null ? null : xzzwMc.trim();
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
        this.bmMc = bmMc == null ? null : bmMc.trim();
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
}