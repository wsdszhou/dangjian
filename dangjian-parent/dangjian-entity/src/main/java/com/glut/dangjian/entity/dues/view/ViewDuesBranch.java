package com.glut.dangjian.entity.dues.view;

import java.io.Serializable;

public class ViewDuesBranch implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer collegeId;
    private int branchId;
    private String branchName;
    private int branchNum;
    private float branchRate;

    public Integer getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(Integer collegeId) {
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
