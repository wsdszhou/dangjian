package com.glut.dangjian.service.department;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.branch.Zbry;
import com.glut.dangjian.entity.department.Bmry;
import com.glut.dangjian.entity.department.view.ViewDepartment;
import com.glut.dangjian.entity.user.Yhb;

/** 
* @author xulankong
* @date 创建时间:  2018年12月23日 下午3:09:29
* @version 1.0
*/
public interface DepartMentFrontService {

    // 部门详细信息
    ViewDepartment getDeptInfo(Yhb yhb);

    // 荣誉列表
    PageInfo<Bmry> getDeptHonorPageList(Integer pageNum, Integer pageSize);

    // 荣誉详细信息
    Bmry getDeptHonorByHonorid(String honorId);

}
