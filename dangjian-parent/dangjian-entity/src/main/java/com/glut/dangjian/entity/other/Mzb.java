package com.glut.dangjian.entity.other;

import java.io.Serializable;

/**
 * 民族表
 * @author XuLanKong
 *
 */
public class Mzb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 民族id
    private Integer mzId;

    // 民族名称
    private String mzMc;
    
    public Mzb(Integer mzId) {
        super();
        this.mzId = mzId;
    }

    public Mzb() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Integer getMzId() {
        return mzId;
    }

    public void setMzId(Integer mzId) {
        this.mzId = mzId;
    }

    public String getMzMc() {
        return mzMc;
    }

    public void setMzMc(String mzMc) {
        this.mzMc = mzMc == null ? null : mzMc.trim();
    }

    @Override
    public String toString() {
        return "Mzb [mzId=" + mzId + ", mzMc=" + mzMc + "]";
    }
    
    
}