package com.glut.dangjian.entity.user;

import static org.hamcrest.CoreMatchers.endsWith;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * 用户状态对象
 * @author XuLanKong
 *
 */
public class YhZtb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 状态id
    private Integer ztId;

    // 状态名称
    private String ztMc;

    // 一对多：一种状态有多歌用户
    private Set<Yhb> yhbs = new HashSet<Yhb>();
    public Integer getZtId() {
        return ztId;
    }

    public void setZtId(Integer ztId) {
        this.ztId = ztId;
    }

    public String getZtMc() {
        return ztMc;
    }

    public void setZtMc(String ztMc) {
        this.ztMc = ztMc == null ? null : ztMc.trim();
    }

    public Set<Yhb> getYhbs() {
        return yhbs;
    }

    public void setYhbs(Set<Yhb> yhbs) {
        this.yhbs = yhbs;
    }

    @Override
    public String toString() {
        return "YhZtb [ztId=" + ztId + ", ztMc=" + ztMc + ", yhbs=" + yhbs + "]";
    }
    
    
    
}