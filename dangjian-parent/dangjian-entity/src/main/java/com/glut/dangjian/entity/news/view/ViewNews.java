package com.glut.dangjian.entity.news.view;

import java.io.Serializable;
import java.util.Date;

public class ViewNews  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private String xwId;

    private String xwSlt;
    
    private String xwBt;

    private Date xwFbsj;

    private Integer xwYdrs;

    private Date xwXgsj;

    private Integer xwSfpl;

    private Integer xwSplc;

    private String fbrUserid;

    private String fbrUsername;

    private Integer xwztId;

    private String xwztMc;

    private Integer lmId;

    private String lmMc;

    private Integer bmId;

    private String bmMc;

    private byte[] xwZw;

    private String newsContext;

    public String getNewsContext() {
        return newsContext;
    }

    public void setNewsContext(String newsContext) {
        this.newsContext = newsContext;
    }

    public String getXwSlt() {
        return xwSlt;
    }

    public void setXwSlt(String xwSlt) {
        this.xwSlt = xwSlt;
    }

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

    public String getFbrUserid() {
        return fbrUserid;
    }

    public void setFbrUserid(String fbrUserid) {
        this.fbrUserid = fbrUserid == null ? null : fbrUserid.trim();
    }

    public String getFbrUsername() {
        return fbrUsername;
    }

    public void setFbrUsername(String fbrUsername) {
        this.fbrUsername = fbrUsername == null ? null : fbrUsername.trim();
    }

    public Integer getXwztId() {
        return xwztId;
    }

    public void setXwztId(Integer xwztId) {
        this.xwztId = xwztId;
    }

    public String getXwztMc() {
        return xwztMc;
    }

    public void setXwztMc(String xwztMc) {
        this.xwztMc = xwztMc == null ? null : xwztMc.trim();
    }

    public Integer getLmId() {
        return lmId;
    }

    public void setLmId(Integer lmId) {
        this.lmId = lmId;
    }

    public String getLmMc() {
        return lmMc;
    }

    public void setLmMc(String lmMc) {
        this.lmMc = lmMc == null ? null : lmMc.trim();
    }

    public Integer getBmId() {
        return bmId;
    }

    public void setBmId(Integer bmId) {
        this.bmId = bmId;
    }

    public String getBmMc() {
        return bmMc;
    }

    public void setBmMc(String bmMc) {
        this.bmMc = bmMc == null ? null : bmMc.trim();
    }

    public byte[] getXwZw() {
        return xwZw;
    }

    public void setXwZw(byte[] xwZw) {
        this.xwZw = xwZw;
    }
}