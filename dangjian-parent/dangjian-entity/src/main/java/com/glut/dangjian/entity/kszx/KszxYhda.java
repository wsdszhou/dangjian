package com.glut.dangjian.entity.kszx;

import java.io.Serializable;

public class KszxYhda  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    

  private int id;
  private String yhid;
  private int sjid;
  private int stid;
  private String xsda;


  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getYhid() {
    return yhid;
  }

  public void setYhid(String yhid) {
    this.yhid = yhid;
  }

  public int getSjid() {
    return sjid;
  }

  public void setSjid(int sjid) {
    this.sjid = sjid;
  }

  public int getStid() {
    return stid;
  }

  public void setStid(int stid) {
    this.stid = stid;
  }

  public String getXsda() {
    return xsda;
  }

  public void setXsda(String xsda) {
    this.xsda = xsda;
  }

  @Override
  public String toString() {
    return "KszxYhda{" +
            "id=" + id +
            ", yhid='" + yhid + '\'' +
            ", sjid=" + sjid +
            ", stid=" + stid +
            ", xsda='" + xsda + '\'' +
            '}';
  }
}
