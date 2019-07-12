package com.glut.dangjian.entity.approval;

import java.io.Serializable;

/**
 * 审批流程
 * @author XuLanKong
 *
 */
public class SpSplcb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 审批流程id
    private Integer splcId;

    //  审批流程名称
    private String splcMc;
    
    //  审批流程启用状态：1代表启动，0代表未启动
    private Integer splcState;
    
    // 审批业务id
    private String splcYwdm;

    public SpSplcb() {
        
    }

    public SpSplcb(Integer splcId) {
        this.splcId = splcId;
    }
    
    public SpSplcb(Integer splcId, String splcMc, Integer splcState, String splcYwdm) {
        super();
        this.splcId = splcId;
        this.splcMc = splcMc;
        this.splcState = splcState;
        this.splcYwdm = splcYwdm;
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
        this.splcMc = splcMc;
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
        this.splcYwdm = splcYwdm;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    @Override
    public String toString() {
        return "SpSplcb [splcId=" + splcId + ", splcMc=" + splcMc + ", splcState=" + splcState + ", splcYwdm="
                + splcYwdm + "]";
    }

   

    

    
    
    
    
}