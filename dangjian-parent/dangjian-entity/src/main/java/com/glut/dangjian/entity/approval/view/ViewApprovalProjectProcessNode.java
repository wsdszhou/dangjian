package com.glut.dangjian.entity.approval.view;

import java.io.Serializable;
import java.util.Date;

public class ViewApprovalProjectProcessNode implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private String lcxmId;

    private String lcxmMc;

    private String lcxmXmms;

    private Integer lcxmDqspzt;

    private Integer lcxmResulte;

    private Date lcxmXgsj;

    private Integer spjdId;

    private String spjdMc;

    private Integer spjdDqspzt;

    private Integer spjdXyspjddm;

    private String spjdXyjdmc;

    private Integer spjdIsfirst;

    private Integer splcId;

    private String splcMc;

    private Integer splcState;

    private String splcYwdm;

    private Integer spgwId;

    private String spgwSpgwmc;

    public String getLcxmId() {
        return lcxmId;
    }

    public void setLcxmId(String lcxmId) {
        this.lcxmId = lcxmId == null ? null : lcxmId.trim();
    }

    public String getLcxmMc() {
        return lcxmMc;
    }

    public void setLcxmMc(String lcxmMc) {
        this.lcxmMc = lcxmMc == null ? null : lcxmMc.trim();
    }

    public String getLcxmXmms() {
        return lcxmXmms;
    }

    public void setLcxmXmms(String lcxmXmms) {
        this.lcxmXmms = lcxmXmms == null ? null : lcxmXmms.trim();
    }

    public Integer getLcxmDqspzt() {
        return lcxmDqspzt;
    }

    public void setLcxmDqspzt(Integer lcxmDqspzt) {
        this.lcxmDqspzt = lcxmDqspzt;
    }

    public Integer getLcxmResulte() {
        return lcxmResulte;
    }

    public void setLcxmResulte(Integer lcxmResulte) {
        this.lcxmResulte = lcxmResulte;
    }

    public Date getLcxmXgsj() {
        return lcxmXgsj;
    }

    public void setLcxmXgsj(Date lcxmXgsj) {
        this.lcxmXgsj = lcxmXgsj;
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

    public Integer getSpjdXyspjddm() {
        return spjdXyspjddm;
    }

    public void setSpjdXyspjddm(Integer spjdXyspjddm) {
        this.spjdXyspjddm = spjdXyspjddm;
    }

    public String getSpjdXyjdmc() {
        return spjdXyjdmc;
    }

    public void setSpjdXyjdmc(String spjdXyjdmc) {
        this.spjdXyjdmc = spjdXyjdmc == null ? null : spjdXyjdmc.trim();
    }

    public Integer getSpjdIsfirst() {
        return spjdIsfirst;
    }

    public void setSpjdIsfirst(Integer spjdIsfirst) {
        this.spjdIsfirst = spjdIsfirst;
    }

    public Integer getSplcId() {
        return splcId;
    }

    public void setSplcId(Integer splcId) {
        this.splcId = splcId;
    }

    public String getSplcMc() {
        return splcMc;
    }

    public void setSplcMc(String splcMc) {
        this.splcMc = splcMc == null ? null : splcMc.trim();
    }

    public Integer getSplcState() {
        return splcState;
    }

    public void setSplcState(Integer splcState) {
        this.splcState = splcState;
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
        return "ViewApprovalProjectProcessNode [lcxmId=" + lcxmId + ", lcxmMc=" + lcxmMc + ", lcxmXmms=" + lcxmXmms
                + ", lcxmDqspzt=" + lcxmDqspzt + ", lcxmResulte=" + lcxmResulte + ", lcxmXgsj=" + lcxmXgsj + ", spjdId="
                + spjdId + ", spjdMc=" + spjdMc + ", spjdDqspzt=" + spjdDqspzt + ", spjdXyspjddm=" + spjdXyspjddm
                + ", spjdXyjdmc=" + spjdXyjdmc + ", spjdIsfirst=" + spjdIsfirst + ", splcId=" + splcId + ", splcMc="
                + splcMc + ", splcState=" + splcState + ", splcYwdm=" + splcYwdm + ", spgwId=" + spgwId
                + ", spgwSpgwmc=" + spgwSpgwmc + "]";
    }
    
    
}