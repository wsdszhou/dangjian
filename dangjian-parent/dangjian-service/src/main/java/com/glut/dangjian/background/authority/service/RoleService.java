package com.glut.dangjian.background.authority.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.authority.Role;
import com.glut.dangjian.entity.user.Yhb;

/** 
* @author xulankong
* @date 创建时间:  2018年8月22日 上午11:19:36
* @version 1.0
*/
public interface RoleService {

    // 分页查询角色
    PageInfo<Role> getRolePageList(Integer pageNum, Integer pageSize, Role role);

    // 添加角色
    void saveRole(Role role, String[] functionIds);

    // 修改角色
    void updateRole(Role role, String[] functionIds);

    // 批量删除角色
    void deleteBatchRole(String[] roleIds);

    // 根据用户获取权限
    List<Role> loadRoleListById(String userId);

    // 用户授权
    void authorityUser(String userId, Integer[] roleIds);


    List<Role> loadRoleListByUserId(String userId);

    List<Role> loadRoleList(Yhb yhb);
}
