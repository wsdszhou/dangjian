package com.glut.dangjian.entity.kszx;


import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.Date;

public class KszxYhsj  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
  private int id;
  private String userId;
  private int testpaperId;
  private String questions;
  private int studentScore;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  private Date startTime;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  private Date endTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getTestpaperId() {
        return testpaperId;
    }

    public void setTestpaperId(int testpaperId) {
        this.testpaperId = testpaperId;
    }

    public String getQuestions() {
        return questions;
    }

    public void setQuestions(String questions) {
        this.questions = questions;
    }

    public int getStudentScore() {
        return studentScore;
    }

    public void setStudentScore(int studentScore) {
        this.studentScore = studentScore;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        return "KszxYhsj{" +
                "id=" + id +
                ", userId='" + userId + '\'' +
                ", testpaper=" + testpaperId +
                ", questions='" + questions + '\'' +
                ", studentScore=" + studentScore +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                '}';
    }
}
