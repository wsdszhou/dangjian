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
import com.glut.dangjian.background.approval.service.ApprovalNodeService;
import com.glut.dangjian.entity.approval.SpSpjdb;
import com.glut.dangjian.entity.approval.view.ViewApprovalNode;
import com.glut.dangjian.mapper.approval.ApprovalNodeMapper;
import com.glut.dangjian.mapper.approval.view.ViewApprovalNodeMapper;


/**
 * 
 * @author XuLanKong
 *
 */
@Service("ApprovalNodeService")
@Transactional
public class ApprovalNodeServiceImpl implements  ApprovalNodeService {

    @Autowired
    private ViewApprovalNodeMapper viewApprovalNodeMapper;
    
    @Autowired
    private ApprovalNodeMapper approvalNodeMapper;
    
    /**
     * 分页查询审批节点
     */
    @Override
    //@Cacheable(value="approvalNodeCache", key="'#p0'+'--'+'#p1'+'--'+'#root.methodName'+'#p2'" )
    public PageInfo<ViewApprovalNode> nodePageListBySplcId(Integer pageNum, Integer pageSize, Integer splcId) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<ViewApprovalNode> viewApprovalNodes = viewApprovalNodeMapper.nodePageListBySplcId(splcId);
        return new PageInfo<ViewApprovalNode>(viewApprovalNodes);
    }

    /**
     * 加载审批流程的所有节点
     * @param splcId
     * @return
     */
    @Override
    @Cacheable(value="approvalNodeCache", key="'#p0'+'#root.methodName'" )
    public List<SpSpjdb> loadNodeApprovalBySplcId(Integer splcId) {
        return approvalNodeMapper.loadNodeApprovalBySplcId(splcId);
    }

    /**
     * 保存审批节点
     */
    @Override
    @CacheEvict(value="approvalNodeCache", allEntries=true)
    public void saveApprovalNode(SpSpjdb spjdb) {

       SpSpjdb endNode = null;
       SpSpjdb fisrt = null;
       SpSpjdb prevNode = null;
       SpSpjdb nextNode = null;
       int approvalProcessId = spjdb.getSpjdLcdm().getSplcId();
       // 关联下一节点
       if (spjdb.getSpjdXyspjddm() != null && spjdb.getSpjdXyspjddm().getSpjdId() != null) {
           // 获取下一个审批节点的对象
           nextNode = approvalNodeMapper.selectById(spjdb.getSpjdXyspjddm().getSpjdId());
           if (nextNode != null) {
               // 获取上一个审批节点
               prevNode = approvalNodeMapper.getApprovalPrevNodeById(nextNode.getSpjdId());
               // 设置下级审批节点名称
               spjdb.setSpjdXyjdmc(nextNode.getSpjdMc());
               // 获取首节点
               fisrt = approvalNodeMapper.getFirstNodeByApprovalProcessId(approvalProcessId);
               // 当下节点为首节点是时，设置当前节点为首节点
               if (fisrt != null && fisrt.getSpjdId() != null) {
                   if ( fisrt.getSpjdId().equals(nextNode.getSpjdId()) ) {
                       spjdb.setSpjdIsFirst(1);
                       nextNode.setSpjdIsFirst(0);
                   } else {
                       nextNode.setSpjdIsFirst(null);
                   }
               }
           }
       }
       
       // 保存本节点 
       approvalNodeMapper.insertSelective(spjdb);
       spjdb = approvalNodeMapper.getApprovalNodeByNodeName(spjdb.getSpjdMc());
       // 关联上一节点
       if( prevNode != null) {  // 有上一节点
            prevNode.setSpjdXyspjddm(new SpSpjdb(spjdb.getSpjdId()));
            prevNode.setSpjdXyjdmc(spjdb.getSpjdMc());
       } else {  
           
            // 没有上一节点,设置当前节点为末节点
            // 获取当前审批流程的末节点
            endNode = approvalNodeMapper.getEndNodeByApprovalProcessId(approvalProcessId);
            if (nextNode == null) {
                if (endNode != null) {
                    // 改变以前的首节点 
                    endNode.setSpjdXyspjddm(spjdb);
                    endNode.setSpjdXyjdmc(spjdb.getSpjdMc());
                    spjdb.setSpjdXyspjddm(new SpSpjdb(0));
                } else {
                    // 没有前节点，并且没有末节点,设置为首节点
                    spjdb.setSpjdXyspjddm(new SpSpjdb(0));
                    spjdb.setSpjdXyjdmc(null);
                    spjdb.setSpjdIsFirst(1);
                }
            }
        }
        approvalNodeMapper.updateprevNodeAndCurrentNodeAndnextNode(prevNode, spjdb, endNode, nextNode);
    }

    /**
     *  修改审批节点信息
     */
    @Override
    @CacheEvict(value="approvalNodeCache", allEntries=true)
    public void updateApprovalNodeInformat(SpSpjdb spjdb) {
        System.err.println(spjdb);
        SpSpjdb prevNode = null;
        SpSpjdb nextNode = null;
        prevNode = approvalNodeMapper.getApprovalPrevNodeById(spjdb.getSpjdId());
        if (prevNode != null) {
            prevNode.setSpjdXyjdmc(spjdb.getSpjdMc());
        }
        approvalNodeMapper.updateAndPrevNode(spjdb, prevNode);
    }

    /**
     * 批量删除审批节点
     */
    @Override
    @CacheEvict(value="approvalNodeCache", allEntries=true)
    public void deleteApprovalBatch(Integer nodeId, Integer processId) {
        SpSpjdb spjdb = approvalNodeMapper.selectById(nodeId);
        SpSpjdb prevNode = null;
        SpSpjdb nextNode = null; 
        // 删除是首节点
        if (spjdb != null && spjdb.getSpjdIsFirst() == 1) {
            // 设置下一个节点为第一个节点
            nextNode = approvalNodeMapper.getApprovalNextNodeById( spjdb.getSpjdId());
            if (nextNode != null) {
                nextNode.setSpjdIsFirst(1);
            }
            approvalNodeMapper.deleteFirstNode(spjdb.getSpjdId(),nextNode);
            return;
        } 
     
        // 删除的是中间节点
        if ( spjdb != null && spjdb.getSpjdXyjdmc() != null) {
            nextNode =  approvalNodeMapper.getApprovalNextNodeById( spjdb.getSpjdId() );
            prevNode = approvalNodeMapper.getApprovalPrevNodeById(spjdb.getSpjdId());
            prevNode.setSpjdXyjdmc(nextNode.getSpjdMc());
            prevNode.setSpjdXyspjddm(nextNode);
            approvalNodeMapper.deleteMidNode(spjdb.getSpjdId(), prevNode);
            return ;
        }
        
        // 删除末节点
        if (spjdb != null && spjdb.getSpjdXyjdmc() == null) {
            prevNode = approvalNodeMapper.getApprovalPrevNodeById(spjdb.getSpjdId());
            prevNode.setSpjdXyjdmc(null);
            prevNode.setSpjdXyspjddm(new SpSpjdb(0));
            approvalNodeMapper.deleteEndNode(spjdb.getSpjdId(), prevNode);
            return ;
        }
       
    }

}
