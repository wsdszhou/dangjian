package com.glut.dangjian.background.department.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.branch.ZbLxb;
import com.glut.dangjian.entity.branch.Zbb;

/**
 * 
 * @author lanlan
 *
 */
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

    // 获取所有支部
    public Map<String, Integer> getAll();

    // 分页查询支部
    public PageInfo getBranchPageList(Integer pageNum, Integer pageSize, Zbb zbb);

    // 添加支部
    public void addBranch(Zbb zbb);

    // 修改支部
    public void editBranch(Zbb zbb);

    // 删除支部
    public void deleteBranchBatch(String[] ids);

    // 加载支部信息根据部门
    public List<Zbb> loadBranch(Integer deptId);

    // 根据id获取支部信息
    public Zbb getBranchById(Integer branchId);
}
