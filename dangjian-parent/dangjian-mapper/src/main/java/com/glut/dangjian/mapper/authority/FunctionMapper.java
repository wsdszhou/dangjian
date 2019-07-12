package com.glut.dangjian.mapper.authority;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.authority.Function;
import com.glut.dangjian.entity.authority.FunctionRole;

public interface FunctionMapper {
    
    // 删除模块信息
    int deleteById(Integer mkId);

    // 添加模块信息 
    int insert(Function record);

    // 添加模块信息，并且判断是否为空 
    int insertSelective(Function record);

    // 根据id查询模块信
    Function selectById(Integer mkId);

    // 改模块信息，并且判断是否为空
    int updateByIdSelective(Function record);

    // 改模块信息
    int updateById(Function record);

    // 获取模块列表
    List<Function> getFunctionListByuserId(String userId);

    // 分页查询模块
    List<Function> getFunctionPageList(Function function);

    // 获取全部的功能模块
    List<Function> getFunctionAllList();

    List<FunctionRole> loadFunctonListByRoleId(@Param("roleId") Integer roleId);

    List<String> getFunctionListByUserId();
    
    List<Function>  getFunctionList();

    List<Function> getFunctionCodeListByuserId(String userId);

}