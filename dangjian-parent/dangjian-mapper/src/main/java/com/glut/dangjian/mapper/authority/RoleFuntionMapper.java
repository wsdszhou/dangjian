package com.glut.dangjian.mapper.authority;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.authority.FunctionRole;
import com.glut.dangjian.entity.authority.Role;

/** 
* @author xulankong
* @date 创建时间:  2018年8月24日 下午3:34:52
* @version 1.0
*/
public interface RoleFuntionMapper {

    // 根据角色id删除功能角色表对象
    void deleteRoleFunctionByRoleId( @Param("id") Integer id);

    //  根据功能id删除功能角色表对象
    void deleteRolefunctionByFunctionId( Integer id);
    
    // 修改功能角色表数据
    void updatRoleFunctionBatch(@Param("role") Role role, @Param("functionIds") String[] functionIds);

    // 添加功能角色关系
    void addRoleFunctionBatch(@Param("roleId")Integer roleId, @Param("functionIds")String[] functionIds);

}
