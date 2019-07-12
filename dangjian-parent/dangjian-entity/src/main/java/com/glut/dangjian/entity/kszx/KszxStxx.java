package com.glut.dangjian.entity.kszx;

import java.io.Serializable;

public class KszxStxx  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    

  private int id;
  private int xx;
  private String xxz;
  private int stid;

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public int getXx() {
    return xx;
  }

  public void setXx(int xx) {
    this.xx = xx;
  }

  public String getXxz() {
    return xxz;
  }

  public void setXxz(String xxz) {
    this.xxz = xxz;
  }

  public int getStid() {
    return stid;
  }

  public void setStid(int stid) {
    this.stid = stid;
  }

  @Override
  public String toString() {
    return "KszxStxx{" +
            "id=" + id +
            ", xx=" + xx +
            ", xxz='" + xxz + '\'' +
            ", stid=" + stid +
            '}';
  }
}
