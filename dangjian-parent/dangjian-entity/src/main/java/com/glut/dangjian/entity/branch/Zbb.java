package com.glut.dangjian.entity.branch;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.glut.dangjian.entity.department.Bmb;
import com.glut.dangjian.entity.view.ViewYhxx;
/**
 * 支部对象
 * @author XuLanKong
 *
 */
public class Zbb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 支部id
    private Integer zbId;

    // 支部名称
    private String zbMc;

    // 所属部门表
    private Bmb zbSsbmdm;

    // 支部类型
    private ZbLxb zbLxdm;

    // 支部类型
    private String zbMs;
    
    // 支部书记
    private ViewYhxx zbSj;
    
    // 支部组织委员
    private ViewYhxx zbZzwy;

    // 支部宣传委员
    private ViewYhxx zbXcwy;
    
    private Date zbXgsj;
    
    // 一对多：一个支部有个人员
    private Set<ZbCyb> zbCybs = new HashSet<ZbCyb>();
    
    public Zbb() {
        
    }
    
    public Zbb(Integer zbId) {
        super();
        this.zbId = zbId;
    }

    public Date getZbXgsj() {
        return zbXgsj;
    }

    public void setZbXgsj(Date zbXgsj) {
        this.zbXgsj = zbXgsj;
    }

    public void setZbb(Integer zbId) {
        this.zbId = zbId;
    }
    
    public String getSjMc() {
        if (zbSj != null) {
            return zbSj.getYhxxXm();
        }
        return null;
    }
    
    public String getZzwyXm() {
        if (zbZzwy != null) {
            return zbZzwy.getYhxxXm();
        }
        return null;
    }
    
    public String getXcwyXm() {
        if (zbXcwy != null) {
            return zbXcwy.getYhxxXm();
        }
        return null;
    }

    public String getBmMc() {
        if (zbSsbmdm != null) {
            return zbSsbmdm.getBmMc();
        }
        return null;
    }

    public Integer getZbId() {
        return zbId;
    }

    public void setZbId(Integer zbId) {
        this.zbId = zbId;
    }

    public String getZbMc() {
        return zbMc;
    }

    public void setZbMc(String zbMc) {
        this.zbMc = zbMc;
    }

    public Bmb getZbSsbmdm() {
        return zbSsbmdm;
    }

    public void setZbSsbmdm(Bmb zbSsbmdm) {
        this.zbSsbmdm = zbSsbmdm;
    }

    public ZbLxb getZbLxdm() {
        return zbLxdm;
    }

    public void setZbLxdm(ZbLxb zbLxdm) {
        this.zbLxdm = zbLxdm;
    }

    public String getZbMs() {
        return zbMs;
    }

    public void setZbMs(String zbMs) {
        this.zbMs = zbMs;
    }

    public Set<ZbCyb> getZbCybs() {
        return zbCybs;
    }

    public void setZbCybs(Set<ZbCyb> zbCybs) {
        this.zbCybs = zbCybs;
    }

    public ViewYhxx getZbSj() {
        return zbSj;
    }

    public void setZbSj(ViewYhxx zbSj) {
        this.zbSj = zbSj;
    }

    public ViewYhxx getZbZzwy() {
        return zbZzwy;
    }

    public void setZbZzwy(ViewYhxx zbZzwy) {
        this.zbZzwy = zbZzwy;
    }

    public ViewYhxx getZbXcwy() {
        return zbXcwy;
    }

    public void setZbXcwy(ViewYhxx zbXcwy) {
        this.zbXcwy = zbXcwy;
    }

    @Override
    public String toString() {
        return "Zbb [zbId=" + zbId + ", zbMc=" + zbMc + ", zbSsbmdm=" + zbSsbmdm + ", zbLxdm=" + zbLxdm + ", zbMs="
                + zbMs + ", zbSj=" + zbSj + ", zbZzwy=" + zbZzwy + ", zbXcwy=" + zbXcwy + ", zbCybs=" + zbCybs + "]";
    }

    
}