package com.glut.dangjian.entity.system.view;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ViewBug implements Serializable{
    private static final long serialVersionUID = 1L;

    private String id;

    private String bt;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date sj;
    
    private Integer sfyd;

    private String yhdm;

    private String userId;

    private String userMc;

    private String yhxxXm;

    private String nr;

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
        this.id = id == null ? null : id.trim();
    }

    public String getBt() {
        return bt;
    }

    public void setBt(String bt) {
        this.bt = bt == null ? null : bt.trim();
    }

    public Date getSj() {
        return sj;
    }

    public void setSj(Date sj) {
        this.sj = sj;
    }

    public String getYhdm() {
        return yhdm;
    }

    public void setYhdm(String yhdm) {
        this.yhdm = yhdm == null ? null : yhdm.trim();
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

    public String getNr() {
        return nr;
    }

    public void setNr(String nr) {
        this.nr = nr == null ? null : nr.trim();
    }
}