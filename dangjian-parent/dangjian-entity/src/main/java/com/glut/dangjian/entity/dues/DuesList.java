package com.glut.dangjian.entity.dues;

import java.io.Serializable;
import java.util.Date;

public class DuesList implements Serializable {

  private int listId;
  private String yhxxId;
  private String duesStatus;
  private String duesPerson;
  private Date duesTime;
  private String duesMonth;
  private int collegeId;
  private int branchId;
  private float duesAnount;
  private String duesNotice;

    public String getDuesNotice() {
        return duesNotice;
    }

    public void setDuesNotice(String duesNotice) {
        this.duesNotice = duesNotice;
    }

    public float getDuesAnount() {
        return duesAnount;
    }

    public void setDuesAnount(float duesAnount) {
        this.duesAnount = duesAnount;
    }

    public int getListId() {
        return listId;
    }

    public void setListId(int listId) {
        this.listId = listId;
    }

    public String getYhxxId() {
        return yhxxId;
    }

    public void setYhxxId(String yhxxId) {
        this.yhxxId = yhxxId;
    }

    public String getDuesStatus() {
        return duesStatus;
    }

    public void setDuesStatus(String duesStatus) {
        this.duesStatus = duesStatus;
    }

    public String getDuesPerson() {
        return duesPerson;
    }

    public void setDuesPerson(String duesPerson) {
        this.duesPerson = duesPerson;
    }

    public Date getDuesTime() {
        return duesTime;
    }

    public void setDuesTime(Date duesTime) {
        this.duesTime = duesTime;
    }

    public String getDuesMonth() {
        return duesMonth;
    }

    public void setDuesMonth(String duesMonth) {
        this.duesMonth = duesMonth;
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
}
