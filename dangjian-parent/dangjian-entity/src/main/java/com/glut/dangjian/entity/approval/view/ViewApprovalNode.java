package com.glut.dangjian.entity.approval.view;

import java.io.Serializable;

public class ViewApprovalNode implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private Integer spjdId;

    private String spjdMc;

    private Integer spjdDqspzt;

    private Integer spjdXyspjdid;

    private String spjdXyjdmc;

    private Integer splcId;

    private Integer splcState;

    private String splcMc;

    private String splcYwdm;

    private Integer spgwId;

    private String spgwSpgwmc;
    
    private Integer spjdIsFirst;
    
    public Integer getSpjdIsFirst() {
        return spjdIsFirst;
    }

    public void setSpjdIsFirst(Integer spjdIsFirst) {
        this.spjdIsFirst = spjdIsFirst;
    }

    public Integer getSpjdId() {
        return spjdId;
    }

    public void setSpjdId(Integer spjdId) {
        this.spjdId = spjdId;
    }

    public String getSpjdMc() {
        return spjdMc;
    }

    public void setSpjdMc(String spjdMc) {
        this.spjdMc = spjdMc == null ? null : spjdMc.trim();
    }

    public Integer getSpjdDqspzt() {
        return spjdDqspzt;
    }

    public void setSpjdDqspzt(Integer spjdDqspzt) {
        this.spjdDqspzt = spjdDqspzt;
    }

    public Integer getSpjdXyspjdid() {
        return spjdXyspjdid;
    }

    public void setSpjdXyspjdid(Integer spjdXyspjdid) {
        this.spjdXyspjdid = spjdXyspjdid;
    }

    public String getSpjdXyjdmc() {
        return spjdXyjdmc;
    }

    public void setSpjdXyjdmc(String spjdXyjdmc) {
        this.spjdXyjdmc = spjdXyjdmc == null ? null : spjdXyjdmc.trim();
    }

    public Integer getSplcId() {
        return splcId;
    }

    public void setSplcId(Integer splcId) {
        this.splcId = splcId;
    }

    public Integer getSplcState() {
        return splcState;
    }

    public void setSplcState(Integer splcState) {
        this.splcState = splcState;
    }

    public String getSplcMc() {
        return splcMc;
    }

    public void setSplcMc(String splcMc) {
        this.splcMc = splcMc == null ? null : splcMc.trim();
    }

    public String getSplcYwdm() {
        return splcYwdm;
    }

    public void setSplcYwdm(String splcYwdm) {
        this.splcYwdm = splcYwdm == null ? null : splcYwdm.trim();
    }

    public Integer getSpgwId() {
        return spgwId;
    }

    public void setSpgwId(Integer spgwId) {
        this.spgwId = spgwId;
    }

    public String getSpgwSpgwmc() {
        return spgwSpgwmc;
    }

    public void setSpgwSpgwmc(String spgwSpgwmc) {
        this.spgwSpgwmc = spgwSpgwmc == null ? null : spgwSpgwmc.trim();
    }

    @Override
    public String toString() {
        return "ViewApprovalNode [spjdId=" + spjdId + ", spjdMc=" + spjdMc + ", spjdDqspzt=" + spjdDqspzt
                + ", spjdXyspjdid=" + spjdXyspjdid + ", spjdXyjdmc=" + spjdXyjdmc + ", splcId=" + splcId
                + ", splcState=" + splcState + ", splcMc=" + splcMc + ", splcYwdm=" + splcYwdm + ", spgwId=" + spgwId
                + ", spgwSpgwmc=" + spgwSpgwmc + ", spjdIsFirst=" + spjdIsFirst + "]";
    }

}