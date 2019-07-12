package com.glut.dangjian.entity.approval;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

/**
 * 流程项目表
 * @author XuLanKong
 *
 */
public class SpLcxmb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 流程项目id
    private String lcxmId;
    
    // 流程项目名称
    private String lcxmMc;

    // 审批流程表
    private SpSplcb lcxmSplcdm;

    // 项目描述
    private String lcxmXmms;

    // 审批当前节点
    private SpSpjdb splbDqjddm;

    // 当前审批状态(0代表未审批，1代表审批结束)
    private Integer splbDqspzt;

    // 审批结果（1：是审批通过，0是审批不通过）
    private Integer splbResulte;
    
    // 审批时间
    private Date splbXgsj;
    
    private String lcxmDxId;
    
  
    public SpLcxmb() {
        super();
        // TODO Auto-generated constructor stub
    }

    public SpLcxmb(String lcxmId, String lcxmMc, SpSplcb lcxmSplcdm, String lcxmXmms, SpSpjdb splbDqjddm,
            Integer splbDqspzt, Integer splbResulte, Date splbXgsj, String lcxmDxId) {
        super();
        this.lcxmId = lcxmId;
        this.lcxmMc = lcxmMc;
        this.lcxmSplcdm = lcxmSplcdm;
        this.lcxmXmms = lcxmXmms;
        this.splbDqjddm = splbDqjddm;
        this.splbDqspzt = splbDqspzt;
        this.splbResulte = splbResulte;
        this.splbXgsj = splbXgsj;
        this.lcxmDxId = lcxmDxId;
    }
    
    public String getLcxmDxId() {
        return lcxmDxId;
    }

    public void setLcxmDxId(String lcxmDxId) {
        this.lcxmDxId = lcxmDxId;
    }

    public String getLcxmId() {
        return lcxmId;
    }

    public void setLcxmId(String lcxmId) {
        this.lcxmId = lcxmId;
    }

    public String getLcxmMc() {
        return lcxmMc;
    }

    public void setLcxmMc(String lcxmMc) {
        this.lcxmMc = lcxmMc;
    }

    public SpSplcb getLcxmSplcdm() {
        return lcxmSplcdm;
    }

    public void setLcxmSplcdm(SpSplcb lcxmSplcdm) {
        this.lcxmSplcdm = lcxmSplcdm;
    }

    public String getLcxmXmms() {
        return lcxmXmms;
    }

    public void setLcxmXmms(String lcxmXmms) {
        this.lcxmXmms = lcxmXmms;
    }

    public SpSpjdb getSplbDqjddm() {
        return splbDqjddm;
    }

    public void setSplbDqjddm(SpSpjdb splbDqjddm) {
        this.splbDqjddm = splbDqjddm;
    }

    public Integer getSplbDqspzt() {
        return splbDqspzt;
    }

    public void setSplbDqspzt(Integer splbDqspzt) {
        this.splbDqspzt = splbDqspzt;
    }

    public Integer getSplbResulte() {
        return splbResulte;
    }

    public void setSplbResulte(Integer splbResulte) {
        this.splbResulte = splbResulte;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    public Date getSplbXgsj() {
        return splbXgsj;
    }

    public void setSplbXgsj(Date splbXgsj) {
        this.splbXgsj = splbXgsj;
    }

    @Override
    public String toString() {
        return "SpLcxmb [lcxmId=" + lcxmId + ", lcxmMc=" + lcxmMc + ", lcxmSplcdm=" + lcxmSplcdm + ", lcxmXmms="
                + lcxmXmms + ", splbDqjddm=" + splbDqjddm + ", splbDqspzt=" + splbDqspzt + ", splbResulte="
                + splbResulte + ", splbXgsj=" + splbXgsj + "]";
    }

    

    
    
    
    
    
}