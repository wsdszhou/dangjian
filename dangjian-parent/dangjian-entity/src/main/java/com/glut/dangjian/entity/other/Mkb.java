package com.glut.dangjian.entity.other;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.glut.dangjian.entity.news.Xwb;

/**
 * 模块表
 * @author XuLanKong
 *
 */
public class Mkb implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    // 模块id
    private Integer mkId;

    // 模块名称
    private String mkMc;
    
    // 模块路径
    private String mkUrl;
    
    // 模块图标
    private String mkIcon;

    // 模块父id
    private Integer mkFId;
    
    // 模块所属功能
    private Integer gnb;
    
    
	public Mkb() {
	    
    }


    public Mkb(Integer mkId, String mkMc) {
        super();
        this.mkId = mkId;
        this.mkMc = mkMc;
    }

    public Mkb(Integer mkId, String mkMc, String mkUrl, String mkIcon, Integer mkFId, Integer gnb, Set<Xwb> xwbs) {
        this.mkId = mkId;
        this.mkMc = mkMc;
        this.mkUrl = mkUrl;
        this.mkIcon = mkIcon;
        this.mkFId = mkFId;
        this.gnb = gnb;
        this.xwbs = xwbs;
    }

    public Mkb(Integer mkId) {
        this.mkId = mkId;
    }




    public Integer getGnb() {
		return gnb;
	}

	public void setGnb(Integer gnb) {
		this.gnb = gnb;
	}

	// 一对多：一个有模块多个新闻
    private Set<Xwb> xwbs = new HashSet<Xwb>();

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

    public Integer getMkFId() {
        return mkFId;
    }

    public void setMkFId(Integer mkFId) {
        this.mkFId = mkFId;
    }


    public Set<Xwb> getXwbs() {
        return xwbs;
    }

    public void setXwbs(Set<Xwb> xwbs) {
        this.xwbs = xwbs;
    }

    public String getMkUrl() {
        return mkUrl;
    }

    public void setMkUrl(String mkUrl) {
        this.mkUrl = mkUrl;
    }

    public String getMkIcon() {
        return mkIcon;
    }

    public void setMkIcon(String mkIcon) {
        this.mkIcon = mkIcon;
    }

	@Override
	public String toString() {
		return "Mkb{" +
				"mkId=" + mkId +
				", mkMc='" + mkMc + '\'' +
				", mkUrl='" + mkUrl + '\'' +
				", mkIcon='" + mkIcon + '\'' +
				", mkFId=" + mkFId +
				", gnb=" + gnb +
				", xwbs=" + xwbs +
				'}';
	}
}