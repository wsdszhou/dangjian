package com.glut.dangjian.entity.view;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/9/25
 * Time: 21:20
 */

public class ViewKslb  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private String name;
    private int num;
    private Date datatime;
    private int status;
    private int time;
    private int select;
    private int question;
    private String path;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public Date getDatatime() {
        return datatime;
    }

    public void setDatatime(Date datatime) {
        this.datatime = datatime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public int getSelect() {
        return select;
    }

    public void setSelect(int select) {
        this.select = select;
    }

    public int getQuestion() {
        return question;
    }

    public void setQuestion(int question) {
        this.question = question;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Override
    public String toString() {
        return "ViewKslb{" +
                "name='" + name + '\'' +
                ", num=" + num +
                ", datatime=" + datatime +
                ", status=" + status +
                ", time=" + time +
                ", select=" + select +
                ", question=" + question +
                ", path='" + path + '\'' +
                '}';
    }
}
