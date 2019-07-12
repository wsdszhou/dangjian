package com.glut.dangjian.entity.kszx.view;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/12/10
 * Time: 8:18 PM
 * 简单的事情重复做，重复的事情坚持做，坚持的事情用心做
 **/
public class ViewExamQuestionOption  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private int num;
    private String value;

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "ViewExamQuestionOption{" +
                "num=" + num +
                ", value='" + value + '\'' +
                '}';
    }
}
