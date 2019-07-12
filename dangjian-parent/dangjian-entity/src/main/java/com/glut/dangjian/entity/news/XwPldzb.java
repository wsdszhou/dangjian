package com.glut.dangjian.entity.news;

import java.io.Serializable;

public class XwPldzb  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private String pldzId;

    private String pldzPldm;

    private String pldzYhdm;
    
    public XwPldzb() {
        super();
        // TODO Auto-generated constructor stub
    }

    public XwPldzb(String pldzId, String pldzPldm, String pldzYhdm) {
        super();
        this.pldzId = pldzId;
        this.pldzPldm = pldzPldm;
        this.pldzYhdm = pldzYhdm;
    }

    public String getPldzId() {
        return pldzId;
    }

    public void setPldzId(String pldzId) {
        this.pldzId = pldzId == null ? null : pldzId.trim();
    }

    public String getPldzPldm() {
        return pldzPldm;
    }

    public void setPldzPldm(String pldzPldm) {
        this.pldzPldm = pldzPldm == null ? null : pldzPldm.trim();
    }

    public String getPldzYhdm() {
        return pldzYhdm;
    }

    public void setPldzYhdm(String pldzYhdm) {
        this.pldzYhdm = pldzYhdm == null ? null : pldzYhdm.trim();
    }
}