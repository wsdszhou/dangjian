package com.glut.dangjian.entity.dues.view;

import java.io.Serializable;

public class ViewDuesCollegeBranch implements Serializable {

    private int collegeId;
    private String collegeName;
    private int collegeNum;
    private float collegeRate;

    private int branchId;
    private String branchName;
    private int branchNum;
    private float branchRate;

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

    public int getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(int collegeId) {
        this.collegeId = collegeId;
    }

    public int getBranchId() {
        return branchId;
    }

    public void setBranchId(int branchId) {
        this.branchId = branchId;
    }

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }

    public int getBranchNum() {
        return branchNum;
    }

    public void setBranchNum(int branchNum) {
        this.branchNum = branchNum;
    }

    public float getBranchRate() {
        return branchRate;
    }

    public void setBranchRate(float branchRate) {
        this.branchRate = branchRate;
    }
}
