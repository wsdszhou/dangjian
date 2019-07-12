package com.glut.dangjian.entity.log;

import java.io.Serializable;
import java.util.Date;

import com.glut.dangjian.entity.user.Yhb;

public class Log implements Serializable{
    private static final long serialVersionUID = 1L;

    private String id;

    private Yhb yhdm;

    private String loginIp;

    private Integer type;

    private String operation;

    private Date createTime;
    
    private Date endTime;

    private String remark;
    
    public Log() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Log(String id, Yhb yhdm, String loginIp, Integer type, String operation, Date createTime, String remark) {
        super();
        this.id = id;
        this.yhdm = yhdm;
        this.loginIp = loginIp;
        this.type = type;
        this.operation = operation;
        this.createTime = createTime;
        this.remark = remark;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Yhb getYhdm() {
        return yhdm;
    }

    public void setYhdm(Yhb yhdm) {
        this.yhdm = yhdm;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

   

   
}