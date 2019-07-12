package com.glut.dangjian.entity.dues;

import java.io.Serializable;

public class DuesBranch implements Serializable {
    private int branchId;
    private String branchName;
    private int branchNum;
    private float branchRate;

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
