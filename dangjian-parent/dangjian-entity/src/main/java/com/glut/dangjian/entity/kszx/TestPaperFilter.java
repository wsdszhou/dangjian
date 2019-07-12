package com.glut.dangjian.entity.kszx;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/11/8
 * Time: 8:59 PM
 * 简单的事情重复做，重复的事情坚持做，坚持的事情用心做
 **/
public class TestPaperFilter  implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private int page;
    private int limit;

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


    @Override
    public String toString() {
        return "TestPaperFilter{" +
                "page=" + page +
                ", limit=" + limit +
                '}';
    }
}
