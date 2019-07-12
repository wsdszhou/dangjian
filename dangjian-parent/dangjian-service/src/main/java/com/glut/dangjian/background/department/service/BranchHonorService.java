package com.glut.dangjian.background.department.service;

import javax.servlet.http.HttpServletRequest;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.branch.Zbry;
import com.glut.dangjian.entity.department.Bmry;
import com.glut.dangjian.entity.user.Yhb;

public interface BranchHonorService {

    /**
     * 分页查询
     * @param pageNum
     * @param pageSize
     * @param zbry
     * @return
     */
    PageInfo getBranchHonorPageList(Integer pageNum, Integer pageSize, Zbry  zbry);

    // 添加部门荣誉
    void addBranchHonor(Zbry  zbry, String pictureId, Yhb yhb);

    // 修改部门荣誉
    void editBranchHonor(Zbry  zbry);

    //删除部门荣誉
    void deleteBranchHonorBratch(HttpServletRequest request, String[] ids);



}
