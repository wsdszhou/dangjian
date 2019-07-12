package com.glut.dangjian.entity.other;

import java.io.Serializable;
import java.util.Date;

import com.glut.dangjian.entity.news.XwWjb;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewYhxx;

/**
 * 视频
 * @author XuLanKong
 *
 */
public class Sp implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private String spId;

    private String spMc;

    private String spMs;

    private Date spScsj;

    private String spLj;

    private XwWjb spXwwjdm;
    
    private String spSlt;

    private ViewYhxx spScyhdm;
    
    public String getSpSlt() {
        return spSlt;
    }

    public void setSpSlt(String spSlt) {
        this.spSlt = spSlt;
    }

    public String getSpId() {
        return spId;
    }

    public void setSpId(String spId) {
        this.spId = spId;
    }

    public String getSpMc() {
        return spMc;
    }

    public void setSpMc(String spMc) {
        this.spMc = spMc;
    }

    public String getSpMs() {
        return spMs;
    }

    public void setSpMs(String spMs) {
        this.spMs = spMs;
    }

    public Date getSpScsj() {
        return spScsj;
    }

    public void setSpScsj(Date spScsj) {
        this.spScsj = spScsj;
    }

    public String getSpLj() {
        return spLj;
    }

    public void setSpLj(String spLj) {
        this.spLj = spLj;
    }

    public XwWjb getSpXwwjdm() {
        return spXwwjdm;
    }

    public void setSpXwwjdm(XwWjb spXwwjdm) {
        this.spXwwjdm = spXwwjdm;
    }

    public ViewYhxx getSpScyhdm() {
        return spScyhdm;
    }

    public void setSpScyhdm(ViewYhxx spScyhdm) {
        this.spScyhdm = spScyhdm;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    @Override
    public String toString() {
        return "Sp [spId=" + spId + ", spMc=" + spMc + ", spMs=" + spMs + ", spScsj=" + spScsj + ", spLj=" + spLj
                + ", spXwwjdm=" + spXwwjdm + ", spScyhdm=" + spScyhdm + "]";
    }

    
}