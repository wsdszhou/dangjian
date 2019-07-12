package com.glut.dangjian.service.department.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.branch.Zbry;
import com.glut.dangjian.entity.branch.view.ViewBranch;
import com.glut.dangjian.entity.branch.view.ViewBranchUser;
import com.glut.dangjian.entity.department.Bmry;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.mapper.background.branch.BranchHonorMapper;
import com.glut.dangjian.mapper.branch.view.ViewBranchMapper;
import com.glut.dangjian.mapper.branch.view.ViewBranchUserMapper;
import com.glut.dangjian.service.department.BranchFrontService;

/** 
* @author xulankong
* @date 创建时间:  2018年12月23日 下午3:31:25
* @version 1.0
*/
@Service
@Transactional(propagation=Propagation.NESTED)
public class BranchFrontServiceImpl implements BranchFrontService{

    @Autowired
    private ViewBranchUserMapper viewBranchUserMapper;
    
    @Autowired
    private ViewBranchMapper viewBranchMapper;
    
    @Autowired
    private BranchHonorMapper branchHonorMapper;
    
    /**
     * 获取支部人员信息
     */
    @Override
    //@Cacheable(value="branchCache", key="'#p0.getUserId()'+'--'+'#root.methodName'"  )
    public  List<ViewBranchUser> getBranchUserInfo(Yhb yhb) {
        
        return viewBranchUserMapper.getBranchUserInfoByuserid(yhb.getUserId());
    }

    /**
     * 获取支部信息
     */
    @Override
    @Cacheable(value="branchCache", key="'#p0.getUserId()'+'--'+'#root.methodName'"  )
    public ViewBranch getBranchInfo(Yhb yhb) {
        
        return viewBranchMapper.getBranchInfoByUserid(yhb.getUserId());
    }

    /**
     * 获取荣誉列表
     */
    @Override
    public PageInfo<Zbry> getBranchHonorPageList(Integer pageNum, Integer pageSize) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<Zbry> bmrys = branchHonorMapper.getBranchHonorPageList();
        return new PageInfo<Zbry>(bmrys);
    }

    /**
     * 获取单个荣誉信息
     */
    @Override
    @Cacheable(value="branchHonorCache", key="'#p0'+'--'+'#root.methodName'"  )
    public Zbry getBranchHonorByHonorid(String honorId) {
        
        return branchHonorMapper.getBranchHonorByHonorid(honorId);
    }

}
