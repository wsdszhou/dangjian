package com.glut.dangjian.pojo;

import java.io.Serializable;
import java.util.List;

/**
 * 封装分页属性
 * @author zhaoqx
 *
 *///delete
public class PageBean implements Serializable{
    
    private static final long serialVersionUID = 1L;

    private long total;//总记录数
	
	private List rows;//当前页需要展示的数据集合
	
    public PageBean() {
        super();
    }
    
    public PageBean(long total, List rows) {
        super();
        this.total = total;
        this.rows = rows;
    }
    public long getTotal() {
        return total;
    }
    public void setTotal(long total) {
        this.total = total;
    }
    public List getRows() {
        return rows;
    }
    public void setRows(List rows) {
        this.rows = rows;
    }
    @Override
    public String toString() {
        return "PageBean [total=" + total + ", rows=" + rows + "]";
    }
	
	
}
