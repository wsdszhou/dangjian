package com.glut.dangjian.entity.news;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;

import com.glut.dangjian.entity.approval.SpSplcb;
import com.glut.dangjian.entity.department.Bmb;
import com.glut.dangjian.entity.other.Lmb;
import com.glut.dangjian.entity.user.Yhb;

/**
 * 新闻
 * @author XuLanKong
 *
 */
public class Xwb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 新闻id
    private String xwId;

    // 新闻标题
    private String xwBt;

    // 发布人—用户id
    private Yhb xwFbrdm;

    // 发布人名称
    private String xwYhm;
    
    // 发布时间
    private Date xwFbsj;

    // 阅读人
    private Integer xwYdrs;

    //  发布状态
    private XwZtb xwXwztdm;

    // 部门表
    private Bmb xwBmdm;

    // 部门名称
    private String xwBmmc;

    // 新闻修改时间
    private Date xwXgsj;

    // 新闻html代码
    private byte[] xwZw;
    
    private String xwNr;
    
    // 所属栏目
    private Lmb xwLmdm;
    
    // 新闻状态id
    private Integer xwztId;
    
    // 部门id
    private Integer bmId;
    
    // 是否评论
    private Integer xwSfpl;
    
    // 优先级
    private Integer xwYxj;
    
    // 审批类型
    private SpSplcb splc;
    
    private String xwSlt;
    
    // 一对多：一个新闻有多个点赞
    private Set<XwDzb> dzbs = new HashSet<XwDzb>();

    // 一对多：一个新闻有多个评论
    private Set<XwPlb> plbs = new HashSet<XwPlb>();
    
    public Xwb() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public Xwb(String xwId) {
        super();
        this.xwId = xwId;
    }

    public Xwb(String xwId, String xwBt, Yhb xwFbrdm, String xwYhm, Date xwFbsj, Integer xwYdrs, XwZtb xwXwztdm,
            Bmb xwBmdm, String xwBmmc, Date xwXgsj, byte[] xwZw, String xwNr, Lmb xwLmdm, Integer xwztId, Integer bmId,
            Integer xwSfpl, Integer xwYxj, SpSplcb splc, Set<XwDzb> dzbs, Set<XwPlb> plbs) {
        super();
        this.xwId = xwId;
        this.xwBt = xwBt;
        this.xwFbrdm = xwFbrdm;
        this.xwYhm = xwYhm;
        this.xwFbsj = xwFbsj;
        this.xwYdrs = xwYdrs;
        this.xwXwztdm = xwXwztdm;
        this.xwBmdm = xwBmdm;
        this.xwBmmc = xwBmmc;
        this.xwXgsj = xwXgsj;
        this.xwZw = xwZw;
        this.xwNr = xwNr;
        this.xwLmdm = xwLmdm;
        this.xwztId = xwztId;
        this.bmId = bmId;
        this.xwSfpl = xwSfpl;
        this.xwYxj = xwYxj;
        this.splc = splc;
        this.dzbs = dzbs;
        this.plbs = plbs;
    }

    public String getXwSlt() {
        return xwSlt;
    }

    public void setXwSlt(String xwSlt) {
        this.xwSlt = xwSlt;
    }

    public Integer getXwYxj() {
        if (xwYxj == null) {
            return 0;
        } else {
            return xwYxj;
        }
    }

    public void setXwYxj(Integer xwYxj) {
        this.xwYxj = xwYxj;
    }

    public SpSplcb getSplc() {
        return splc;
    }

    public void setSplc(SpSplcb splc) {
        this.splc = splc;
    }

    public Integer getXwztId() {
        return xwztId;
    }

    public void setXwztId(Integer xwztId) {
        if (xwztId != null) {
            this.xwXwztdm = new XwZtb(xwztId);
        } 
    }

    public Integer getBmId() {
        return bmId;
    }

    public void setBmId(Integer bmId) {
        if (bmId != null) {
            this.xwBmdm = new Bmb(bmId);
        } 
    }
    
    public String getXwNr() {
        if (xwZw != null) {
            return new String(xwZw);
        } else {
            return null;
        }
    }

    public String getXwztMc() {
        if (xwXwztdm != null) {
            return xwXwztdm.getXwztMc();
        } else {
            return null;
        }
    }

    public String getXwId() {
        return xwId;
    }

    public void setXwId(String xwId) {
        this.xwId = xwId;
    }

    public String getXwBt() {
        return xwBt;
    }

    public void setXwBt(String xwBt) {
        if (StringUtils.isNotBlank(xwBt)) {
            this.xwBt = xwBt;
        }
    }

    public Yhb getXwFbrdm() {
        return xwFbrdm;
    }

    public void setXwFbrdm(Yhb xwFbrdm) {
        this.xwFbrdm = xwFbrdm;
    }

    public String getXwYhm() {
        return xwYhm;
    }

    public void setXwYhm(String xwYhm) {
        this.xwYhm = xwYhm;
    }

    public Date getXwFbsj() {
        return xwFbsj;
    }

    public void setXwFbsj(Date xwFbsj) {
        this.xwFbsj = xwFbsj;
    }

    public Integer getXwYdrs() {
        return xwYdrs;
    }

    public void setXwYdrs(Integer xwYdrs) {
        this.xwYdrs = xwYdrs;
    }

    public XwZtb getXwXwztdm() {
        return xwXwztdm;
    }

    public void setXwXwztdm(XwZtb xwXwztdm) {
        this.xwXwztdm = xwXwztdm;
    }

    public Bmb getXwBmdm() {
        return xwBmdm;
    }

    public void setXwBmdm(Bmb xwBmdm) {
        this.xwBmdm = xwBmdm;
    }

    public String getXwBmmc() {
        return xwBmmc;
    }

    public void setXwBmmc(String xwBmmc) {
        this.xwBmmc = xwBmmc;
    }

    public Date getXwXgsj() {
        return xwXgsj;
    }

    public void setXwXgsj(Date xwXgsj) {
        this.xwXgsj = xwXgsj;
    }

    public byte[] getXwZw() {
        return xwZw;
    }

    public void setXwZw(byte[] xwZw) {
        this.xwZw = xwZw;
    }

    public Lmb getXwLmdm() {
        return xwLmdm;
    }

    public void setXwLmdm(Lmb xwLmdm) {
        this.xwLmdm = xwLmdm;
    }

    public Set<XwDzb> getDzbs() {
        return dzbs;
    }

    public void setDzbs(Set<XwDzb> dzbs) {
        this.dzbs = dzbs;
    }

    public Set<XwPlb> getPlbs() {
        return plbs;
    }

    public void setPlbs(Set<XwPlb> plbs) {
        this.plbs = plbs;
    }

    public Integer getXwSfpl() {
        return xwSfpl;
    }

    public void setXwSfpl(Integer xwSfpl) {
        this.xwSfpl = xwSfpl;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    public void setXwNr(String xwNr) {
        this.xwNr = xwNr;
    }

    @Override
    public String toString() {
        return "Xwb [xwId=" + xwId + ", xwBt=" + xwBt + ", xwFbrdm=" + xwFbrdm + ", xwYhm=" + xwYhm + ", xwFbsj="
                + xwFbsj + ", xwYdrs=" + xwYdrs + ", xwXwztdm=" + xwXwztdm + ", xwBmdm=" + xwBmdm + ", xwBmmc=" + xwBmmc
                + ", xwXgsj=" + xwXgsj + ", xwZw=" + Arrays.toString(xwZw) + ", xwNr=" + xwNr + ", xwLmdm=" + xwLmdm
                + ", xwztId=" + xwztId + ", bmId=" + bmId + ", xwSfpl=" + xwSfpl + ", xwYxj=" + xwYxj
                + ", splc=" + splc + ", dzbs=" + dzbs + ", plbs=" + plbs + "]";
    }

    
}