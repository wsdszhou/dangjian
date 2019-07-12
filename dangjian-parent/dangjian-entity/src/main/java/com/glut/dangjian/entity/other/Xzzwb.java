package com.glut.dangjian.entity.other;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.glut.dangjian.entity.user.Yhb;

/**
 * 行政职务
 * @author XuLanKong
 *
 */
public class Xzzwb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 行政职务id
    private Integer xzzwId;

    // 行政职务名称
    private String xzzwMc;

    // 任职级别（1表示校级，2表示学院级，3表示支部级）
    private Integer xzzwJb;
    
    private Set<Yhb> yhbs = new HashSet<Yhb>();
    

    public Xzzwb(Integer xzzwId) {
        super();
        this.xzzwId = xzzwId;
    }

    public Xzzwb() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Integer getXzzwId() {
        return xzzwId;
    }

    public void setXzzwId(Integer xzzwId) {
        this.xzzwId = xzzwId;
    }

    public String getXzzwMc() {
        return xzzwMc;
    }

    public void setXzzwMc(String xzzwMc) {
        this.xzzwMc = xzzwMc == null ? null : xzzwMc.trim();
    }

    public Integer getXzzwJb() {
        return xzzwJb;
    }

    public void setXzzwJb(Integer xzzwJb) {
        this.xzzwJb = xzzwJb;
    }

    public Set<Yhb> getYhbs() {
        return yhbs;
    }

    public void setYhbs(Set<Yhb> yhbs) {
        this.yhbs = yhbs;
    }

    @Override
    public String toString() {
        return "Xzzwb [xzzwId=" + xzzwId + ", xzzwMc=" + xzzwMc + ", xzzwJb=" + xzzwJb + ", yhbs=" + yhbs + "]";
    }
    
    
}