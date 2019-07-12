package com.glut.dangjian.entity.authority;

import java.io.Serializable;

/** 
* @author xulankong
* @date 创建时间:  2018年8月23日 下午6:06:16
* @version 1.0
*/
public class UserRole implements Serializable{

    private static final long serialVersionUID = 1L;

    public Integer roleId;
    
    private String userId;
    
    public UserRole(Integer roleId, String userId) {
        super();
        this.roleId = roleId;
        this.userId = userId;
    }

    public UserRole() {
        
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    
    
    
    
    
}
