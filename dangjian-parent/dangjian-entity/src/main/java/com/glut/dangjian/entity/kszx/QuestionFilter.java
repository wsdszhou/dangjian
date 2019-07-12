package com.glut.dangjian.entity.kszx;

import java.io.Serializable;

public class QuestionFilter  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    //分页页码
    private int page;
    //分页大小
    private int limit;
    //试题名称
    private String stmc;
    //试题类型
    private String stlx;
    //试题分类
    private int stfl;
    //试题难度
    private String stnd;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public String getStmc() {
        return stmc;
    }

    public void setStmc(String stmc) {
        this.stmc = stmc;
    }

    public String getStlx() {
        return stlx;
    }

    public void setStlx(String stlx) {
        this.stlx = stlx;
    }

    public int getStfl() {
        return stfl;
    }

    public void setStfl(int stfl) {
        this.stfl = stfl;
    }

    public String getStnd() {
        return stnd;
    }

    public void setStnd(String stnd) {
        this.stnd = stnd;
    }



    @Override
    public String toString() {
        return "QuestionFilter{" +
                "page=" + page +
                ", limit=" + limit +
                ", stmc='" + stmc + '\'' +
                ", stlx='" + stlx + '\'' +
                ", stfl=" + stfl +
                ", stnd='" + stnd + '\'' +
                '}';
    }
}
