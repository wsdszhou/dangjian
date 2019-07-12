package com.glut.dangjian.entity.news.view;

import java.io.Serializable;
import java.util.Date;

public class ViewNewsPraise  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private String xwId;

    private String xwBt;

    private Date xwFbsj;

    private Integer xwYdrs;

    private Date xwXgsj;

    private Integer xwSfpl;

    private Integer xwSplc;

    private String dzId;

    private String dzUserid;

    private String dzUsername;

    private byte[] xwZw;

    public String getXwId() {
        return xwId;
    }

    public void setXwId(String xwId) {
        this.xwId = xwId == null ? null : xwId.trim();
    }

    public String getXwBt() {
        return xwBt;
    }

    public void setXwBt(String xwBt) {
        this.xwBt = xwBt == null ? null : xwBt.trim();
    }

    public Date getXwFbsj() {
        return xwFbsj;
    }

    public void setXwFbsj(Date xwFbsj) {
        this.xwFbsj = xwFbsj;
    }

    public Integer getXwYdrs() {
        return xwYdrs;
    }

    public void setXwYdrs(Integer xwYdrs) {
        this.xwYdrs = xwYdrs;
    }

    public Date getXwXgsj() {
        return xwXgsj;
    }

    public void setXwXgsj(Date xwXgsj) {
        this.xwXgsj = xwXgsj;
    }

    public Integer getXwSfpl() {
        return xwSfpl;
    }

    public void setXwSfpl(Integer xwSfpl) {
        this.xwSfpl = xwSfpl;
    }

    public Integer getXwSplc() {
        return xwSplc;
    }

    public void setXwSplc(Integer xwSplc) {
        this.xwSplc = xwSplc;
    }

    public String getDzId() {
        return dzId;
    }

    public void setDzId(String dzId) {
        this.dzId = dzId == null ? null : dzId.trim();
    }

    public String getDzUserid() {
        return dzUserid;
    }

    public void setDzUserid(String dzUserid) {
        this.dzUserid = dzUserid == null ? null : dzUserid.trim();
    }

    public String getDzUsername() {
        return dzUsername;
    }

    public void setDzUsername(String dzUsername) {
        this.dzUsername = dzUsername == null ? null : dzUsername.trim();
    }

    public byte[] getXwZw() {
        return xwZw;
    }

    public void setXwZw(byte[] xwZw) {
        this.xwZw = xwZw;
    }
}