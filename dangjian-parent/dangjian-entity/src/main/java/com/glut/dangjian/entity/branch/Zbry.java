package com.glut.dangjian.entity.branch;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.Null;

public class Zbry implements Serializable{
    
    private static final long serialVersionUID = -1875247656945794301L;

    private Integer zbryId;

    private String zbryMc;

    private Date zbryHdsj;

    private String zbryJs;

    private Zbb zbryZbdm;

    private String zbryTp;
    
    public String getZbMc() {
        if (zbryZbdm != null) {
            return zbryZbdm.getZbMc();
        }
        return null;
    }

    public Integer getZbryId() {
        return zbryId;
    }

    public void setZbryId(Integer zbryId) {
        this.zbryId = zbryId;
    }

    public String getZbryMc() {
        return zbryMc;
    }

    public void setZbryMc(String zbryMc) {
        this.zbryMc = zbryMc == null ? null : zbryMc.trim();
    }

    public Date getZbryHdsj() {
        return zbryHdsj;
    }

    public void setZbryHdsj(Date zbryHdsj) {
        this.zbryHdsj = zbryHdsj;
    }

    public String getZbryJs() {
        return zbryJs;
    }

    public void setZbryJs(String zbryJs) {
        this.zbryJs = zbryJs == null ? null : zbryJs.trim();
    }

    
    public Zbb getZbryZbdm() {
        return zbryZbdm;
    }

    public void setZbryZbdm(Zbb zbryZbdm) {
        this.zbryZbdm = zbryZbdm;
    }

    public String getZbryTp() {
        return zbryTp;
    }

    public void setZbryTp(String zbryTp) {
        this.zbryTp = zbryTp == null ? null : zbryTp.trim();
    }
}