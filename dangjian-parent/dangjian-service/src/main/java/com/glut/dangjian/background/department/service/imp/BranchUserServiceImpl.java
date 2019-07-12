package com.glut.dangjian.background.department.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.department.service.BranchUserService;
import com.glut.dangjian.entity.branch.Zbb;
import com.glut.dangjian.entity.branch.view.ViewBranchUser;
import com.glut.dangjian.mapper.branch.view.ViewBranchUserMapper;

/** 
* @author xulankong
* @date 创建时间:  2018年11月14日 下午4:23:36
* @version 1.0
*/
@Service
@Transactional(propagation=Propagation.NESTED)
public class BranchUserServiceImpl implements BranchUserService {

    @Autowired
    ViewBranchUserMapper viewBranchUserMapper;
    
    /**
     * 分页查询支部用户信息
     */
    @Override
    public PageInfo getBranchUserPageList(Integer pageNum, Integer pageSize, ViewBranchUser viewBranchUser, Integer branchId) {
        // TODO Auto-generated method stub
        PageHelper.startPage(pageNum, pageSize);
        List<ViewBranchUser> viewBranchUsers = viewBranchUserMapper.getBranchUserPageList(viewBranchUser, branchId);
        return new PageInfo<ViewBranchUser>(viewBranchUsers);
    }

}
