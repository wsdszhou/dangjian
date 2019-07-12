package com.glut.dangjian.entity.other;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * 籍贯表对象
 * @author XuLanKong
 *
 */
public class Jgb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 籍贯id
    private Integer jgId;
    
    // 所在省id
    private Integer jsSzsId ;
    
    // 所在区县名称
    private String jsSzqxMc ;

    // 所在省名称
    private String jgSzsMc;

    //一对多：一个籍贯有多个区县
    private Set<Jgb> jgbs = new HashSet<Jgb>();
    
    public Jgb(Integer jgId) {
        super();
        this.jgId = jgId;
    }

    public Jgb() {
        super();
        // TODO Auto-generated constructor stub
    }

    public String getName() {
        return jgSzsMc + jsSzqxMc;
    }

    public Integer getJgId() {
        return jgId;
    }

    public void setJgId(Integer jgId) {
        this.jgId = jgId;
    }

    public Integer getJsSzsId() {
        return jsSzsId;
    }

    public void setJsSzsId(Integer jsSzsId) {
        this.jsSzsId = jsSzsId;
    }

    public String getJsSzqxMc() {
        return jsSzqxMc;
    }

    public void setJsSzqxMc(String jsSzqxMc) {
        this.jsSzqxMc = jsSzqxMc;
    }

    public String getJgSzsMc() {
        return jgSzsMc;
    }

    public void setJgSzsMc(String jgSzsMc) {
        this.jgSzsMc = jgSzsMc;
    }

    public Set<Jgb> getJgbs() {
        return jgbs;
    }

    public void setJgbs(Set<Jgb> jgbs) {
        this.jgbs = jgbs;
    }

    @Override
    public String toString() {
        return "Jgb [jgId=" + jgId + ", jsSzsId=" + jsSzsId + ", jsSzqxMc=" + jsSzqxMc + ", jgSzsMc=" + jgSzsMc
                + ", jgbs=" + jgbs + "]";
    }
    
    
    
    
}