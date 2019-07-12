package com.glut.dangjian.service.department.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.department.Bmry;
import com.glut.dangjian.entity.department.view.ViewDepartment;
import com.glut.dangjian.entity.news.view.ViewNews;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.mapper.background.department.DepartmentHonorMapper;
import com.glut.dangjian.mapper.department.view.ViewDepartmentMapper;
import com.glut.dangjian.service.department.DepartMentFrontService;

/** 
* @author xulankong
* @date 创建时间:  2018年12月23日 下午3:09:39
* @version 1.0
*/
@Service
@Transactional(propagation=Propagation.NESTED)
public class DepartMentFrontServiceImpl implements DepartMentFrontService{

    @Autowired
    private ViewDepartmentMapper viewDepartmentMapper;
    
    @Autowired
    private  DepartmentHonorMapper departmentHonorMapper;
    
    /**
     *  部门详细信息
     */
    @Override
    public ViewDepartment getDeptInfo(Yhb yhb) {
        
        return viewDepartmentMapper.getDeptInfoByUserId(yhb.getUserId());
    }

    /**
     * 荣誉列表
     */
    @Override
    public PageInfo<Bmry> getDeptHonorPageList(Integer pageNum, Integer pageSize) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<Bmry> bmrys = departmentHonorMapper.getDeptHonorPageList();
        return new PageInfo<Bmry>(bmrys);
    }

    /**
     * 荣誉详细信息
     */
    @Override
    public Bmry getDeptHonorByHonorid(String honorId) {
        
        return departmentHonorMapper.getDeptHonorByHonorid(honorId);
    }

}
