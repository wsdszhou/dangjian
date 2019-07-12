package com.glut.dangjian.entity.approval.view;

import java.io.Serializable;

public class ViewApprovalJobUser  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private Integer spgwId;

    private String spgwSpgwmc;

    private Integer splcId;

    private Integer splcState;

    private String splcMc;

    private Integer spryId;
    
    private String userId;

    private String yhxxXm;
    
    private Integer bmId;
    
    private String bmMc;
    
    private String userMc;
    
    private Integer spjdId;

    private String spjdMc;

    private Integer spjdDqspzt;

    private Integer spjdXyspjdid;

    private String spjdXyjdmc;
    
    private String noticeObjectId;
    
    public ViewApprovalJobUser() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public ViewApprovalJobUser(String userId) {
        super();
        this.userId = userId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getNoticeObjectId() {
        return noticeObjectId;
    }

    public void setNoticeObjectId(String noticeObjectId) {
        this.noticeObjectId = noticeObjectId;
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
        this.spjdMc = spjdMc;
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
        this.spjdXyjdmc = spjdXyjdmc;
    }

    public String getUserMc() {
        return userMc;
    }

    public void setUserMc(String userMc) {
        this.userMc = userMc;
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

    public Integer getSpryId() {
        return spryId;
    }

    public void setSpryId(Integer spryId) {
        this.spryId = spryId;
    }

    public String getYhxxXm() {
        return yhxxXm;
    }

    public void setYhxxXm(String yhxxXm) {
        this.yhxxXm = yhxxXm == null ? null : yhxxXm.trim();
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

    @Override
    public String toString() {
        return "ViewApprovalJobUser [spgwId=" + spgwId + ", spgwSpgwmc=" + spgwSpgwmc + ", splcId=" + splcId
                + ", splcState=" + splcState + ", splcMc=" + splcMc + ", spryId=" + spryId + ", yhxxXm=" + yhxxXm
                + ", bmId=" + bmId + ", bmMc=" + bmMc + ", userMc=" + userMc + ", spjdId=" + spjdId + ", spjdMc="
                + spjdMc + ", spjdDqspzt=" + spjdDqspzt + ", spjdXyspjdid=" + spjdXyspjdid + ", spjdXyjdmc="
                + spjdXyjdmc + "]";
    }

    

  
    
    
    
}