package com.glut.dangjian.entity.other;

import java.io.Serializable;
import java.util.Date;

import com.glut.dangjian.entity.user.Yhb;

public class Bug  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private String id;

    private String bt;

    private Date sj;

    private Yhb yhdm;

    private String nr;
    
    private Integer sfyd;
    
    public Integer getSfyd() {
        return sfyd;
    }

    public void setSfyd(Integer sfyd) {
        this.sfyd = sfyd;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBt() {
        return bt;
    }

    public void setBt(String bt) {
        this.bt = bt;
    }

    public Date getSj() {
        return sj;
    }

    public void setSj(Date sj) {
        this.sj = sj;
    }

    public Yhb getYhdm() {
        return yhdm;
    }

    public void setYhdm(Yhb yhdm) {
        this.yhdm = yhdm;
    }

    public String getNr() {
        return nr;
    }

    public void setNr(String nr) {
        this.nr = nr;
    }

    
}