package com.glut.dangjian.entity.branch.view;

import java.io.Serializable;
import java.util.Date;

public class ViewBranch implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private Integer zbId;

    private String zbMc;

    private String zbMs;

    private Date zbXgsj;

    private Integer bmId;

    private String bmMc;

    private Integer zblxId;

    private String zblxMc;

    private String sjid;

    private String sjxm;

    private String zzwyid;

    private String zzwyxm;

    private String xcwyid;

    private String xcwyxm;

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

    public Date getZbXgsj() {
        return zbXgsj;
    }

    public void setZbXgsj(Date zbXgsj) {
        this.zbXgsj = zbXgsj;
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

    public String getSjid() {
        return sjid;
    }

    public void setSjid(String sjid) {
        this.sjid = sjid == null ? null : sjid.trim();
    }

    public String getSjxm() {
        return sjxm;
    }

    public void setSjxm(String sjxm) {
        this.sjxm = sjxm == null ? null : sjxm.trim();
    }

    public String getZzwyid() {
        return zzwyid;
    }

    public void setZzwyid(String zzwyid) {
        this.zzwyid = zzwyid == null ? null : zzwyid.trim();
    }

    public String getZzwyxm() {
        return zzwyxm;
    }

    public void setZzwyxm(String zzwyxm) {
        this.zzwyxm = zzwyxm == null ? null : zzwyxm.trim();
    }

    public String getXcwyid() {
        return xcwyid;
    }

    public void setXcwyid(String xcwyid) {
        this.xcwyid = xcwyid == null ? null : xcwyid.trim();
    }

    public String getXcwyxm() {
        return xcwyxm;
    }

    public void setXcwyxm(String xcwyxm) {
        this.xcwyxm = xcwyxm == null ? null : xcwyxm.trim();
    }
}