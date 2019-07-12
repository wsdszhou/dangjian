package com.glut.dangjian.background.department.service;

import javax.servlet.http.HttpServletRequest;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.department.Bmb;
import com.glut.dangjian.entity.department.Bmry;
import com.glut.dangjian.entity.user.Yhb;

/** 
* @author xulankong
* @date 创建时间:  2018年11月8日 下午9:10:11
* @version 1.0
*/
public interface DepartmentHonorService {

    /**
     * 分页查询
     * @param pageNum
     * @param pageSize
     * @param bmry
     * @return
     */
    PageInfo getDeptHonorListPage(Integer pageNum, Integer pageSize, Bmry bmry);
    
    // 添加部门荣誉
    void addDeptHonor(Bmry bmry, String pictureId, Yhb yhb);

    // 修改部门荣誉
    void editDeptHonor(Bmry bmry);

    //删除部门荣誉
    void deleteDeptHonorBratch(HttpServletRequest request,String[] ids);



}
