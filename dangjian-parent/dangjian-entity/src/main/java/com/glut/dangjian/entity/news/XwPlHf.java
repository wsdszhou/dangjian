package com.glut.dangjian.entity.news;

import java.io.Serializable;
import java.util.Date;

public class XwPlHf  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private String id;

    private String pldm;

    private String replyId;

    private Integer replyType;

    private String nr;

    private String hfYhdm;

    private String mbYhId;

    private Date sj;

    private Integer flag;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getPldm() {
        return pldm;
    }

    public void setPldm(String pldm) {
        this.pldm = pldm == null ? null : pldm.trim();
    }

    public String getReplyId() {
        return replyId;
    }

    public void setReplyId(String replyId) {
        this.replyId = replyId == null ? null : replyId.trim();
    }

    public Integer getReplyType() {
        return replyType;
    }

    public void setReplyType(Integer replyType) {
        this.replyType = replyType;
    }

    public String getNr() {
        return nr;
    }

    public void setNr(String nr) {
        this.nr = nr == null ? null : nr.trim();
    }

    public String getHfYhdm() {
        return hfYhdm;
    }

    public void setHfYhdm(String hfYhdm) {
        this.hfYhdm = hfYhdm == null ? null : hfYhdm.trim();
    }

    public String getMbYhId() {
        return mbYhId;
    }

    public void setMbYhId(String mbYhId) {
        this.mbYhId = mbYhId == null ? null : mbYhId.trim();
    }

    public Date getSj() {
        return sj;
    }

    public void setSj(Date sj) {
        this.sj = sj;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }
}