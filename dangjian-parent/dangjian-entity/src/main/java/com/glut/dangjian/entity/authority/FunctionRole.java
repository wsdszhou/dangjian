package com.glut.dangjian.entity.authority;

import java.io.Serializable;

/** 
* @author xulankong
* @date 创建时间:  2018年8月23日 下午6:06:05
* @version 1.0
*/
public class FunctionRole implements Serializable{

    private static final long serialVersionUID = 1L;

    private Integer functionId;
    
    private Integer roleId;
    
    public FunctionRole() {
        
    }

    public FunctionRole(Integer functionId, Integer roleId) {
        this.functionId = functionId;
        this.roleId = roleId;
    }

    public Integer getFunctionId() {
        return functionId;
    }

    public void setFunctionId(Integer functionId) {
        this.functionId = functionId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    @Override
    public String toString() {
        return "FunctionRole [functionId=" + functionId + ", roleId=" + roleId + "]";
    }
    
    
    
}
