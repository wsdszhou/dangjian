package com.glut.dangjian.entity.view;

import java.io.Serializable;

public class ViewDues implements Serializable {

    private int id;
    private String name;
    private int subState;

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

    public int getSubState() {
        return subState;
    }

    public void setSubState(int subState) {
        this.subState = subState;
    }
}
