package com.glut.dangjian.mapper.authority;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.authority.FunctionRole;
import com.glut.dangjian.entity.authority.UserRole;

/** 
* @author xulankong
* @date 创建时间:  2018年8月24日 下午3:37:13
* @version 1.0
*/
public interface UserRoleMapper {
    
    //  根据角色id删除角色用户表对象
    void deleteRoleUserByRoleId(@Param("roleId") Integer roleId);

    //  根据用户id删除角色用户表对象
    void deleteRoleUserByUserId(@Param("userId") String userId);
    
    // 添加角色用户表对象
    void addUserRoleBatch(@Param("userId") String userId, @Param("roleIds") Integer[] roleIds);
    
}
