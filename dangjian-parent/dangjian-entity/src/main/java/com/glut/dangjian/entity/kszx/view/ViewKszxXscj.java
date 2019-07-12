package com.glut.dangjian.entity.kszx.view;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018-12-24
 * Time: 21:00
 * 简单的事情重复做，重复的事情坚持做，坚持的事情用心做
 **/


public class ViewKszxXscj  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private Integer testPaperId;
    private String testPaperName;
    private String userId;
    private String userName;
    private Integer totalScore;
    private Integer passScore;
    private Integer studentScore;
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    public Integer getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(Integer totalScore) {
        this.totalScore = totalScore;
    }

    public Integer getTestPaperId() {
        return testPaperId;
    }

    public void setTestPaperId(Integer testPaperId) {
        this.testPaperId = testPaperId;
    }

    public String getTestPaperName() {
        return testPaperName;
    }

    public void setTestPaperName(String testPaperName) {
        this.testPaperName = testPaperName;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getPassScore() {
        return passScore;
    }

    public void setPassScore(Integer passScore) {
        this.passScore = passScore;
    }

    public Integer getStudentScore() {
        return studentScore;
    }

    public void setStudentScore(Integer studentScore) {
        this.studentScore = studentScore;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    @Override
    public String toString() {
        return "ViewKszxXscj{" +
                "testPaperId=" + testPaperId +
                ", testPaperName='" + testPaperName + '\'' +
                ", userId='" + userId + '\'' +
                ", userName='" + userName + '\'' +
                ", totalScore=" + totalScore +
                ", passScore=" + passScore +
                ", studentScore=" + studentScore +
                ", startTime=" + startTime +
                '}';
    }
}
