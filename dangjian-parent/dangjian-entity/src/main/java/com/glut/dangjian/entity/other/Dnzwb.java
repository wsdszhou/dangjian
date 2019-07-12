package com.glut.dangjian.entity.other;

import java.io.Serializable;

/**
 * 党内职务
 * @author XuLanKong
 *
 */
public class Dnzwb  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 党内职务id
    private Integer dnzwId;

    // 党内职务名称
    private String dnzwMc;

    // 党内职务级别：1表示校级，2表示学院级，3表示支部级）
    private Integer dnzwJb;
    
    public Dnzwb(Integer dnzwId) {
        super();
        this.dnzwId = dnzwId;
    }

    public Dnzwb() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Integer getDnzwId() {
        return dnzwId;
    }

    public void setDnzwId(Integer dnzwId) {
        this.dnzwId = dnzwId;
    }

    public String getDnzwMc() {
        return dnzwMc;
    }

    public void setDnzwMc(String dnzwMc) {
        this.dnzwMc = dnzwMc == null ? null : dnzwMc.trim();
    }

    public Integer getDnzwJb() {
        return dnzwJb;
    }

    public void setDnzwJb(Integer dnzwJb) {
        this.dnzwJb = dnzwJb;
    }

    @Override
    public String toString() {
        return "Dnzwb [dnzwId=" + dnzwId + ", dnzwMc=" + dnzwMc + ", dnzwJb=" + dnzwJb + "]";
    }
    
    
}