package com.glut.dangjian.background.dues.service.impl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.dues.service.DuesBranchService;
import com.glut.dangjian.entity.dues.DuesBranch;
import com.glut.dangjian.entity.dues.view.ViewDuesCollegeBranch;
import com.glut.dangjian.mapper.dues.DuesBranchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("dueBranchService")
public class DuesBranchServiceImpl implements DuesBranchService {

    @Autowired
    private DuesBranchMapper duesBranchMapper;


    @Override
    public DuesBranch getBranchById(Integer branchId){
        return duesBranchMapper.selectById(branchId);
    }

    @Override
    public PageInfo<ViewDuesCollegeBranch> duesBranchPageList(Integer pageNum, Integer pageSize,Integer collegeId){
        PageHelper.startPage(pageNum, pageSize);
        List<ViewDuesCollegeBranch> list = duesBranchMapper.duesBranchPageList(collegeId);
        PageInfo<ViewDuesCollegeBranch> pageInfo = new PageInfo<ViewDuesCollegeBranch>(list);
        return pageInfo;
    }
}
