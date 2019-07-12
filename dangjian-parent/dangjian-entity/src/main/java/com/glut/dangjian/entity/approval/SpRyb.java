package com.glut.dangjian.entity.approval;

import java.io.Serializable;

import com.glut.dangjian.entity.user.Yhb;

/**
 * 审批人员
 * @author XuLanKong
 *
 */
public class SpRyb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 审批人员id
    private Integer spryId;

    // 审批人员
    private Yhb spryYh;

    // 审批岗位
    private SpSpgwb sprySpgwdm;
    
    // 审批人所属部门
    private Integer spryBmdm;

    public Integer getSpryId() {
        return spryId;
    }

    public void setSpryId(Integer spryId) {
        this.spryId = spryId;
    }

    public Yhb getSpryYh() {
        return spryYh;
    }

    public void setSpryYh(Yhb spryYh) {
        this.spryYh = spryYh;
    }

    public SpSpgwb getSprySpgwdm() {
        return sprySpgwdm;
    }

    public void setSprySpgwdm(SpSpgwb sprySpgwdm) {
        this.sprySpgwdm = sprySpgwdm;
    }

    public Integer getSpryBmdm() {
        return spryBmdm;
    }

    public void setSpryBmdm(Integer spryBmdm) {
        this.spryBmdm = spryBmdm;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    @Override
    public String toString() {
        return "SpRyb [spryId=" + spryId + ", spryYh=" + spryYh + ", sprySpgwdm=" + sprySpgwdm + ", spryBmdm="
                + spryBmdm + "]";
    }

    
    
    
}