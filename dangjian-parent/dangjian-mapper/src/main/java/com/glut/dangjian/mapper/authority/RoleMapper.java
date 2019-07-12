package com.glut.dangjian.mapper.authority;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.authority.FunctionRole;
import com.glut.dangjian.entity.authority.Role;
import com.glut.dangjian.entity.authority.UserRole;

public interface RoleMapper {
    int deleteById(Integer jsId);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectById(Integer jsId);

    int updateByIdSelective(Role record);

    int updateById(Role record);

    // 分页查询角色
    List<Role> getRolePageList(Role role);

    // 根据名称获取id
    Integer getIdByName(@Param("jsMc") String jsMc);

    // 根据用户userId加载所有的角色
    List<Role> loadRoleListById(@Param("userId") String userId);
    
    // 获取所有角色根据用户userId
    List<Role> getRoleListById(@Param("userId") String userId);
    
    // 获取所有角色
    List<Role> getRoleAllList();

    List<Role> loadRoleListByUserId(String userId);

    List<Role> getRoleCodeAllList();

    void deleteBatchById(@Param("ids")  int[] ids);

}