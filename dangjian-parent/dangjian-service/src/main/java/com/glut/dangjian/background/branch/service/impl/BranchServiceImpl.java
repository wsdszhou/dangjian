package com.glut.dangjian.background.branch.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.glut.dangjian.background.branch.service.BranchService;
import com.glut.dangjian.entity.branch.ZbLxb;
import com.glut.dangjian.entity.branch.Zbb;
import com.glut.dangjian.mapper.background.branch.BranchMapper;

@Service("zbService")
@Transactional(propagation=Propagation.NESTED)
public class BranchServiceImpl implements BranchService{

    @Autowired
    private BranchMapper branchMapper;

    /**
     * 根据用户id获取支部在部门支部
     * @param userId
     * @return
     */
    @Override
    public List<Zbb> getZbbListByUserId(String userId) {
        // TODO Auto-generated method stub
        return branchMapper.getZbListByUserId(userId);
    }

    /**
     * 加载支部类型
     */
    @Override
    public List<ZbLxb> loadBranchTypeList() {
        
        return branchMapper.loadBranchTypeList();
    }

    /**
     * 加载所有支部
     */
    @Override
    public List<Zbb> loadBranchAllList() {
        
        return branchMapper.loadBranchAllList();
    }

    /**
     * 
     */
    @Override
    public List<Zbb> loadBranchByDepartmentAndBranchTypeList(Integer deptId, Integer branchTypeId) {
        
        return branchMapper.loadBranchByDepartmentAndBranchTypeList(deptId, branchTypeId);
    }

    @Override
    public List<Zbb> loadBranchByDepartmentList(Integer deptId) {
        
        return branchMapper.loadBranchByDepartmentList(deptId);
    }

    @Override
    public Map<String, Integer> getAll() {
        List<Zbb> zbbs = branchMapper.loadBranchAllList();
        Map<String, Integer> map = new HashMap<String, Integer>();
        Iterator iterator = zbbs.iterator();
        Zbb zbb = null;
        while(iterator.hasNext()) {
            zbb = (Zbb) iterator.next();
            map.put(zbb.getZbMc(), zbb.getZbId());
        }
        return map;
    }

    
}
