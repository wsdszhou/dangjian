package com.glut.dangjian.entity.system.view;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/8/1
 * Time: 下午4:18
 */

import java.util.List;

/**
 * 功能模块视图
 * 视图以模块id为主键
 */
public class ViewGnmk  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
	//
	private int mkId;
	private String mkMc;
	private String mkUrl;
	private String mkIcon;
	private int gnId;
	private String gnMc;
	private String gnIcon;

	private List<ViewGnmk> children;

	public List<ViewGnmk> getChildren() {
		return children;
	}

	public void setChildren(List<ViewGnmk> children) {
		this.children = children;
	}

	public int getMkId() {
		return mkId;
	}

	public void setMkId(int mkId) {
		this.mkId = mkId;
	}

	public String getMkMc() {
		return mkMc;
	}

	public void setMkMc(String mkMc) {
		this.mkMc = mkMc;
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

	public int getGnId() {
		return gnId;
	}

	public void setGnId(int gnId) {
		this.gnId = gnId;
	}

	public String getGnMc() {
		return gnMc;
	}

	public void setGnMc(String gnMc) {
		this.gnMc = gnMc;
	}

	public String getGnIcon() {
		return gnIcon;
	}

	public void setGnIcon(String gnIcon) {
		this.gnIcon = gnIcon;
	}

	@Override
	public String toString() {
		return "ViewGnmk{" +
				"mkId=" + mkId +
				", mkMc='" + mkMc + '\'' +
				", mkUrl='" + mkUrl + '\'' +
				", mkIcon='" + mkIcon + '\'' +
				", gnId=" + gnId +
				", gnMc='" + gnMc + '\'' +
				", gnIcon='" + gnIcon + '\'' +
				", children=" + children +
				'}';
	}
}
