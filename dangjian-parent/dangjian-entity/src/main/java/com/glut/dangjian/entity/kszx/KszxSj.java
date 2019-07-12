package com.glut.dangjian.entity.kszx;


import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.Date;

public class KszxSj  implements Serializable{
    
    private static final long serialVersionUID = 1L;

    private int id;
    private String sjbt;
    private int sjlb;
    private String kssm;
    private int zjfs;
    private int stzs;
    private int sjzf;
    private int jgfs;
    private int djsj;

    private int pdtfs;
    private int dxtfs;
    private int dxtsfs;

    private int pdtsl;
    private int dxtsl;
    private int dxtssl;

    public int getPdtsl() {
        return pdtsl;
    }

    public void setPdtsl(int pdtsl) {
        this.pdtsl = pdtsl;
    }

    public int getDxtsl() {
        return dxtsl;
    }

    public void setDxtsl(int dxtsl) {
        this.dxtsl = dxtsl;
    }

    public int getDxtssl() {
        return dxtssl;
    }

    public void setDxtssl(int dxtssl) {
        this.dxtssl = dxtssl;
    }

    @JSONField(format = "yyyy-MM-dd hh:mm:ss")
    private Date kssj;

    @JSONField(format = "yyyy-MM-dd hh:mm:ss")
    private Date jssj;
    private int zdjj;

    @JSONField(format = "yyyy-MM-dd hh:mm:ss")
    private Date cjrq;

    @Override
    public String toString() {
        return "KszxSj{" +
                "id=" + id +
                ", sjbt='" + sjbt + '\'' +
                ", sjlb=" + sjlb +
                ", kssm='" + kssm + '\'' +
                ", zjfs=" + zjfs +
                ", stzs=" + stzs +
                ", sjzf=" + sjzf +
                ", jgfs=" + jgfs +
                ", djsj=" + djsj +
                ", pdtfs=" + pdtfs +
                ", dxtfs=" + dxtfs +
                ", dxtsfs=" + dxtsfs +
                ", pdtsl=" + pdtsl +
                ", dxtsl=" + dxtsl +
                ", dxtssl=" + dxtssl +
                ", kssj=" + kssj +
                ", jssj=" + jssj +
                ", zdjj=" + zdjj +
                ", cjrq=" + cjrq +
                '}';
    }

    public int getPdtfs() {
        return pdtfs;
    }

    public void setPdtfs(int pdtfs) {
        this.pdtfs = pdtfs;
    }

    public int getDxtfs() {
        return dxtfs;
    }

    public void setDxtfs(int dxtfs) {
        this.dxtfs = dxtfs;
    }

    public int getDxtsfs() {
        return dxtsfs;
    }

    public void setDxtsfs(int dxtsfs) {
        this.dxtsfs = dxtsfs;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSjbt() {
        return sjbt;
    }

    public void setSjbt(String sjbt) {
        this.sjbt = sjbt;
    }

    public int getSjlb() {
        return sjlb;
    }

    public void setSjlb(int sjlb) {
        this.sjlb = sjlb;
    }

    public String getKssm() {
        return kssm;
    }

    public void setKssm(String kssm) {
        this.kssm = kssm;
    }

    public int getZjfs() {
        return zjfs;
    }

    public void setZjfs(int zjfs) {
        this.zjfs = zjfs;
    }

    public int getStzs() {
        return stzs;
    }

    public void setStzs(int stzs) {
        this.stzs = stzs;
    }

    public int getSjzf() {
        return sjzf;
    }

    public void setSjzf(int sjzf) {
        this.sjzf = sjzf;
    }

    public int getJgfs() {
        return jgfs;
    }

    public void setJgfs(int jgfs) {
        this.jgfs = jgfs;
    }

    public int getDjsj() {
        return djsj;
    }

    public void setDjsj(int djsj) {
        this.djsj = djsj;
    }

    public Date getKssj() {
        return kssj;
    }

    public void setKssj(Date kssj) {
        this.kssj = kssj;
    }

    public Date getJssj() {
        return jssj;
    }

    public void setJssj(Date jssj) {
        this.jssj = jssj;
    }


    public int getZdjj() {
        return zdjj;
    }

    public void setZdjj(int zdjj) {
        this.zdjj = zdjj;
    }

    public Date getCjrq() {
        return cjrq;
    }

    public void setCjrq(Date cjrq) {
        this.cjrq = cjrq;
    }

}
