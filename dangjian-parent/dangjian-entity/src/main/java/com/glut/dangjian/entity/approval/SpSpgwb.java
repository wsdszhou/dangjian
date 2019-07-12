package com.glut.dangjian.entity.approval;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * 审批岗位
 * @author XuLanKong
 *
 */
public class SpSpgwb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 审批岗位id
    private Integer spgwId;

    // 审批岗位名称
    private String spgwSpgwmc;
    
    // 审批所属流程
    private SpSplcb spgwLcdm;

    // 一个岗位有多歌人员可以审批
    private Set<SpRyb> spRybs = new HashSet<SpRyb>();

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
        this.spgwSpgwmc = spgwSpgwmc;
    }

    public Set<SpRyb> getSpRybs() {
        return spRybs;
    }

    public void setSpRybs(Set<SpRyb> spRybs) {
        this.spRybs = spRybs;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    public SpSplcb getSpgwLcdm() {
        return spgwLcdm;
    }

    public void setSpgwLcdm(SpSplcb spgwLcdm) {
        this.spgwLcdm = spgwLcdm;
    }

    @Override
    public String toString() {
        return "SpSpgwb [spgwId=" + spgwId + ", spgwSpgwmc=" + spgwSpgwmc + ", spgwLcdm=" + spgwLcdm + ", spRybs="
                + spRybs + "]";
    }

    

   

    
}