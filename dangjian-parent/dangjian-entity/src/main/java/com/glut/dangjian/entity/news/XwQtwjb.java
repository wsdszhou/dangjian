package com.glut.dangjian.entity.news;

import java.io.Serializable;

import com.glut.dangjian.entity.other.Lmb;

/**
 * 其他文件
 * @author XuLanKong
 *
 */
public class XwQtwjb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 其他文件id
    private String jqwjId;

    // 其他文件实际名称
    private String jqwjSjmc;

    // 其他文件显示名称
    private String jqwjXsmc;

    // 其他文件相对路径
    private String jqwjXdlj;

    // 其他文件绝对路径
    private String jqwjJdlj;
    
    // 所属的新闻文件表
    private Xwb jqwjXwdm;
    
   // 所属栏目
    private Lmb jqwjLmdm;
    
    public XwQtwjb() {
        
    }

    public XwQtwjb(String jqwjSjmc, String jqwjXsmc, String jqwjXdlj, String jqwjJdlj) {
        this.jqwjSjmc = jqwjSjmc;
        this.jqwjXsmc = jqwjXsmc;
        this.jqwjXdlj = jqwjXdlj;
        this.jqwjJdlj = jqwjJdlj;
    }
    
    

    public Lmb getJqwjLmdm() {
        return jqwjLmdm;
    }

    public void setJqwjLmdm(Lmb jqwjLmdm) {
        this.jqwjLmdm = jqwjLmdm;
    }

    public String getJqwjId() {
        return jqwjId;
    }

    public void setJqwjId(String jqwjId) {
        this.jqwjId = jqwjId == null ? null : jqwjId.trim();
    }

    public String getJqwjSjmc() {
        return jqwjSjmc;
    }

    public void setJqwjSjmc(String jqwjSjmc) {
        this.jqwjSjmc = jqwjSjmc == null ? null : jqwjSjmc.trim();
    }

    public String getJqwjXsmc() {
        return jqwjXsmc;
    }

    public void setJqwjXsmc(String jqwjXsmc) {
        this.jqwjXsmc = jqwjXsmc == null ? null : jqwjXsmc.trim();
    }

    public String getJqwjXdlj() {
        return jqwjXdlj;
    }

    public void setJqwjXdlj(String jqwjXdlj) {
        this.jqwjXdlj = jqwjXdlj == null ? null : jqwjXdlj.trim();
    }

    public String getJqwjJdlj() {
        return jqwjJdlj;
    }

    public void setJqwjJdlj(String jqwjJdlj) {
        this.jqwjJdlj = jqwjJdlj == null ? null : jqwjJdlj.trim();
    }

    public Xwb getJqwjXwdm() {
        return jqwjXwdm;
    }

    public void setJqwjXwdm(Xwb jqwjXwdm) {
        this.jqwjXwdm = jqwjXwdm;
    }

    @Override
    public String toString() {
        return "XwQtwjb [jqwjId=" + jqwjId + ", jqwjSjmc=" + jqwjSjmc + ", jqwjXsmc=" + jqwjXsmc + ", jqwjXdlj="
                + jqwjXdlj + ", jqwjJdlj=" + jqwjJdlj + ", jqwjXwdm=" + jqwjXwdm + ", jqwjLmdm=" + jqwjLmdm + "]";
    }

    
    
}