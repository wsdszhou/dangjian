package com.glut.dangjian.entity.dues;

import java.io.Serializable;

public class DuesCollege  implements Serializable {
    private int collegeId;
    private String collegeName;
    private int collegeNum;
    private float collegeRate;

    public int getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(int collegeId) {
        this.collegeId = collegeId;
    }

    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName;
    }

    public int getCollegeNum() {
        return collegeNum;
    }

    public void setCollegeNum(int collegeNum) {
        this.collegeNum = collegeNum;
    }

    public float getCollegeRate() {
        return collegeRate;
    }

    public void setCollegeRate(float collegeRate) {
        this.collegeRate = collegeRate;
    }
}
