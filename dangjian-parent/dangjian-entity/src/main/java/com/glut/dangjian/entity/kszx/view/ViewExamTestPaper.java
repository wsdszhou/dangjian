package com.glut.dangjian.entity.kszx.view;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/12/10
 * Time: 6:23 PM
 * 简单的事情重复做，重复的事情坚持做，坚持的事情用心做
 **/
public class ViewExamTestPaper  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    

    //试卷ID
    private int id;
    //试卷标题
    private String name;
    //考试说明
    private String description;
    //试题总数
    private int questionNumber;
    //及格分数
    private int passScore;
    //试卷总分
    private int totalScore;
    //开始时间
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;
    //结束时间
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;
    //考试时长
    private int examTime;

    private int studentScore;

    //组卷方式
    private int generateWay;
    //判断题数量
    private int judgementNum;
    //单选题数量
    private int singleNum;
    //多选题数量
    private int multipleNum;
    //判断题分数
    private int judgementScore;
    //单选题分数
    private int singleScore;
    //多选题分数
    private int multipleScore;
    //试卷状态
    private int status;

    public int getStudentScore() {
        return studentScore;
    }

    public void setStudentScore(int studentScore) {
        this.studentScore = studentScore;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuestionNumber() {
        return questionNumber;
    }

    public void setQuestionNumber(int questionNumber) {
        this.questionNumber = questionNumber;
    }

    public int getPassScore() {
        return passScore;
    }

    public void setPassScore(int passScore) {
        this.passScore = passScore;
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

    public int getExamTime() {
        return examTime;
    }

    public void setExamTime(int examTime) {
        this.examTime = examTime;
    }

    public int getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(int totalScore) {
        this.totalScore = totalScore;
    }

    public int getGenerateWay() {
        return generateWay;
    }

    public void setGenerateWay(int generateWay) {
        this.generateWay = generateWay;
    }

    public int getJudgementNum() {
        return judgementNum;
    }

    public void setJudgementNum(int judgementNum) {
        this.judgementNum = judgementNum;
    }

    public int getSingleNum() {
        return singleNum;
    }

    public void setSingleNum(int singleNum) {
        this.singleNum = singleNum;
    }

    public int getMultipleNum() {
        return multipleNum;
    }

    public void setMultipleNum(int multipleNum) {
        this.multipleNum = multipleNum;
    }

    public int getJudgementScore() {
        return judgementScore;
    }

    public void setJudgementScore(int judgementScore) {
        this.judgementScore = judgementScore;
    }

    public int getSingleScore() {
        return singleScore;
    }

    public void setSingleScore(int singleScore) {
        this.singleScore = singleScore;
    }

    public int getMultipleScore() {
        return multipleScore;
    }

    public void setMultipleScore(int multipleScore) {
        this.multipleScore = multipleScore;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ViewExamTestPaper{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", questionNumber=" + questionNumber +
                ", passScore=" + passScore +
                ", totalScore=" + totalScore +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", examTime=" + examTime +
                ", studentScore=" + studentScore +
                ", generateWay=" + generateWay +
                ", judgementNum=" + judgementNum +
                ", singleNum=" + singleNum +
                ", multipleNum=" + multipleNum +
                ", judgementScore=" + judgementScore +
                ", singleScore=" + singleScore +
                ", multipleScore=" + multipleScore +
                ", status=" + status +
                '}';
    }
}
