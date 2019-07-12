package com.glut.dangjian.entity.department;

import java.io.Serializable;
import java.util.Date;
/**
 * 
 * @author lanlan
 *
 */
public class Bmry implements Serializable {
    
    private static final long serialVersionUID = 1L;

    private Integer bmryId;

    private String bmryMc;

    private Date bmryHdsj;

    private String bmryJs;

    private Bmb bmryBmdm;

    private String bmryTp;
    
    public String getBmMc() {
        if (bmryBmdm != null) {
            return bmryBmdm.getBmMc();
        }
        return null;
    }

    public Integer getBmryId() {
        return bmryId;
    }

    public void setBmryId(Integer bmryId) {
        this.bmryId = bmryId;
    }

    public String getBmryMc() {
        return bmryMc;
    }

    public void setBmryMc(String bmryMc) {
        this.bmryMc = bmryMc;
    }

    public Date getBmryHdsj() {
        return bmryHdsj;
    }

    public void setBmryHdsj(Date bmryHdsj) {
        this.bmryHdsj = bmryHdsj;
    }

    public String getBmryJs() {
        return bmryJs;
    }

    public void setBmryJs(String bmryJs) {
        this.bmryJs = bmryJs;
    }

    public Bmb getBmryBmdm() {
        return bmryBmdm;
    }

    public void setBmryBmdm(Bmb bmryBmdm) {
        this.bmryBmdm = bmryBmdm;
    }

    public String getBmryTp() {
        return bmryTp;
    }

    public void setBmryTp(String bmryTp) {
        this.bmryTp = bmryTp;
    }

    @Override
    public String toString() {
        return "Bmry [bmryId=" + bmryId + ", bmryMc=" + bmryMc + ", bmryHdsj=" + bmryHdsj + ", bmryJs=" + bmryJs
                + ", bmryBmdm=" + bmryBmdm + ", bmryTp=" + bmryTp + "]";
    }

    
}