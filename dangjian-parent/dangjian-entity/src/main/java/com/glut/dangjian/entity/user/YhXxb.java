package com.glut.dangjian.entity.user;

import java.io.Serializable;
import java.util.Date;

import com.glut.dangjian.entity.branch.Zbb;
import com.glut.dangjian.entity.department.Bmb;
import com.glut.dangjian.entity.other.Dnzwb;
import com.glut.dangjian.entity.other.Jgb;
import com.glut.dangjian.entity.other.Mzb;
import com.glut.dangjian.entity.other.Xlb;
import com.glut.dangjian.entity.other.Xzzwb;
import com.glut.dangjian.entity.other.Zzmmb;

/**
 * 用户信息
 * @author XuLanKong
 *
 */
public class YhXxb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 用户信息id
    private String yhxxId;

    // 用户姓名
    private String yhxxXm;

    // 用户性别
    private String yhxxXb;

    // 用户出生日期
    private Date yhxxCsrq;

    // 用户手机号
    private String yhxxSjh;
    
    // 电话号码
    private String yhxxDhhm;

    // 用户邮箱
    private String yhxxYx;

    // 用户身份证
    private String yhxxSfzh;

    // 用户头像
    private String yhxxTx;

    // 描述
    private String yhxxMs;

    // 档案
    private String yhxxDa;

    // 学历表
    private Xlb yhxxXldm;

    // 政治面貌表
    private Zzmmb yhxxZzmmdm;

    // 籍贯表
    private Jgb yhxxJgdm;

    // 民族表
    private Mzb yhxxMzdm;

    // 党内职务表
    private Dnzwb yhxxDnzwdm;

    // 行政职务表
    private Xzzwb yhxxXzzwdm;

    // 部门表
    private Bmb yhxxBmdm;

    // 支部表
    private Zbb yhxxZbdm;

    // 年级
    private String yhxxMj;
    
    

    public YhXxb(String yhxxId, String yhxxXm, String yhxxXb, Date yhxxCsrq, String yhxxSjh, String yhxxDhhm,
            String yhxxYx, String yhxxSfzh, String yhxxTx, String yhxxMs, String yhxxDa, Integer yhxxXldm, Integer yhxxZzmmdm,
            Integer yhxxJgdm, Integer yhxxMzdm, Integer yhxxDnzwdm, Integer yhxxXzzwdm, Integer yhxxBmdm, Integer yhxxZbdm,
            String yhxxMj) {
        super();
        this.yhxxId = yhxxId;
        this.yhxxXm = yhxxXm;
        this.yhxxXb = yhxxXb;
        this.yhxxCsrq = yhxxCsrq;
        this.yhxxSjh = yhxxSjh;
        this.yhxxDhhm = yhxxDhhm;
        this.yhxxYx = yhxxYx;
        this.yhxxSfzh = yhxxSfzh;
        this.yhxxTx = yhxxTx;
        this.yhxxMs = yhxxMs;
        this.yhxxDa = yhxxDa;
        this.yhxxXldm = new Xlb(yhxxXldm);
        this.yhxxZzmmdm = new Zzmmb(yhxxZzmmdm);
        this.yhxxJgdm = new Jgb(yhxxJgdm);
        this.yhxxMzdm = new Mzb(yhxxMzdm);
        this.yhxxDnzwdm = new Dnzwb(yhxxDnzwdm);
        this.yhxxXzzwdm = new Xzzwb(yhxxXzzwdm);
        this.yhxxBmdm = new Bmb(yhxxBmdm);
        this.yhxxZbdm = new Zbb(yhxxZbdm);
        this.yhxxMj = yhxxMj;
    }

    public YhXxb() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public YhXxb(String yhxxId) {
        this.yhxxId = yhxxId;
    }

    public String getYhxxDhhm() {
        return yhxxDhhm;
    }

    public void setYhxxDhhm(String yhxxDhhm) {
        this.yhxxDhhm = yhxxDhhm;
    }

    public String getYhxxId() {
        return yhxxId;
    }

    public void setYhxxId(String yhxxId) {
        this.yhxxId = yhxxId;
    }

    public String getYhxxXm() {
        return yhxxXm;
    }

    public void setYhxxXm(String yhxxXm) {
        this.yhxxXm = yhxxXm;
    }

    public String getYhxxXb() {
        return yhxxXb;
    }

    public void setYhxxXb(String yhxxXb) {
        this.yhxxXb = yhxxXb;
    }

    public Date getYhxxCsrq() {
        return yhxxCsrq;
    }

    public void setYhxxCsrq(Date yhxxCsrq) {
        this.yhxxCsrq = yhxxCsrq;
    }

    public String getYhxxSjh() {
        return yhxxSjh;
    }

    public void setYhxxSjh(String yhxxSjh) {
        this.yhxxSjh = yhxxSjh;
    }

    public String getYhxxYx() {
        return yhxxYx;
    }

    public void setYhxxYx(String yhxxYx) {
        this.yhxxYx = yhxxYx;
    }

    public String getYhxxSfzh() {
        return yhxxSfzh;
    }

    public void setYhxxSfzh(String yhxxSfzh) {
        this.yhxxSfzh = yhxxSfzh;
    }

    public String getYhxxTx() {
        return yhxxTx;
    }

    public void setYhxxTx(String yhxxTx) {
        this.yhxxTx = yhxxTx;
    }

    public String getYhxxMs() {
        return yhxxMs;
    }

    public void setYhxxMs(String yhxxMs) {
        this.yhxxMs = yhxxMs;
    }

    public String getYhxxDa() {
        return yhxxDa;
    }

    public void setYhxxDa(String yhxxDa) {
        this.yhxxDa = yhxxDa;
    }

    public Xlb getYhxxXldm() {
        return yhxxXldm;
    }

    public void setYhxxXldm(Xlb yhxxXldm) {
        this.yhxxXldm = yhxxXldm;
    }

    public Zzmmb getYhxxZzmmdm() {
        return yhxxZzmmdm;
    }

    public void setYhxxZzmmdm(Zzmmb yhxxZzmmdm) {
        this.yhxxZzmmdm = yhxxZzmmdm;
    }

    public Jgb getYhxxJgdm() {
        return yhxxJgdm;
    }

    public void setYhxxJgdm(Jgb yhxxJgdm) {
        this.yhxxJgdm = yhxxJgdm;
    }

    public Mzb getYhxxMzdm() {
        return yhxxMzdm;
    }

    public void setYhxxMzdm(Mzb yhxxMzdm) {
        this.yhxxMzdm = yhxxMzdm;
    }

    public Dnzwb getYhxxDnzwdm() {
        return yhxxDnzwdm;
    }

    public void setYhxxDnzwdm(Dnzwb yhxxDnzwdm) {
        this.yhxxDnzwdm = yhxxDnzwdm;
    }

    public Xzzwb getYhxxXzzwdm() {
        return yhxxXzzwdm;
    }

    public void setYhxxXzzwdm(Xzzwb yhxxXzzwdm) {
        this.yhxxXzzwdm = yhxxXzzwdm;
    }

    public Bmb getYhxxBmdm() {
        return yhxxBmdm;
    }

    public void setYhxxBmdm(Bmb yhxxBmdm) {
        this.yhxxBmdm = yhxxBmdm;
    }

    public Zbb getYhxxZbdm() {
        return yhxxZbdm;
    }

    public void setYhxxZbdm(Zbb yhxxZbdm) {
        this.yhxxZbdm = yhxxZbdm;
    }

    public String getYhxxMj() {
        return yhxxMj;
    }

    public void setYhxxMj(String yhxxMj) {
        this.yhxxMj = yhxxMj;
    }

    @Override
    public String toString() {
        return "YhXxb [yhxxId=" + yhxxId + ", yhxxXm=" + yhxxXm + ", yhxxXb=" + yhxxXb + ", yhxxCsrq=" + yhxxCsrq
                + ", yhxxSjh=" + yhxxSjh + ", yhxxDhhm=" + yhxxDhhm + ", yhxxYx=" + yhxxYx + ", yhxxSfzh=" + yhxxSfzh
                + ", yhxxTx=" + yhxxTx + ", yhxxMs=" + yhxxMs + ", yhxxDa=" + yhxxDa + ", yhxxXldm=" + yhxxXldm
                + ", yhxxZzmmdm=" + yhxxZzmmdm + ", yhxxJgdm=" + yhxxJgdm + ", yhxxMzdm=" + yhxxMzdm + ", yhxxDnzwdm="
                + yhxxDnzwdm + ", yhxxXzzwdm=" + yhxxXzzwdm + ", yhxxBmdm=" + yhxxBmdm + ", yhxxZbdm=" + yhxxZbdm
                + ", yhxxMj=" + yhxxMj + "]";
    }

   

   
    
    

    
    
    
    
    
}