package com.glut.dangjian.entity.department.view;

import java.io.Serializable;
import java.util.Date;

public class ViewDepartment  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private Integer bmId;

    private String bmMc;

    private String bmJs;

    private Date bmCjsj;

    private Date bmXgsj;

    private String bmLogo;

    private String secretaryid;

    private String secretaryname;

    private String deanid;

    private String deanname;

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

    public String getBmJs() {
        return bmJs;
    }

    public void setBmJs(String bmJs) {
        this.bmJs = bmJs == null ? null : bmJs.trim();
    }

    public Date getBmCjsj() {
        return bmCjsj;
    }

    public void setBmCjsj(Date bmCjsj) {
        this.bmCjsj = bmCjsj;
    }

    public Date getBmXgsj() {
        return bmXgsj;
    }

    public void setBmXgsj(Date bmXgsj) {
        this.bmXgsj = bmXgsj;
    }

    public String getBmLogo() {
        return bmLogo;
    }

    public void setBmLogo(String bmLogo) {
        this.bmLogo = bmLogo == null ? null : bmLogo.trim();
    }

    public String getSecretaryid() {
        return secretaryid;
    }

    public void setSecretaryid(String secretaryid) {
        this.secretaryid = secretaryid == null ? null : secretaryid.trim();
    }

    public String getSecretaryname() {
        return secretaryname;
    }

    public void setSecretaryname(String secretaryname) {
        this.secretaryname = secretaryname == null ? null : secretaryname.trim();
    }

    public String getDeanid() {
        return deanid;
    }

    public void setDeanid(String deanid) {
        this.deanid = deanid == null ? null : deanid.trim();
    }

    public String getDeanname() {
        return deanname;
    }

    public void setDeanname(String deanname) {
        this.deanname = deanname == null ? null : deanname.trim();
    }
}