package com.glut.dangjian.background.approval.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.approval.service.ApprovalJobService;
import com.glut.dangjian.config.EhcacheConfig;
import com.glut.dangjian.entity.approval.SpRyb;
import com.glut.dangjian.entity.approval.SpSpgwb;
import com.glut.dangjian.entity.approval.view.ViewApprovalJobUser;
import com.glut.dangjian.entity.approval.view.ViewJobUser;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.mapper.approval.ApprovalJobMapper;
import com.glut.dangjian.mapper.approval.ApprovalUserMapper;
import com.glut.dangjian.mapper.approval.view.ViewJobUserMapper;
/**
 * 
 * @author XuLanKong
 *
 */
@Service("approvalJobService")
@Transactional
public class ApprovalJobServiceImpl implements ApprovalJobService {

    @Autowired
    private ApprovalJobMapper approvalJobMapper;
    
    @Autowired
    private ViewJobUserMapper viewJobUserMapper;
    
    @Autowired
    private ApprovalUserMapper approvalUserMapper;
    
    /**
     * 分页查询审批岗位
     */
    @Override
    public PageInfo<SpSpgwb> approvalJobPageList(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<SpSpgwb> spSpgwbs  = approvalJobMapper.approvalJobPageList();       
       return  new PageInfo<SpSpgwb>(spSpgwbs);
    }

    /**
     * 加载审批岗位
     */
    @Override
    @Cacheable(value="approvalJobCache", key="'#root.methodName'+'--'+'#root.methodName'" )
    public List<SpSpgwb> loadApprovalJob() {
        
        return approvalJobMapper.loadApprovalJob();
    }

    /**
     * 添加审批岗位
     */
    @Override
    @CacheEvict(value="approvalJobCache", allEntries=true)
    public void saveApproval(SpSpgwb spgwb) {
        
        approvalJobMapper.insertSelective(spgwb);
        
    }

    /**
     * 修改审批岗位
     */
    @Override
    @CacheEvict(value="approvalJobCache", allEntries=true)
    public void updateApprovalJob(SpSpgwb spgwb) {
        approvalJobMapper.updateByIdSelective(spgwb);
    }

    // 批量删除岗位
    @Override
    @CacheEvict(value="approvalJobCache", allEntries=true)
    public void deleteApprovalJobBatch(String[] jobId) {
        for( String id : jobId) {
            approvalJobMapper.deleteById(Integer.parseInt(id));
        }
        
    }

    /**
     * 获取审批岗位，通过岗位id
     */
    @Override
    public SpSpgwb getJobById(Integer spgwId) {
        return approvalJobMapper.selectById(spgwId);
    }
    
    /**
     * 分页查询审批岗位人员信息
     */
    @Override
    public PageInfo<ViewApprovalJobUser> jobUserPageList(Integer pageNum, Integer pageSize, ViewJobUser viewJobUser) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<ViewApprovalJobUser> list = viewJobUserMapper.jobUserPageList(viewJobUser);
        PageInfo<ViewApprovalJobUser> pageInfo = new PageInfo<ViewApprovalJobUser>(list);
        return pageInfo;
    }

    /**
     * 添加审批用户
     */
    @Override
    @CacheEvict(value="approvalJobUserCache", allEntries=true)
    public Integer saveJobUser(ViewApprovalJobUser viewApprovalJobUser) {
        
        SpRyb spRyb = new SpRyb();
        SpSpgwb spgwb = approvalJobMapper.getJobByName(viewApprovalJobUser.getSpgwSpgwmc());
        spRyb.setSpryYh(new Yhb(viewApprovalJobUser.getUserId()));
        spRyb.setSprySpgwdm(spgwb);
        spRyb.setSpryBmdm(viewApprovalJobUser.getBmId());
        approvalUserMapper.insertSelective(spRyb);
        return spgwb.getSpgwId();
    }

    /**
     * 修改审批岗位
     */
    @Override
    @CacheEvict(value="approvalJobUserCache", allEntries=true)
    public Integer updateApprovalJobUser(ViewApprovalJobUser viewApprovalJobUser) {
        
        SpRyb spRyb = new SpRyb();
        SpSpgwb spgwb = approvalJobMapper.getJobByName(viewApprovalJobUser.getSpgwSpgwmc());
        spRyb.setSpryId(viewApprovalJobUser.getSpryId());
        spRyb.setSpryYh(new Yhb(viewApprovalJobUser.getUserId()));
        spRyb.setSprySpgwdm(spgwb);
        spRyb.setSpryBmdm(viewApprovalJobUser.getBmId());
        approvalUserMapper.updateByIdSelective(spRyb);
        return spgwb.getSpgwId();
    }

    /**
     * 批量删除审批人员信息
     */
    @Override
    @CacheEvict(value="approvalJobUserCache", allEntries=true)
    public void deleteApprovalUserJobBatch(String[] spryIds) {

        int[] ids = new int[spryIds.length];
        for (int i = 0; i < ids.length; i++) {
            ids[i] = Integer.parseInt(spryIds[i]);
        }
        approvalUserMapper.deleteById(ids);
    }

    @Override
    public SpRyb getApprovalUserByUserId(String userId,ViewApprovalJobUser viewApprovalJobUser) {
        // TODO Auto-generated method stub
        SpSpgwb spgwb = approvalJobMapper.getJobByName(viewApprovalJobUser.getSpgwSpgwmc());
        return approvalUserMapper.getApprovalUserByUserId(userId, spgwb.getSpgwId());
    }

    
    
}
