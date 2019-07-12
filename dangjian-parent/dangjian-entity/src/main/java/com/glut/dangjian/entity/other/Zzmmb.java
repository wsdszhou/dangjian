package com.glut.dangjian.entity.other;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.glut.dangjian.entity.user.Yhb;

/**
 * 政治面貌
 * @author XuLanKong
 *
 */
public class Zzmmb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 政治面貌id 
    private Integer zzmmId;

    // 政治面貌名称
    private String zzmmMc;
    
    // 一对多：一种政治面貌有个多个用户
    private Set<Yhb> yhbs = new HashSet<Yhb>();
    

    public Zzmmb() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Zzmmb(Integer zzmmId) {
        super();
        this.zzmmId = zzmmId;
    }

    public Integer getZzmmId() {
        return zzmmId;
    }

    public void setZzmmId(Integer zzmmId) {
        this.zzmmId = zzmmId;
    }

    public String getZzmmMc() {
        return zzmmMc;
    }

    public void setZzmmMc(String zzmmMc) {
        this.zzmmMc = zzmmMc == null ? null : zzmmMc.trim();
    }

    public Set<Yhb> getYhbs() {
        return yhbs;
    }

    public void setYhbs(Set<Yhb> yhbs) {
        this.yhbs = yhbs;
    }

    @Override
    public String toString() {
        return "Zzmmb [zzmmId=" + zzmmId + ", zzmmMc=" + zzmmMc + ", yhbs=" + yhbs + "]";
    }
    
    
    
    
}