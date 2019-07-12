package com.glut.dangjian.entity.other;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.alibaba.fastjson.annotation.JSONField;
import com.glut.dangjian.entity.news.Xwb;

/**
 * 栏目表
 * @author XuLanKong
 *
 */
public class Lmb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 栏目id
    private Integer lmId;

    // 栏目名称
    private String lmMc;

    // 栏目父id
    private Integer lmFid;

    // 栏目描述
    private String lmMs;
    
    private Mkb lmMkdm;

    //栏目修改日期
    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    private Date lmXgsj;

    //后代栏目
    private List<Lmb> childrenList;
    

    public Lmb() {
        
    }
    
    public Lmb(Integer lmId) {
        this.lmId = lmId;
    }
   
    public Lmb(Integer lmId, String lmMc) {
        super();
        this.lmId = lmId;
        this.lmMc = lmMc;
    }

    public Lmb(Integer lmId, String lmMc, Integer lmFid, String lmMs, Mkb mkb, Date lmXgsj, List<Lmb> childrenList,
            Set<Xwb> xwbs) {
        super();
        this.lmId = lmId;
        this.lmMc = lmMc;
        this.lmFid = lmFid;
        this.lmMs = lmMs;
        this.lmMkdm = lmMkdm;
        this.lmXgsj = lmXgsj;
        this.childrenList = childrenList;
        this.xwbs = xwbs;
    }

    public Mkb getLmMkdm() {
        return lmMkdm;
    }

    public void setMkb(Mkb mkb) {
        mkb = mkb;
    }

    public List<Lmb> getChildrenList() {
        return childrenList;
    }

    public void setChildrenList(List<Lmb> childrenList) {
        this.childrenList = childrenList;
    }

    private Set<Xwb> xwbs = new HashSet<Xwb>();

    public Integer getLmId() {
        return lmId;
    }

    public void setLmId(Integer lmId) {
        this.lmId = lmId;
    }

    public String getLmMc() {
        return lmMc;
    }

    public void setLmMc(String lmMc) {
        this.lmMc = lmMc == null ? null : lmMc.trim();
    }

    public Integer getLmFid() {
        return lmFid;
    }

    public void setLmFid(Integer lmFid) {
        this.lmFid = lmFid;
    }

    public String getLmMs() {
        return lmMs;
    }

    public void setLmMs(String lmMs) {
        this.lmMs = lmMs == null ? null : lmMs.trim();
    }

    public Date getLmXgsj() {
        return lmXgsj;
    }

    public void setLmXgsj(Date lmXgsj) {
        this.lmXgsj = lmXgsj;
    }

    public Set<Xwb> getXwbs() {
        return xwbs;
    }

    public void setXwbs(Set<Xwb> xwbs) {
        this.xwbs = xwbs;
    }

    public void setLmMkdm(Mkb lmMkdm) {
        this.lmMkdm = lmMkdm;
    }

    @Override
    public String toString() {
        return "Lmb [lmId=" + lmId + ", lmMc=" + lmMc + ", lmFid=" + lmFid + ", lmMs=" + lmMs + ", lmMkdm=" + lmMkdm
                + ", lmXgsj=" + lmXgsj + ", childrenList=" + childrenList + ", xwbs=" + xwbs + "]";
    }

    
    
}