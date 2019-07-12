package com.glut.dangjian.entity.news.view;

import java.io.Serializable;
import java.util.Date;

public class ViewNewsComment  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private String xwId;

    private String xwBt;

    private Date xwFbsj;

    private Integer xwYdrs;

    private Date xwXgsj;

    private Integer xwSfpl;

    private Integer xwSplc;

    private String id;

    private String zw;

    private Date sj;

    private Integer flag;

    private String plUserid;

    private String plUsername;

    private byte[] xwZw;
    
    private Integer praiseNum;
    
    public Integer getPraiseNum() {
        return praiseNum;
    }

    public void setPraiseNum(Integer praiseNum) {
        this.praiseNum = praiseNum;
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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
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

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public String getPlUserid() {
        return plUserid;
    }

    public void setPlUserid(String plUserid) {
        this.plUserid = plUserid == null ? null : plUserid.trim();
    }

    public String getPlUsername() {
        return plUsername;
    }

    public void setPlUsername(String plUsername) {
        this.plUsername = plUsername == null ? null : plUsername.trim();
    }

    public byte[] getXwZw() {
        return xwZw;
    }

    public void setXwZw(byte[] xwZw) {
        this.xwZw = xwZw;
    }
}