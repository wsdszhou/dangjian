package com.glut.dangjian.entity.approval.view;

import java.io.Serializable;
import java.util.List;

public class ViewJobUser implements Serializable{
    
    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    private Integer spgwId;

    private String spgwSpgwmc;

    private Integer spryId;

    private String userId;

    private String userMc;

    private String yhxxXm;

    private Integer bmId;

    private String bmMc;

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

    public Integer getSpryId() {
        return spryId;
    }

    public void setSpryId(Integer spryId) {
        this.spryId = spryId;
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

    public List<ViewApprovalJobUser> jobUserPageList(ViewApprovalJobUser viewApprovalJobUser) {
        // TODO Auto-generated method stub
        return null;
    }
}