package com.glut.dangjian.mapper.system.view;

import java.util.List;

import com.glut.dangjian.entity.authority.Function;
import com.glut.dangjian.entity.system.view.ViewUserRoleFunction;

public interface ViewUserRoleFunctionMapper {
    int insert(ViewUserRoleFunction record);

    int insertSelective(ViewUserRoleFunction record);

    List<ViewUserRoleFunction> getFunctionAllList();

    List<ViewUserRoleFunction> getFunctionListByUserId(String userId);

    List<Function> getFunctionList(String userId);
}