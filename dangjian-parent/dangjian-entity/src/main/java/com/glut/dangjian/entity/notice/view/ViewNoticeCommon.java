package com.glut.dangjian.entity.notice.view;

import java.io.Serializable;
import java.util.Date;

public class ViewNoticeCommon  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private String tzdxId;

    private Integer tzdxSfyd;

    private Date tzdxYdsj;

    private Integer tzdxBmdm;

    private Integer tzdxZbdm;

    private String tzId;

    private String tzBt;

    private String tzNr;

    private Date tzFbsj;

    private String tzFbrmc;

    private Date tzJssj;

    private Integer tzFwdm;

    private Integer tzYxj;

    private String tzSpid;

    private String fbrid;

    private String fbrmc;

    private String fbryhxxid;

    private String fbrxm;

    public String getTzdxId() {
        return tzdxId;
    }

    public void setTzdxId(String tzdxId) {
        this.tzdxId = tzdxId == null ? null : tzdxId.trim();
    }

    public Integer getTzdxSfyd() {
        return tzdxSfyd;
    }

    public void setTzdxSfyd(Integer tzdxSfyd) {
        this.tzdxSfyd = tzdxSfyd;
    }

    public Date getTzdxYdsj() {
        return tzdxYdsj;
    }

    public void setTzdxYdsj(Date tzdxYdsj) {
        this.tzdxYdsj = tzdxYdsj;
    }

    public Integer getTzdxBmdm() {
        return tzdxBmdm;
    }

    public void setTzdxBmdm(Integer tzdxBmdm) {
        this.tzdxBmdm = tzdxBmdm;
    }

    public Integer getTzdxZbdm() {
        return tzdxZbdm;
    }

    public void setTzdxZbdm(Integer tzdxZbdm) {
        this.tzdxZbdm = tzdxZbdm;
    }

    public String getTzId() {
        return tzId;
    }

    public void setTzId(String tzId) {
        this.tzId = tzId == null ? null : tzId.trim();
    }

    public String getTzBt() {
        return tzBt;
    }

    public void setTzBt(String tzBt) {
        this.tzBt = tzBt == null ? null : tzBt.trim();
    }

    public String getTzNr() {
        return tzNr;
    }

    public void setTzNr(String tzNr) {
        this.tzNr = tzNr == null ? null : tzNr.trim();
    }

    public Date getTzFbsj() {
        return tzFbsj;
    }

    public void setTzFbsj(Date tzFbsj) {
        this.tzFbsj = tzFbsj;
    }

    public String getTzFbrmc() {
        return tzFbrmc;
    }

    public void setTzFbrmc(String tzFbrmc) {
        this.tzFbrmc = tzFbrmc == null ? null : tzFbrmc.trim();
    }

    public Date getTzJssj() {
        return tzJssj;
    }

    public void setTzJssj(Date tzJssj) {
        this.tzJssj = tzJssj;
    }

    public Integer getTzFwdm() {
        return tzFwdm;
    }

    public void setTzFwdm(Integer tzFwdm) {
        this.tzFwdm = tzFwdm;
    }

    public Integer getTzYxj() {
        return tzYxj;
    }

    public void setTzYxj(Integer tzYxj) {
        this.tzYxj = tzYxj;
    }

    public String getTzSpid() {
        return tzSpid;
    }

    public void setTzSpid(String tzSpid) {
        this.tzSpid = tzSpid == null ? null : tzSpid.trim();
    }

    public String getFbrid() {
        return fbrid;
    }

    public void setFbrid(String fbrid) {
        this.fbrid = fbrid == null ? null : fbrid.trim();
    }

    public String getFbrmc() {
        return fbrmc;
    }

    public void setFbrmc(String fbrmc) {
        this.fbrmc = fbrmc == null ? null : fbrmc.trim();
    }

    public String getFbryhxxid() {
        return fbryhxxid;
    }

    public void setFbryhxxid(String fbryhxxid) {
        this.fbryhxxid = fbryhxxid == null ? null : fbryhxxid.trim();
    }

    public String getFbrxm() {
        return fbrxm;
    }

    public void setFbrxm(String fbrxm) {
        this.fbrxm = fbrxm == null ? null : fbrxm.trim();
    }
}