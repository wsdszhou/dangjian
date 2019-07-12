package com.glut.dangjian.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/** 
* @author xulankong
* @date 创建时间:  2018年8月23日 上午11:40:21
* @version 1.0
* 描述： 用于前端的下拉选择树 
*/
public class ComboTree implements Serializable{
    
    private static final long serialVersionUID = 1L;

    private Integer id;
    
    private String text;
    
    private List<ComboTree> children = new ArrayList<ComboTree>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<ComboTree> getChildren() {
        return children;
    }

    public void setChildren(List<ComboTree> children) {
        this.children = children;
    }
    
    public void addChildrenNode(ComboTree comboTree) {
        children.add(comboTree);
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    @Override
    public String toString() {
        return "ComboTree [id=" + id + ", text=" + text + ", children=" + children + "]";
    }

    
    
    
}
