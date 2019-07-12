package com.glut.dangjian.background.authority.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.authority.Function;
import com.glut.dangjian.entity.authority.FunctionRole;
import com.glut.dangjian.entity.user.Yhb;

/** 
* @author xulankong
* @date 创建时间:  2018年8月23日 上午9:26:53
* @version 1.0
*/
public interface FunctionService {

    // 分页查询功能模块
    PageInfo<Function> getFunctionPageList(Integer pageNum, Integer pageSize, Function function);

    // 获取全部的功能模块
    List<Function> getFunctionAllList();

    // 保存功能模块
    void saveFunction(Function function);

    // 修改功能模块权限
    void updateFunction(Function function);

    // 批量删除功能模块权限
    void deleteBacthFunction(String[] mkIds);

    List<FunctionRole> loadFunctonListByRoleId(Integer roleId);

    // 获取用户功能模块
    List<Function> getFunctionList(Yhb yhb);



}
