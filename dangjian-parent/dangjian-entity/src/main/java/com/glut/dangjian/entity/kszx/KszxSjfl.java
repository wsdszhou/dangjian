package com.glut.dangjian.entity.kszx;

import java.io.Serializable;

public class KszxSjfl  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
  private int id;
  private String name;
  private int parentId;

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getParentId() {
    return parentId;
  }

  public void setParentId(int parentId) {
    this.parentId = parentId;
  }

  @Override
  public String toString() {
    return "KszxSjfl{" +
            "id=" + id +
            ", name='" + name + '\'' +
            ", parentId=" + parentId +
            '}';
  }
}
