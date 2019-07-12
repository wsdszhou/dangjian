package com.glut.dangjian.background.branch.service;

import java.util.List;
import java.util.Map;

import com.glut.dangjian.entity.branch.ZbLxb;
import com.glut.dangjian.entity.branch.Zbb;

public interface BranchService {

    /**
     * 根据用户id获取支部在部门支部
     * @param userId
     * @return
     */
    public List<Zbb> getZbbListByUserId(String userId);

    /**
     * 加载支部类型
     * @return
     */
    public List<ZbLxb> loadBranchTypeList();

    /**
     * 加载所有支部
     * @return
     */
    public List<Zbb> loadBranchAllList();

    
    /**
     * 根据部门和支部类型加载支部列表
     * @param deptId
     * @param branchTypeId
     * @return
     */
    public List<Zbb> loadBranchByDepartmentAndBranchTypeList(Integer deptId, Integer branchTypeId);

    /**
     * 根据部门加载支部列表
     * @param deptId
     * @param branchTypeId
     * @return
     */
    public List<Zbb> loadBranchByDepartmentList(Integer deptId);

    public Map<String, Integer> getAll();
}
