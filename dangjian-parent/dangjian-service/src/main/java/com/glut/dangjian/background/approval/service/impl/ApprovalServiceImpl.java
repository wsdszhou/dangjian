package com.glut.dangjian.background.approval.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.approval.service.ApprovalService;
import com.glut.dangjian.entity.approval.SpSplcb;
import com.glut.dangjian.mapper.approval.ApprovalProcessMapper;

@Service("approvalService")
@Transactional
public class ApprovalServiceImpl implements ApprovalService{

    @Autowired
    private ApprovalProcessMapper approvalProcessMapper;
    
    /**
     * 添加审批流程
     */
    @Override
    @CacheEvict(value="approvalProcessCache", allEntries=true)
    public void saveApproval(SpSplcb splcb) {
        
        approvalProcessMapper.insertSelective(splcb);
        
    }

    /**
     * 分页查询审批流程
     */
    @Override
    public PageInfo<SpSplcb> approvalList(Integer pageNum, Integer pageSize) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<SpSplcb> splcbs = approvalProcessMapper.approvalList();
        PageInfo<SpSplcb> pageInfo = new PageInfo<SpSplcb>(splcbs);
        return pageInfo;
    }

    /**
     * 修改审批流程
     */
    @Override
    @CacheEvict(value="approvalProcessCache", allEntries=true)
    public void updateApproval(SpSplcb splcb) {
        
        approvalProcessMapper.updateByIdSelective(splcb);
    }

    
    /**
     * 批量删除审批流程
     */
    @Override
    @CacheEvict(value="approvalProcessCache", allEntries=true)
    public void deleteApprovalBatch(String[] id) {
        int[] ids = new int[id.length];
        for(int i=0; i<id.length; i++) {
            ids[i] = Integer.parseInt(id[i]);
        }
        approvalProcessMapper.deleteBrantch(ids );
    }

    
    /**
     * 加载所有的审批流程
     */
    @Override
    @Cacheable(value="approvalProjectCache", key="#root.methodName")
    public List<SpSplcb> loadApprovalProcess() {
        
        return approvalProcessMapper.loadApprovalProcess();
    }

    
}
