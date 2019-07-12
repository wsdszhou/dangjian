package com.glut.dangjian.entity.kszx.view;

import java.io.Serializable;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/12/10
 * Time: 8:06 PM
 * 简单的事情重复做，重复的事情坚持做，坚持的事情用心做
 **/
public class ViewExamQuestion  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    //试题ID
    private int id;
    //题目
    private String name;
    //试题类型
    private String type;
    //试题解析
    private String analyze;
    //答案
    private String answer;
    //选项
    private List<ViewExamQuestionOption> options;

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAnalyze() {
        return analyze;
    }

    public void setAnalyze(String analyze) {
        this.analyze = analyze;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public List<ViewExamQuestionOption> getOptions() {
        return options;
    }

    public void setOptions(List<ViewExamQuestionOption> options) {
        this.options = options;
    }

    @Override
    public String toString() {
        return "ViewExamQuestion{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", analyze='" + analyze + '\'' +
                ", answer='" + answer + '\'' +
                ", options=" + options +
                '}';
    }
}
