package com.glut.dangjian.entity.approval;

import java.io.Serializable;
public class SpSpjdb  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 审批节点id
    private Integer spjdId;
    
    // 审批节点名称
    private String spjdMc;

    // 当前审批流程表id
    private SpSplcb spjdLcdm;

    // 当前审批状态 :1 代表通过，2代表没有通过
    private Integer spjdDqspzt;

    // 下一审批节点代码  （0代表最后一个审批节点）
    private SpSpjdb spjdXyspjddm;

    // 下一什么节点名称
    private String spjdXyjdmc;
    
    // 审批岗位表
    private SpSpgwb spjdGwdm;
    
    // 是否为第一审批节点（默认不是第一个节点）
    private Integer spjdIsFirst;
    
    public SpSpjdb() {
        super();
    }

    public SpSpjdb(Integer spjdId) {
        this.spjdId = spjdId;
    }

    public SpSpjdb(Integer spjdId, String spjdMc, SpSplcb spjdLcdm, Integer spjdDqspzt, SpSpjdb spjdXyspjddm,
            String spjdXyjdmc, SpSpgwb spjdGwdm, Integer spjdIsFirst) {
        this.spjdId = spjdId;
        this.spjdMc = spjdMc;
        this.spjdLcdm = spjdLcdm;
        this.spjdDqspzt = spjdDqspzt;
        this.spjdXyspjddm = spjdXyspjddm;
        this.spjdXyjdmc = spjdXyjdmc;
        this.spjdGwdm = spjdGwdm;
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
        this.spjdMc = spjdMc;
    }

    public SpSplcb getSpjdLcdm() {
        return spjdLcdm;
    }

    public void setSpjdLcdm(SpSplcb spjdLcdm) {
        this.spjdLcdm = spjdLcdm;
    }

    public Integer getSpjdDqspzt() {
        return spjdDqspzt;
    }

    public void setSpjdDqspzt(Integer spjdDqspzt) {
        this.spjdDqspzt = spjdDqspzt;
    }

    public SpSpjdb getSpjdXyspjddm() {
        return spjdXyspjddm;
    }

    public void setSpjdXyspjddm(SpSpjdb spjdXyspjddm) {
        this.spjdXyspjddm = spjdXyspjddm;
    }

    public String getSpjdXyjdmc() {
        return spjdXyjdmc;
    }

    public void setSpjdXyjdmc(String spjdXyjdmc) {
        this.spjdXyjdmc = spjdXyjdmc;
    }

    public SpSpgwb getSpjdGwdm() {
        return spjdGwdm;
    }

    public void setSpjdGwdm(SpSpgwb spjdGwdm) {
        this.spjdGwdm = spjdGwdm;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    public Integer getSpjdIsFirst() {
        return spjdIsFirst;
    }

    public void setSpjdIsFirst(Integer spjdIsFirst) {
        this.spjdIsFirst = spjdIsFirst;
    }

    @Override
    public String toString() {
        return "SpSpjdb [spjdId=" + spjdId + ", spjdMc=" + spjdMc + ", spjdLcdm=" + spjdLcdm + ", spjdDqspzt="
                + spjdDqspzt + ", spjdXyspjddm=" + spjdXyspjddm + ", spjdXyjdmc=" + spjdXyjdmc + ", spjdGwdm="
                + spjdGwdm + ", spjdIsFirst=" + spjdIsFirst + "]";
    }

    
    

   
    
    

}