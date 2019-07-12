package com.glut.dangjian.entity.news.view;

import java.io.Serializable;
import java.util.Date;

public class ViewCommentReply  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private String plId;

    private String plZw;

    private Date plSj;

    private Integer plFlag;

    private String plXwdm;

    private String plYhdm;

    private String hfId;

    private String hfReplyId;

    private Integer hfReplyType;

    private String hfNr;

    private String hfMbYhId;

    private Date hfSj;

    private Integer hfFlag;

    private String hfUserid;

    private String hfUsername;
    
    private Integer accountParise;
    
    public Integer getAccountParise() {
        return accountParise;
    }

    public void setAccountParise(Integer accountParise) {
        this.accountParise = accountParise;
    }

    public String getPlId() {
        return plId;
    }

    public void setPlId(String plId) {
        this.plId = plId == null ? null : plId.trim();
    }

    public String getPlZw() {
        return plZw;
    }

    public void setPlZw(String plZw) {
        this.plZw = plZw == null ? null : plZw.trim();
    }

    public Date getPlSj() {
        return plSj;
    }

    public void setPlSj(Date plSj) {
        this.plSj = plSj;
    }

    public Integer getPlFlag() {
        return plFlag;
    }

    public void setPlFlag(Integer plFlag) {
        this.plFlag = plFlag;
    }

    public String getPlXwdm() {
        return plXwdm;
    }

    public void setPlXwdm(String plXwdm) {
        this.plXwdm = plXwdm == null ? null : plXwdm.trim();
    }

    public String getPlYhdm() {
        return plYhdm;
    }

    public void setPlYhdm(String plYhdm) {
        this.plYhdm = plYhdm == null ? null : plYhdm.trim();
    }

    public String getHfId() {
        return hfId;
    }

    public void setHfId(String hfId) {
        this.hfId = hfId == null ? null : hfId.trim();
    }

    public String getHfReplyId() {
        return hfReplyId;
    }

    public void setHfReplyId(String hfReplyId) {
        this.hfReplyId = hfReplyId == null ? null : hfReplyId.trim();
    }

    public Integer getHfReplyType() {
        return hfReplyType;
    }

    public void setHfReplyType(Integer hfReplyType) {
        this.hfReplyType = hfReplyType;
    }

    public String getHfNr() {
        return hfNr;
    }

    public void setHfNr(String hfNr) {
        this.hfNr = hfNr == null ? null : hfNr.trim();
    }

    public String getHfMbYhId() {
        return hfMbYhId;
    }

    public void setHfMbYhId(String hfMbYhId) {
        this.hfMbYhId = hfMbYhId == null ? null : hfMbYhId.trim();
    }

    public Date getHfSj() {
        return hfSj;
    }

    public void setHfSj(Date hfSj) {
        this.hfSj = hfSj;
    }

    public Integer getHfFlag() {
        return hfFlag;
    }

    public void setHfFlag(Integer hfFlag) {
        this.hfFlag = hfFlag;
    }

    public String getHfUserid() {
        return hfUserid;
    }

    public void setHfUserid(String hfUserid) {
        this.hfUserid = hfUserid == null ? null : hfUserid.trim();
    }

    public String getHfUsername() {
        return hfUsername;
    }

    public void setHfUsername(String hfUsername) {
        this.hfUsername = hfUsername == null ? null : hfUsername.trim();
    }
}