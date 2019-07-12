package com.glut.dangjian.entity.notice.view;

import java.io.Serializable;
import java.util.Date;

public class ViewMyselfNotice  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private String tzId;

    private String tzBt;

    private String tzNr;

    private Date tzFbsj;

    private String tzFbrdm;

    private String tzFbrmc;

    private Date tzJssj;

    private Integer tzYxj;

    private String tzdxId;

    private String tzdxBtzyhdm;

    private String tzdxBtzyhxm;

    private Integer tzdxSfyd;

    private Date tzdxYdsj;

    private Integer bmId;

    private String bmMc;

    private Integer tzfwId;

    private String tzfwMc;

    private String yhxxXm;
    
    
    

    public String getTzId() {
        return tzId;
    }

    public void setTzId(String tzId) {
        this.tzId = tzId == null ? null : tzId.trim();
    }

    public String getTzBt() {
        return tzBt;
    }

    public void setTzBt(String tzBt) {
        this.tzBt = tzBt == null ? null : tzBt.trim();
    }

    public String getTzNr() {
        return tzNr;
    }

    public void setTzNr(String tzNr) {
        this.tzNr = tzNr == null ? null : tzNr.trim();
    }

    public Date getTzFbsj() {
        return tzFbsj;
    }

    public void setTzFbsj(Date tzFbsj) {
        this.tzFbsj = tzFbsj;
    }

    public String getTzFbrdm() {
        return tzFbrdm;
    }

    public void setTzFbrdm(String tzFbrdm) {
        this.tzFbrdm = tzFbrdm == null ? null : tzFbrdm.trim();
    }

    public String getTzFbrmc() {
        return tzFbrmc;
    }

    public void setTzFbrmc(String tzFbrmc) {
        this.tzFbrmc = tzFbrmc == null ? null : tzFbrmc.trim();
    }

    public Date getTzJssj() {
        return tzJssj;
    }

    public void setTzJssj(Date tzJssj) {
        this.tzJssj = tzJssj;
    }

    public Integer getTzYxj() {
        return tzYxj;
    }

    public void setTzYxj(Integer tzYxj) {
        this.tzYxj = tzYxj;
    }

    public String getTzdxId() {
        return tzdxId;
    }

    public void setTzdxId(String tzdxId) {
        this.tzdxId = tzdxId == null ? null : tzdxId.trim();
    }

    public String getTzdxBtzyhdm() {
        return tzdxBtzyhdm;
    }

    public void setTzdxBtzyhdm(String tzdxBtzyhdm) {
        this.tzdxBtzyhdm = tzdxBtzyhdm == null ? null : tzdxBtzyhdm.trim();
    }

    public String getTzdxBtzyhxm() {
        return tzdxBtzyhxm;
    }

    public void setTzdxBtzyhxm(String tzdxBtzyhxm) {
        this.tzdxBtzyhxm = tzdxBtzyhxm == null ? null : tzdxBtzyhxm.trim();
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

    public Integer getTzfwId() {
        return tzfwId;
    }

    public void setTzfwId(Integer tzfwId) {
        this.tzfwId = tzfwId;
    }

    public String getTzfwMc() {
        return tzfwMc;
    }

    public void setTzfwMc(String tzfwMc) {
        this.tzfwMc = tzfwMc == null ? null : tzfwMc.trim();
    }

    public String getYhxxXm() {
        return yhxxXm;
    }

    public void setYhxxXm(String yhxxXm) {
        this.yhxxXm = yhxxXm == null ? null : yhxxXm.trim();
    }

    @Override
    public String toString() {
        return "ViewMyselfNotice [tzId=" + tzId + ", tzBt=" + tzBt + ", tzNr=" + tzNr + ", tzFbsj=" + tzFbsj
                + ", tzFbrdm=" + tzFbrdm + ", tzFbrmc=" + tzFbrmc + ", tzJssj=" + tzJssj + ", tzYxj=" + tzYxj
                + ", tzdxId=" + tzdxId + ", tzdxBtzyhdm=" + tzdxBtzyhdm + ", tzdxBtzyhxm=" + tzdxBtzyhxm + ", tzdxSfyd="
                + tzdxSfyd + ", tzdxYdsj=" + tzdxYdsj + ", bmId=" + bmId + ", bmMc=" + bmMc + ", tzfwId=" + tzfwId
                + ", tzfwMc=" + tzfwMc + ", yhxxXm=" + yhxxXm + "]";
    }
    
    
}