package com.glut.dangjian.entity.news.view;

import java.io.Serializable;
import java.util.Date;

public class ViewCommentPraise  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private String plId;

    private String plZw;

    private Date plSj;

    private Integer plFlag;

    private String plXwdm;

    private String plYhdm;

    private String pldzId;

    private String pldzUserid;

    private String pldzUsername;

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

    public String getPldzId() {
        return pldzId;
    }

    public void setPldzId(String pldzId) {
        this.pldzId = pldzId == null ? null : pldzId.trim();
    }

    public String getPldzUserid() {
        return pldzUserid;
    }

    public void setPldzUserid(String pldzUserid) {
        this.pldzUserid = pldzUserid == null ? null : pldzUserid.trim();
    }

    public String getPldzUsername() {
        return pldzUsername;
    }

    public void setPldzUsername(String pldzUsername) {
        this.pldzUsername = pldzUsername == null ? null : pldzUsername.trim();
    }
}