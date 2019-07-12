package com.glut.dangjian.entity.kszx;

import java.io.Serializable;

public class KszxTmfl  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    

    private int id;
    //分类名称
    private String name;
    //是否包含子类
    private int children;
    //父级分类
    private int parentId;

    public KszxTmfl() {
        this.parentId = -1;
        this.children = -1;
    }

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


    public int getChildren() {
        return children;
    }

    public void setChildren(int children) {
        this.children = children;
    }


    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    @Override
    public String toString() {
        return "KszxTmfl{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", children=" + children +
                ", parentId=" + parentId +
                '}';
    }
}
