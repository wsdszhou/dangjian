package com.glut.dangjian.entity.department;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.glut.dangjian.entity.branch.Zbb;
import com.glut.dangjian.entity.view.ViewYhxx;

/**
 * 部门表
 * @author XuLanKong
 *
 */
public class Bmb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 部门id
    private Integer bmId;

    // 部门名称
    private String bmMc;
    
    // 部门介绍
    private String bmJs;
    
    // 院长
    private ViewYhxx bmYz;

    // 书记
    private ViewYhxx bmSj;

    // 创建时间
    private Date bmCjsj;

    // 修改时间
    private Date bmXgsj;
    
    // 部门logo
    private String bmLogo;
    
    // 一对多：一个部门有多个支部
    private Set<Zbb> zbbs = new HashSet<Zbb>();
    
    public Bmb() {
        
    }
    
    public Bmb(Integer bmId) {
        super();
        this.bmId = bmId;
    }
    
    
    public String getSjMc() {
        if (bmSj != null) {
            return bmSj.getYhxxXm();
        }
        return null;
    }
    
    public String getYzMc() {
        if (bmYz != null) {
            return bmYz.getYhxxXm();
        }
        return null;
    }
    
    

    public Integer getBmId() {
        return bmId;
    }

    public void setBmId(Integer bmId) {
        this.bmId = bmId;
    }

    public String getBmMc() {
        return bmMc;
    }

    public void setBmMc(String bmMc) {
        this.bmMc = bmMc;
    }

    public String getBmJs() {
        return bmJs;
    }

    public void setBmJs(String bmJs) {
        this.bmJs = bmJs;
    }

    public ViewYhxx getBmYz() {
        return bmYz;
    }

    public void setBmYz(ViewYhxx bmYz) {
        this.bmYz = bmYz;
    }

    public ViewYhxx getBmSj() {
        return bmSj;
    }

    public void setBmSj(ViewYhxx bmSj) {
        this.bmSj = bmSj;
    }

    public Date getBmCjsj() {
        return bmCjsj;
    }

    public void setBmCjsj(Date bmCjsj) {
        this.bmCjsj = bmCjsj;
    }

    public Date getBmXgsj() {
        return bmXgsj;
    }

    public void setBmXgsj(Date bmXgsj) {
        this.bmXgsj = bmXgsj;
    }

    public String getBmLogo() {
        return bmLogo;
    }

    public void setBmLogo(String bmLogo) {
        this.bmLogo = bmLogo;
    }

    public Set<Zbb> getZbbs() {
        return zbbs;
    }

    public void setZbbs(Set<Zbb> zbbs) {
        this.zbbs = zbbs;
    }

    @Override
    public String toString() {
        return "Bmb [bmId=" + bmId + ", bmMc=" + bmMc + ", bmJs=" + bmJs + ", bmYz=" + bmYz + ", bmSj=" + bmSj
                + ", bmCjsj=" + bmCjsj + ", bmXgsj=" + bmXgsj + ", bmLogo=" + bmLogo + ", zbbs=" + zbbs + "]";
    }




   

   
}