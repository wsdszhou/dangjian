package com.glut.dangjian.entity.news;

import java.io.Serializable;
import java.util.Date;

public class XwPlb  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private String id;

    private String xwdm;

    private String zw;

    private Date sj;

    private String yhdm;

    private Integer flag;
    
    private Integer accountPraise;
    
    public Integer getAccountPraise() {
        return accountPraise;
    }

    public void setAccountPraise(Integer accountPraise) {
        this.accountPraise = accountPraise;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getXwdm() {
        return xwdm;
    }

    public void setXwdm(String xwdm) {
        this.xwdm = xwdm == null ? null : xwdm.trim();
    }

    public String getZw() {
        return zw;
    }

    public void setZw(String zw) {
        this.zw = zw == null ? null : zw.trim();
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

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }
}