package com.glut.dangjian.entity.news;

import java.io.Serializable;

import com.glut.dangjian.entity.other.Lmb;
/**
 * 图片
 * @author XuLanKong
 *
 */
public class XwTpb implements Serializable{
    
    private static final long serialVersionUID = 1L;
   
    // 图片id
    private String tpId;

    // 图片实际名称
    private String tpSjmc;

    // 图片显示名称
    private String tpXsmc;

    // 图片相对路径
    private String tpXdlj;

    // 图片绝对路径
    private String tpJdlj;
    
    // 所属栏目
    private Lmb tpLmdm;
    
    // 所属的新闻文件表
    private Xwb tpXwdm;
    
    // 图片二进制
    private byte[] tpTp;
    
    //
    private Xwb xwb;
    
    public Xwb getXwb() {
        return xwb;
    }

    public void setXwb(Xwb xwb) {
        this.xwb = xwb;
    }

    public byte[] getTpTp() {
        return tpTp;
    }

    public void setTpTp(byte[] tpTp) {
        this.tpTp = tpTp;
    }

    public Lmb getTpLmdm() {
        return tpLmdm;
    }

    public void setTpLmdm(Lmb tpLmdm) {
        this.tpLmdm = tpLmdm;
    }

    public String getTpId() {
        return tpId;
    }

    public void setTpId(String tpId) {
        this.tpId = tpId == null ? null : tpId.trim();
    }

    public String getTpSjmc() {
        return tpSjmc;
    }

    public void setTpSjmc(String tpSjmc) {
        this.tpSjmc = tpSjmc == null ? null : tpSjmc.trim();
    }

    public String getTpXsmc() {
        return tpXsmc;
    }

    public void setTpXsmc(String tpXsmc) {
        this.tpXsmc = tpXsmc == null ? null : tpXsmc.trim();
    }

    public String getTpXdlj() {
        return tpXdlj;
    }

    public void setTpXdlj(String tpXdlj) {
        this.tpXdlj = tpXdlj == null ? null : tpXdlj.trim();
    }

    public String getTpJdlj() {
        return tpJdlj;
    }

    public void setTpJdlj(String tpJdlj) {
        this.tpJdlj = tpJdlj == null ? null : tpJdlj.trim();
    }

    public Xwb gettpXwdm() {
        return tpXwdm;
    }

    public void settpXwdm(Xwb tpXwdm) {
        this.tpXwdm = tpXwdm;
    }

    @Override
    public String toString() {
        return "XwTpb [tpId=" + tpId + ", tpSjmc=" + tpSjmc + ", tpXsmc=" + tpXsmc + ", tpXdlj=" + tpXdlj + ", tpJdlj="
                + tpJdlj + ", tpLmdm=" + tpLmdm + ", tpXwdm=" + tpXwdm + "]";
    }

   
    
    
    
    
    
}