package com.glut.dangjian.entity.other;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * 功能表对象
 * @author XuLanKong
 *
 */
public class Gnb  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 功能表对象id
    private Integer gnId;

    // 功能名称
    private String gnMc;

    // 功能路径
    private String gnLj;
    
    // 一对多： 一个功能有多个模块
    private Set<Mkb> mkbs  = new HashSet<Mkb>();

    public Integer getGnId() {
        return gnId;
    }

    public void setGnId(Integer gnId) {
        this.gnId = gnId;
    }

    public String getGnMc() {
        return gnMc;
    }

    public void setGnMc(String gnMc) {
        this.gnMc = gnMc;
    }

    public String getGnLj() {
        return gnLj;
    }

    public void setGnLj(String gnLj) {
        this.gnLj = gnLj;
    }

    public Set<Mkb> getMkbs() {
        return mkbs;
    }

    public void setMkbs(Set<Mkb> mkbs) {
        this.mkbs = mkbs;
    }

    @Override
    public String toString() {
        return "Gnb [gnId=" + gnId + ", gnMc=" + gnMc + ", gnLj=" + gnLj + ", mkbs=" + mkbs + "]";
    }

    
}