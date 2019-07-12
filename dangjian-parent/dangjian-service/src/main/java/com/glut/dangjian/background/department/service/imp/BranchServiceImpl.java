package com.glut.dangjian.background.department.service.imp;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.department.service.BranchService;
import com.glut.dangjian.entity.branch.ZbLxb;
import com.glut.dangjian.entity.branch.Zbb;
import com.glut.dangjian.mapper.background.branch.BranchMapper;
import com.glut.dangjian.mapper.branch.view.ViewBranchMapper;

@Service
@Transactional(propagation=Propagation.NESTED)
public class BranchServiceImpl implements BranchService{

    @Autowired
    private BranchMapper branchMapper;
    
    @Autowired
    ViewBranchMapper viewBranchMapper;
    
    /**
     * 根据用户id获取支部在部门支部
     * @param userId
     * @return
     */
    @Override
    @Cacheable(value="branchCache", key="'#p0'+'#root.methodName'" )
    public List<Zbb> getZbbListByUserId(String userId) {
        
        return branchMapper.getZbListByUserId(userId);
    }

    /**
     * 加载支部类型
     */
    @Override
    @Cacheable(value="branchCache", key="#root.methodName" )
    public List<ZbLxb> loadBranchTypeList() {
        
        return branchMapper.loadBranchTypeList();
    }

    /**
     * 加载所有支部
     */
    @Override
    @Cacheable(value="branchCache", key="#root.methodName" )
    public List<Zbb> loadBranchAllList() {
        
        return branchMapper.loadBranchAllList();
    }

    /**
     * 
     */
    @Override
    @Cacheable(value="branchCache", key="'#p0'+'#p1'+'#root.methodName'" )
    public List<Zbb> loadBranchByDepartmentAndBranchTypeList(Integer deptId, Integer branchTypeId) {
        
        return branchMapper.loadBranchByDepartmentAndBranchTypeList(deptId, branchTypeId);
    }

    @Override
    @Cacheable(value="branchCache", key="'#p0'+'#root.methodName'" )
    public List<Zbb> loadBranchByDepartmentList(Integer deptId) {
        
        return branchMapper.loadBranchByDepartmentList(deptId);
    }

    /**
     * 获取所以支部
     */
    @Override
    @Cacheable(value="branchCache", key="#root.methodName" )
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

    /**
     * 分页查询支部
     */
    @Override
    public PageInfo getBranchPageList(Integer pageNum, Integer pageSize, Zbb zbb) {
        PageHelper.startPage(pageNum,pageSize);
        List<Zbb> list = viewBranchMapper.getBranchPageList(zbb);
        return new PageInfo<>(list);
    }

    /**
     * 添加支部
     */
    @Override
    @CacheEvict(value="branchCache", allEntries=true)
    public void addBranch(Zbb zbb) {
        zbb.setZbXgsj(new Date());
        branchMapper.insertSelective(zbb);
    }

    /**
     * 修改支部信息
     */
    @Override
    @CacheEvict(value="branchCache", allEntries=true)
    public void editBranch(Zbb zbb) {
        zbb.setZbXgsj(new Date());
        branchMapper.updateByPrimaryKeySelective(zbb);
    }

    /**
     * 批量删除支部
     */
    @Override
    @CacheEvict(value="branchCache", allEntries=true)
    public void deleteBranchBatch(String[] ids) {
        int[] branchIds = new int[ids.length]; 
        for(int i=0; i<ids.length; i++) {
            branchIds[i] = Integer.parseInt(ids[i]);
        }
        branchMapper.deleteBranchBatch(branchIds);
    }

    /**
     *  加载支部信息根据部门
     */
    @Override
    //@Cacheable(value="branchCache", key="'#p0'+'#root.methodName'" )
    public List<Zbb> loadBranch(Integer deptId) {
        return branchMapper.loadBranchByDepartmentList(deptId);
    }

    /**
     * 根据id获取支部信息
     */
    @Override
    //@Cacheable(value="branchCache", key="'#p0'+'#root.methodName'" )
    public Zbb getBranchById(Integer branchId) {
        
        return branchMapper.selectByPrimaryKey(branchId);
    }

    
}
