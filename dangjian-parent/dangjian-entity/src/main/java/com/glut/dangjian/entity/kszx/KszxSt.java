package com.glut.dangjian.entity.kszx;


import java.io.Serializable;
import java.util.List;

public class KszxSt  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    

  private int id;
  //试题名称
  private String stmc;
  //试题作者
  private String stzz;
  //试题分类
  private int stfl;
  //试题类型
  private String stlx;
  //试题分数
  private int stfs;
  //试题解析
  private String stjx;
  //试题难度
  private String stnd;
  //试题答案
  private String stda;

  /*多表关联字段*/

  //一对多，试题选项
  private List<KszxStxx> kszxStxxList;

  public KszxSt() {
  }

  public KszxSt(int id, String stmc, String stzz, int stfl, String stlx, int stfs, String stjx, String stnd, String stda) {
    super();
    this.id = id;
    this.stmc = stmc;
    this.stzz = stzz;
    this.stfl = stfl;
    this.stlx = stlx;
    this.stfs = stfs;
    this.stjx = stjx;
    this.stnd = stnd;
    this.stda = stda;
  }

  public List<KszxStxx> getKszxStxxList() {
    return kszxStxxList;
  }

  public void setKszxStxxList(List<KszxStxx> kszxStxxList) {
    this.kszxStxxList = kszxStxxList;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }


  public String getStmc() {
    return stmc;
  }

  public void setStmc(String stmc) {
    this.stmc = stmc;
  }


  public String getStzz() {
    return stzz;
  }

  public void setStzz(String stzz) {
    this.stzz = stzz;
  }


  public int getStfl() {
    return stfl;
  }

  public void setStfl(int stfl) {
    this.stfl = stfl;
  }


  public String getStlx() {
    return stlx;
  }

  public void setStlx(String stlx) {
    this.stlx = stlx;
  }


  public int getStfs() {
    return stfs;
  }

  public void setStfs(int stfs) {
    this.stfs = stfs;
  }


  public String getStjx() {
    return stjx;
  }

  public void setStjx(String stjx) {
    this.stjx = stjx;
  }


  public String getStnd() {
    return stnd;
  }

  public void setStnd(String stnd) {
    this.stnd = stnd;
  }

  public String getStda() {
    return stda;
  }

  public void setStda(String stda) {
    this.stda = stda;
  }

  @Override
  public String toString() {
    return "KszxSt{" +
            "id=" + id +
            ", stmc='" + stmc + '\'' +
            ", stzz='" + stzz + '\'' +
            ", stfl=" + stfl +
            ", stlx='" + stlx + '\'' +
            ", stfs=" + stfs +
            ", stjx='" + stjx + '\'' +
            ", stnd='" + stnd + '\'' +
            ", stda='" + stda + '\'' +
            ", kszxStxxList=" + kszxStxxList +
            '}';
  }
}
