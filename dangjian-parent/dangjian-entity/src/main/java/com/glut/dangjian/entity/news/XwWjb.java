package com.glut.dangjian.entity.news;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.glut.dangjian.entity.other.Gnb;
import com.glut.dangjian.entity.other.Mkb;
import com.glut.dangjian.entity.other.Sp;

/**
 * 新闻文件
 * @author XuLanKong
 *
 */
public class XwWjb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 新闻文件id
    private String xwfjId;

    // tp表
    private Gnb xwfjGndm;

    // 模块表
    private Mkb xwfjMkdm;
    
    // 一对多：一个新闻文件表有多个图片
    private Set<XwTpb> tpbs = new HashSet<XwTpb>();
    
    // 一对多：一个新闻文件表有多视频
    private Set<Sp> sps = new HashSet<Sp>();
    
    // 一对多：一个新闻文件表有多个其他文件
    private Set<XwQtwjb> qtwjbs = new HashSet<XwQtwjb>();

    public String getXwfjId() {
        return xwfjId;
    }

    public void setXwfjId(String xwfjId) {
        this.xwfjId = xwfjId;
    }

    public Gnb getXwfjGndm() {
        return xwfjGndm;
    }

    public void setXwfjGndm(Gnb xwfjGndm) {
        this.xwfjGndm = xwfjGndm;
    }

    public Mkb getXwfjMkdm() {
        return xwfjMkdm;
    }

    public void setXwfjMkdm(Mkb xwfjMkdm) {
        this.xwfjMkdm = xwfjMkdm;
    }

    public Set<XwTpb> getTpbs() {
        return tpbs;
    }

    public void setTpbs(Set<XwTpb> tpbs) {
        this.tpbs = tpbs;
    }

    public Set<Sp> getSps() {
        return sps;
    }

    public void setSps(Set<Sp> sps) {
        this.sps = sps;
    }

    public Set<XwQtwjb> getQtwjbs() {
        return qtwjbs;
    }

    public void setQtwjbs(Set<XwQtwjb> qtwjbs) {
        this.qtwjbs = qtwjbs;
    }

    @Override
    public String toString() {
        return "XwWjb [xwfjId=" + xwfjId + ", xwfjGndm=" + xwfjGndm + ", xwfjMkdm=" + xwfjMkdm + ", tpbs=" + tpbs
                + ", sps=" + sps + ", qtwjbs=" + qtwjbs + "]";
    }

    
    
    

    
}