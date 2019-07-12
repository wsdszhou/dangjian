package com.glut.dangjian.entity.system.view;

import java.io.Serializable;
import java.util.Date;

public class ViewUserRoleFunction implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private String userId;

    private String userMc;

    private String yhxxId;

    private String yhxxXm;

    private Integer jsId;

    private String jsMc;

    private Date jsXgsj;

    private String jsCode;

    private String jsMs;

    private Integer jsYxj;

    private Integer mkId;

    private String mkMc;

    private String mkCode;

    private Integer mkFId;

    private Integer mkSfsccd;

    private Integer mkPx;

    private String mkUrl;

    private String mkMs;

    private String mkIcon;

    private Date mkXgsj;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getUserMc() {
        return userMc;
    }

    public void setUserMc(String userMc) {
        this.userMc = userMc == null ? null : userMc.trim();
    }

    public String getYhxxId() {
        return yhxxId;
    }

    public void setYhxxId(String yhxxId) {
        this.yhxxId = yhxxId == null ? null : yhxxId.trim();
    }

    public String getYhxxXm() {
        return yhxxXm;
    }

    public void setYhxxXm(String yhxxXm) {
        this.yhxxXm = yhxxXm == null ? null : yhxxXm.trim();
    }

    public Integer getJsId() {
        return jsId;
    }

    public void setJsId(Integer jsId) {
        this.jsId = jsId;
    }

    public String getJsMc() {
        return jsMc;
    }

    public void setJsMc(String jsMc) {
        this.jsMc = jsMc == null ? null : jsMc.trim();
    }

    public Date getJsXgsj() {
        return jsXgsj;
    }

    public void setJsXgsj(Date jsXgsj) {
        this.jsXgsj = jsXgsj;
    }

    public String getJsCode() {
        return jsCode;
    }

    public void setJsCode(String jsCode) {
        this.jsCode = jsCode == null ? null : jsCode.trim();
    }

    public String getJsMs() {
        return jsMs;
    }

    public void setJsMs(String jsMs) {
        this.jsMs = jsMs == null ? null : jsMs.trim();
    }

    public Integer getJsYxj() {
        return jsYxj;
    }

    public void setJsYxj(Integer jsYxj) {
        this.jsYxj = jsYxj;
    }

    public Integer getMkId() {
        return mkId;
    }

    public void setMkId(Integer mkId) {
        this.mkId = mkId;
    }

    public String getMkMc() {
        return mkMc;
    }

    public void setMkMc(String mkMc) {
        this.mkMc = mkMc == null ? null : mkMc.trim();
    }

    public String getMkCode() {
        return mkCode;
    }

    public void setMkCode(String mkCode) {
        this.mkCode = mkCode == null ? null : mkCode.trim();
    }

    public Integer getMkFId() {
        return mkFId;
    }

    public void setMkFId(Integer mkFId) {
        this.mkFId = mkFId;
    }

    public Integer getMkSfsccd() {
        return mkSfsccd;
    }

    public void setMkSfsccd(Integer mkSfsccd) {
        this.mkSfsccd = mkSfsccd;
    }

    public Integer getMkPx() {
        return mkPx;
    }

    public void setMkPx(Integer mkPx) {
        this.mkPx = mkPx;
    }

    public String getMkUrl() {
        return mkUrl;
    }

    public void setMkUrl(String mkUrl) {
        this.mkUrl = mkUrl == null ? null : mkUrl.trim();
    }

    public String getMkMs() {
        return mkMs;
    }

    public void setMkMs(String mkMs) {
        this.mkMs = mkMs == null ? null : mkMs.trim();
    }

    public String getMkIcon() {
        return mkIcon;
    }

    public void setMkIcon(String mkIcon) {
        this.mkIcon = mkIcon == null ? null : mkIcon.trim();
    }

    public Date getMkXgsj() {
        return mkXgsj;
    }

    public void setMkXgsj(Date mkXgsj) {
        this.mkXgsj = mkXgsj;
    }
}