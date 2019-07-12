package com.glut.dangjian.entity.notice;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewYhxx;
/**
 * 通知表
 * @author XuLanKong
 *
 */
public class Notice implements Serializable {
    
    private static final long serialVersionUID = 1L;

    // 通知id
    private String tzId;

    // 通知标题
    private String tzBt;

    //  通知内容
    private String tzNr;

    // 通知发布时间
    @DateTimeFormat(pattern="yyyy/MM/dd hh:mm:ss")
    private Date tzFbsj;

    // 通知结束时间
    @DateTimeFormat(pattern="yyyy/MM/dd hh:mm:ss")
    private Date tzJssj;
    
    // 通知发布人
    private ViewYhxx tzFbrdm;

    // 发布人名称
    private String tzFbrmc;

    // 通知范围
    private NoticeRange tzFwdm;

    // 通知优先级
    private Integer tzYxj;
    
    // 通知范围id
    private Integer tzfwId;

    // 通知范围名称
    private String tzfwMc;
    
    private String tzSpId;
    
    public String getYhxxXm() {
        if(tzFbrdm != null) {
            if(tzFbrdm.getYhxxXm() != null) {
                return tzFbrdm.getYhxxXm();
            }
        }
        return null;
    }
    
    public ViewYhxx getTzFbrdm() {
        return tzFbrdm;
    }

    public void setTzFbrdm(ViewYhxx tzFbrdm) {
        this.tzFbrdm = tzFbrdm;
    }

    public String getTzSpId() {
        return tzSpId;
    }

    public void setTzSpId(String tzSpId) {
        this.tzSpId = tzSpId;
    }

    public Notice() {
        super();
    }
    
    public Notice(String tzId, String tzBt, String tzNr, Date tzFbsj , ViewYhxx tzFbrdm, String tzFbrmc,
            NoticeRange tzFwdm, Integer tzYxj, String tzfwMc, String tzSpId) {
        super();
        this.tzId = tzId;
        this.tzBt = tzBt;
        this.tzNr = tzNr;
        this.tzFbsj = tzFbsj;
        this.tzFbrdm = tzFbrdm;
        this.tzFbrmc = tzFbrmc;
        this.tzFwdm = tzFwdm;
        this.tzYxj = tzYxj;
        this.tzfwMc = tzfwMc;
        this.tzSpId = tzSpId;
    }


    public Integer getTzfwId() {
        if (tzFwdm !=null) {
            return tzFwdm.getTzfwId();
        }
        return null;
    }

    public void setTzfwId(Integer tzfwId) {
        if (tzFwdm !=null) {
            tzFwdm.setTzfwId(tzfwId);
        }else {
            tzFwdm = new NoticeRange(tzfwId);
        }
    }

    public String getTzfwMc() {
        if (tzFwdm !=null) {
            return tzFwdm.getTzfwMc();
        }else {
            return null;
        }
    }

    public void setTzfwMc(String tzfwMc) {
        if (tzfwMc !=null) {
            tzFwdm.setTzfwMc(tzfwMc);
        }else {
            tzFwdm = new NoticeRange(tzfwMc);
        }
    }

    public String getTzId() {
        return tzId;
    }

    public void setTzId(String tzId) {
        this.tzId = tzId;
    }

    public String getTzBt() {
        return tzBt;
    }

    public void setTzBt(String tzBt) {
        this.tzBt = tzBt;
    }

    public String getTzNr() {
        return tzNr;
    }

    public void setTzNr(String tzNr) {
        this.tzNr = tzNr;
    }

    public Date getTzFbsj() {
        return tzFbsj;
    }

    public void setTzFbsj(Date tzFbsj) {
        this.tzFbsj = tzFbsj;
    }


    public String getTzFbrmc() {
        return tzFbrmc;
    }

    public void setTzFbrmc(String tzFbrmc) {
        this.tzFbrmc = tzFbrmc;
    }

    public Date getTzJssj() {
        return tzJssj;
    }

    public void setTzJssj(Date tzJssj) {
        this.tzJssj = tzJssj;
    }

    public NoticeRange getTzFwdm() {
        return tzFwdm;
    }

    public void setTzFwdm(NoticeRange tzFwdm) {
        this.tzFwdm = tzFwdm;
    }

    public Integer getTzYxj() {
        return tzYxj;
    }

    public void setTzYxj(Integer tzYxj) {
        this.tzYxj = tzYxj;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    @Override
    public String toString() {
        return "Notice [tzId=" + tzId + ", tzBt=" + tzBt + ", tzNr=" + tzNr + ", tzFbsj=" + tzFbsj + ", tzFbrdm="
                + tzFbrdm + ", tzFbrmc=" + tzFbrmc + ", tzJssj=" + tzJssj + ", tzFwdm=" + tzFwdm + ", tzYxj=" + tzYxj
                + "]";
    }

    
}