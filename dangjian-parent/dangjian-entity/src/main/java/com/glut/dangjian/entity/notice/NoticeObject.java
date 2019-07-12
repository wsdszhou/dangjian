package com.glut.dangjian.entity.notice;

import java.io.Serializable;
import java.util.Date;

import com.glut.dangjian.entity.branch.Zbb;
import com.glut.dangjian.entity.department.Bmb;
import com.glut.dangjian.entity.user.Yhb;
/**
 * 通知对象表
 * @author XuLanKong
 *
 */
public class NoticeObject implements Serializable{
    
    private static final long serialVersionUID = 1L;

    // 通知对象id
    private String tzdxId;

    // 通知对象
    private Notice tzdxTzdm;

    // 被通知用户
    private Yhb tzdxBtzyhdm;

    // 是否阅读
    private Integer tzdxSfyd;

    // 阅读时间
    private Date tzdxYdsj;
    
    // 通知部门
    private Bmb tzdxBmdm;
    
    // 通知支部
    private Zbb tzdxZbdm;
    

    public NoticeObject() {
        super();
    }

    public NoticeObject(String tzdxId, Notice tzdxTzdm, Yhb tzdxBtzyhdm, Integer tzdxSfyd, Date tzdxYdsj, Bmb tzdxBmdm,
            Zbb tzdxZbdm) {
        super();
        this.tzdxId = tzdxId;
        this.tzdxTzdm = tzdxTzdm;
        this.tzdxBtzyhdm = tzdxBtzyhdm;
        this.tzdxSfyd = tzdxSfyd;
        this.tzdxYdsj = tzdxYdsj;
        this.tzdxBmdm = tzdxBmdm;
        this.tzdxZbdm = tzdxZbdm;
    }

    public String getTzdxId() {
        return tzdxId;
    }

    public void setTzdxId(String tzdxId) {
        this.tzdxId = tzdxId;
    }

    public Notice getTzdxTzdm() {
        return tzdxTzdm;
    }

    public void setTzdxTzdm(Notice tzdxTzdm) {
        this.tzdxTzdm = tzdxTzdm;
    }

    public Yhb getTzdxBtzyhdm() {
        return tzdxBtzyhdm;
    }

    public void setTzdxBtzyhdm(Yhb tzdxBtzyhdm) {
        this.tzdxBtzyhdm = tzdxBtzyhdm;
    }

    public Integer getTzdxSfyd() {
        return tzdxSfyd;
    }

    public void setTzdxSfyd(Integer tzdxSfyd) {
        this.tzdxSfyd = tzdxSfyd;
    }

    public Date getTzdxYdsj() {
        return tzdxYdsj;
    }

    public void setTzdxYdsj(Date tzdxYdsj) {
        this.tzdxYdsj = tzdxYdsj;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    public Bmb getTzdxBmdm() {
        return tzdxBmdm;
    }

    public void setTzdxBmdm(Bmb tzdxBmdm) {
        this.tzdxBmdm = tzdxBmdm;
    }

    public Zbb getTzdxZbdm() {
        return tzdxZbdm;
    }

    public void setTzdxZbdm(Zbb tzdxZbdm) {
        this.tzdxZbdm = tzdxZbdm;
    }

    @Override
    public String toString() {
        return "NoticeObject [tzdxId=" + tzdxId + ", tzdxTzdm=" + tzdxTzdm + ", tzdxBtzyhdm=" + tzdxBtzyhdm
                + ", tzdxSfyd=" + tzdxSfyd + ", tzdxYdsj=" + tzdxYdsj + ", tzdxBmdm=" + tzdxBmdm + ", tzdxZbdm="
                + tzdxZbdm + "]";
    }

   
   
}