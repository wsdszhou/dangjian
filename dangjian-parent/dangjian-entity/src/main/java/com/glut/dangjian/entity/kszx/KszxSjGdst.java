package com.glut.dangjian.entity.kszx;

import java.io.Serializable;

public class KszxSjGdst  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    

  private int id;
  //试题类型
  private String stlx;
  //试卷id
  private int sj;
  //试题id
  private int st;
  //试题名称
  private String question;
  //试题难度
  private int stnd;
  //试题分类
  private String stfl;
  //试题分数
  private int fs;

  @Override
  public String toString() {
    return "KszxSjGdst{" +
            "id=" + id +
            ", stlx='" + stlx + '\'' +
            ", sj=" + sj +
            ", st=" + st +
            ", question='" + question + '\'' +
            ", stnd=" + stnd +
            ", stfl='" + stfl + '\'' +
            ", fs=" + fs +
            '}';
  }

  public int getStnd() {
    return stnd;
  }

  public void setStnd(int stnd) {
    this.stnd = stnd;
  }

  public String getStfl() {
    return stfl;
  }

  public void setStfl(String stfl) {
    this.stfl = stfl;
  }

  public String getQuestion() {
    return question;
  }

  public void setQuestion(String question) {
    this.question = question;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }


  public String getStlx() {
    return stlx;
  }

  public void setStlx(String stlx) {
    this.stlx = stlx;
  }


  public int getSj() {
    return sj;
  }

  public void setSj(int sj) {
    this.sj = sj;
  }


  public int getSt() {
    return st;
  }

  public void setSt(int st) {
    this.st = st;
  }


  public int getFs() {
    return fs;
  }

  public void setFs(int fs) {
    this.fs = fs;
  }

}
