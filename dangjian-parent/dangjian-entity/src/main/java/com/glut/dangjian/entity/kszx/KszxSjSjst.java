package com.glut.dangjian.entity.kszx;

import java.io.Serializable;

public class KszxSjSjst  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    

  private int id;
  private int sj;
  private int stfl;
  private String stflmc;
  private int stnd;
  private int pdtsl;
  private int dxtsl;
  private int dxtssl;

    public String getStflmc() {
        return stflmc;
    }

    public void setStflmc(String stflmc) {
        this.stflmc = stflmc;
    }

    @Override
  public String toString() {
    return "KszxSjSjst{" +
            "id=" + id +
            ", sj=" + sj +
            ", stfl=" + stfl +
            ", stflmc='" + stflmc + '\'' +
            ", stnd=" + stnd +
            ", pdtsl=" + pdtsl +
            ", dxtsl=" + dxtsl +
            ", dxtssl=" + dxtssl +
            '}';
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }


  public int getSj() {
    return sj;
  }

  public void setSj(int sj) {
    this.sj = sj;
  }


  public int getStfl() {
    return stfl;
  }

  public void setStfl(int stfl) {
    this.stfl = stfl;
  }


  public int getStnd() {
    return stnd;
  }

  public void setStnd(int stnd) {
    this.stnd = stnd;
  }


  public int getPdtsl() {
    return pdtsl;
  }

  public void setPdtsl(int pdtsl) {
    this.pdtsl = pdtsl;
  }


  public int getDxtsl() {
    return dxtsl;
  }

  public void setDxtsl(int dxtsl) {
    this.dxtsl = dxtsl;
  }


  public int getDxtssl() {
    return dxtssl;
  }

  public void setDxtssl(int dxtssl) {
    this.dxtssl = dxtssl;
  }

}
