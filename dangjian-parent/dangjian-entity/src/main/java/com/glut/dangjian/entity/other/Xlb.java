package com.glut.dangjian.entity.other;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.glut.dangjian.entity.user.Yhb;

/**
 * 学历表
 * @author XuLanKong
 *
 */
public class Xlb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 学历id
    private Integer xlId;

    // 学历名称
    private String xlMc;

    // 一对多：一个学历有多用户
    private Set<Yhb> yhbs = new HashSet<Yhb>();
    
    
    
    public Xlb(Integer xlId) {
        super();
        this.xlId = xlId;
    }

    public Xlb() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Integer getXlId() {
        return xlId;
    }

    public void setXlId(Integer xlId) {
        this.xlId = xlId;
    }

    public String getXlMc() {
        return xlMc;
    }

    public void setXlMc(String xlMc) {
        this.xlMc = xlMc == null ? null : xlMc.trim();
    }

    public Set<Yhb> getYhbs() {
        return yhbs;
    }

    public void setYhbs(Set<Yhb> yhbs) {
        this.yhbs = yhbs;
    }

    @Override
    public String toString() {
        return "Xlb [xlId=" + xlId + ", xlMc=" + xlMc + ", yhbs=" + yhbs + "]";
    }
    
    
    
    
}