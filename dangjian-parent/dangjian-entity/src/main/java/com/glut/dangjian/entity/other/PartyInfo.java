package com.glut.dangjian.entity.other;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.glut.dangjian.entity.user.Yhb;
/**
 * 党籍信息
 * @author lanlan
 *
 */
import com.glut.dangjian.entity.view.ViewYhxx;
public class PartyInfo implements Serializable{
    
    private static final long serialVersionUID = 1L;

    private String id;

    private Date sqsj;
    
    private Date spsj;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date rdsj;

    private String ms;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date zrsj;

    private String zcdd;

    private Yhb yhdm;
    
    private Integer zt;
    
    private Integer bmdm;
    
    private Integer zbdm;
    
    private Integer dnzwdm;
    
    private Integer zzmmdm;
    
    private Integer result;
    
    /*public Integer getResult() {
        return result;
    }

    public void setResult(Integer result) {
        this.result = result;
    }

    public Date getSqsj() {
        return sqsj;
    }

    public void setSqsj(Date sqsj) {
        this.sqsj = sqsj;
    }

    public Date getSpsj() {
        return spsj;
    }

    public void setSpsj(Date spsj) {
        this.spsj = spsj;
    }

    public Integer getBmdm() {
        return bmdm;
    }

    public void setBmdm(Integer bmdm) {
        this.bmdm = bmdm;
    }

    public Integer getZbdm() {
        return zbdm;
    }

    public void setZbdm(Integer zbdm) {
        this.zbdm = zbdm;
    }

    public Integer getDnzwdm() {
        return dnzwdm;
    }

    public void setDnzwdm(Integer dnzwdm) {
        this.dnzwdm = dnzwdm;
    }

    public Integer getZzmmdm() {
        return zzmmdm;
    }

    public void setZzmmdm(Integer zzmmdm) {
        this.zzmmdm = zzmmdm;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getRdsj() {
        return rdsj;
    }

    public void setRdsj(Date rdsj) {
        this.rdsj = rdsj;
    }

    public String getMs() {
        return ms;
    }

    public void setMs(String ms) {
        this.ms = ms;
    }

    public Date getZrsj() {
        return zrsj;
    }

    public void setZrsj(Date zrsj) {
        this.zrsj = zrsj;
    }

    public String getZcdd() {
        return zcdd;
    }

    public void setZcdd(String zcdd) {
        this.zcdd = zcdd;
    }

    public Yhb getYhdm() {
        return yhdm;
    }

    public void setYhdm(Yhb yhdm) {
        this.yhdm = yhdm;
    }

    public Integer getZt() {
        return zt;
    }

    public void setZt(Integer zt) {
        this.zt = zt;
    }*/

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getSqsj() {
        return sqsj;
    }

    public void setSqsj(Date sqsj) {
        this.sqsj = sqsj;
    }

    public Date getSpsj() {
        return spsj;
    }

    public void setSpsj(Date spsj) {
        this.spsj = spsj;
    }

    public Date getRdsj() {
        return rdsj;
    }

    public void setRdsj(Date rdsj) {
        this.rdsj = rdsj;
    }

    public String getMs() {
        return ms;
    }

    public void setMs(String ms) {
        this.ms = ms;
    }

    public Date getZrsj() {
        return zrsj;
    }

    public void setZrsj(Date zrsj) {
        this.zrsj = zrsj;
    }

    public String getZcdd() {
        return zcdd;
    }

    public void setZcdd(String zcdd) {
        this.zcdd = zcdd;
    }

    public Yhb getYhdm() {
        return yhdm;
    }

    public void setYhdm(Yhb yhdm) {
        this.yhdm = yhdm;
    }

    public Integer getZt() {
        return zt;
    }

    public void setZt(Integer zt) {
        this.zt = zt;
    }

    public Integer getBmdm() {
        return bmdm;
    }

    public void setBmdm(Integer bmdm) {
        this.bmdm = bmdm;
    }

    public Integer getZbdm() {
        return zbdm;
    }

    public void setZbdm(Integer zbdm) {
        this.zbdm = zbdm;
    }

    public Integer getDnzwdm() {
        return dnzwdm;
    }

    public void setDnzwdm(Integer dnzwdm) {
        this.dnzwdm = dnzwdm;
    }

    public Integer getZzmmdm() {
        return zzmmdm;
    }

    public void setZzmmdm(Integer zzmmdm) {
        this.zzmmdm = zzmmdm;
    }

    public Integer getResult() {
        return result;
    }

    public void setResult(Integer result) {
        this.result = result;
    }

    /*@Override
    public String toString() {
        return "PartyInfo [id=" + id + ", rdsj=" + rdsj + ", ms=" + ms + ", zrsj=" + zrsj + ", zcdd=" + zcdd + ", yhdm="
                + yhdm + ", zt=" + zt + "]";
    }*/

    @Override
    public String toString() {
        return "PartyInfo{" +
                "id='" + id + '\'' +
                ", sqsj=" + sqsj +
                ", spsj=" + spsj +
                ", rdsj=" + rdsj +
                ", ms='" + ms + '\'' +
                ", zrsj=" + zrsj +
                ", zcdd='" + zcdd + '\'' +
                ", yhdm=" + yhdm +
                ", zt=" + zt +
                ", bmdm=" + bmdm +
                ", zbdm=" + zbdm +
                ", dnzwdm=" + dnzwdm +
                ", zzmmdm=" + zzmmdm +
                ", result=" + result +
                '}';
    }
}