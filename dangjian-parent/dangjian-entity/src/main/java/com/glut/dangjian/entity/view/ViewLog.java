package com.glut.dangjian.entity.view;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.Null;

import org.springframework.format.annotation.DateTimeFormat;

public class ViewLog  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private String id;

    private String loginIp;

    private Integer type;

    private String operation;

    @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
    @Null
    private Date createTime;

    private String remark;

    @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
    @Null
    private Date endTime;

    private String yhxxId;

    private String yhxxXm;

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp == null ? null : loginIp.trim();
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
        this.operation = operation == null ? null : operation.trim();
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
        this.remark = remark == null ? null : remark.trim();
    }

    public String getYhxxId() {
        return yhxxId;
    }

    public void setYhxxId(String yhxxId) {
        this.yhxxId = yhxxId == null ? null : yhxxId.trim();
    }

    public String getYhxxXm() {
        return yhxxXm;
    }

    public void setYhxxXm(String yhxxXm) {
        this.yhxxXm = yhxxXm == null ? null : yhxxXm.trim();
    }
}