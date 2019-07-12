package com.glut.dangjian.service.party.imp;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.glut.dangjian.background.approval.service.ApprovalProjectService;
import com.glut.dangjian.config.ApprovalTypeConfig;
import com.glut.dangjian.entity.approval.SpLcxmb;
import com.glut.dangjian.entity.approval.SpSpjdb;
import com.glut.dangjian.entity.approval.SpSplcb;
import com.glut.dangjian.entity.approval.view.ViewApprovalNode;
import com.glut.dangjian.entity.other.PartyInfo;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewPartyinfo;
import com.glut.dangjian.mapper.approval.ApprovalProcessProjectMapper;
import com.glut.dangjian.mapper.approval.view.ViewApprovalNodeMapper;
import com.glut.dangjian.mapper.background.other.PartyInfoMapper;
import com.glut.dangjian.mapper.background.other.PartyJobMapper;
import com.glut.dangjian.mapper.notice.view.ViewNoticeMapper;
import com.glut.dangjian.mapper.other.view.ViewPartyinfoMapper;
import com.glut.dangjian.service.party.PartyFrontService;
import com.glut.dangjian.utils.StringTools;

/** 
* @author xulankong
* @date 创建时间:  2018年12月23日 上午10:06:39
* @version 1.0
*/
@Service
@Transactional(propagation=Propagation.NESTED)
public class PartyFrontServiceImpl implements PartyFrontService {

    @Autowired
    private PartyInfoMapper partyInfoMapper;
    
    @Autowired
    private ViewPartyinfoMapper viewPartyinfoMapper;
    
    @Autowired
    private ViewApprovalNodeMapper  viewApprovalNodeMapper;

    @Autowired
    private ViewNoticeMapper viewNoticeMapper;
    
    @Autowired
    private ApprovalProjectService approvalProjectService;

    @Autowired
    private ApprovalProcessProjectMapper approvalProcessProjectMapper;
    
    /**
     * 获取党籍信息
     */
    @Override
    public ViewPartyinfo getParty(Yhb yhb) {
        
        return viewPartyinfoMapper.getParty(yhb.getUserId());
    }

    /**
     * 添加一个党籍信息
     */
    @Override
    @CacheEvict(value="partyCache", allEntries=true)
    public void saveParty(PartyInfo partyInfo) {
        
        partyInfo.setId(StringTools.getUUID());
        //获取党籍审批的第一个节点
        ViewApprovalNode viewApprovalNode = viewApprovalNodeMapper.getFirstNodeIdByApprovalProcessName(ApprovalTypeConfig.PARTINFOAPPROVAL);
        // 判断是否已经提交了审批
        SpLcxmb hasSpLcxmb = viewNoticeMapper.getNoApprovalNoticeObjectByUserIdAndApprovaltype(partyInfo.getYhdm().getUserId(), ApprovalTypeConfig.PARTINFOAPPROVAL);

        if (hasSpLcxmb != null) {
            partyInfoMapper.deleteNoApprovalBySpLcxmbId(hasSpLcxmb.getLcxmId(), partyInfo.getYhdm().getUserId(), null);
        }
        /**
         * 封装审批项目对象
         */
        SpLcxmb spLcxmb =  new SpLcxmb(
                StringTools.getUUID(), 
                ApprovalTypeConfig.PARTINFOAPPROVAL, 
                new SpSplcb(viewApprovalNode.getSplcId()), 
                ApprovalTypeConfig.PARTINFOAPPROVAL, 
                new SpSpjdb( viewApprovalNode.getSpjdId()),  
                0, 
                0, 
                new Date(),
                partyInfo.getId()   // 审批对象id
                );
        // 添加通知新闻审批
        approvalProjectService.addApprovalProject(spLcxmb, new Yhb(partyInfo.getYhdm().getUserId()),  null, 0 );
        partyInfoMapper.insertSelective(partyInfo);
    }

    /**
     * 修改党籍信息
     */
    @Override
    @CacheEvict(value="partyCache", allEntries=true)
    public void updateParty(PartyInfo partyInfo) {
        
        ViewApprovalNode viewApprovalNode = viewApprovalNodeMapper.getFirstNodeIdByApprovalProcessName(ApprovalTypeConfig.PARTINFOAPPROVAL);
        String userId = partyInfoMapper.getUserIdByPartyInfoId(partyInfo.getId());
        // 判断是否已经提交了审批
        SpLcxmb hasSpLcxmb = approvalProcessProjectMapper.getNoApprovalPartByObjectId(partyInfo.getId());
        if (hasSpLcxmb != null) {
            partyInfoMapper.deleteNoApprovalBySpLcxmbId(hasSpLcxmb.getLcxmId(), null, null);
        }
        partyInfo.setResult(0);
        /**
         * 封装审批项目对象
         */
        SpLcxmb spLcxmb =  new SpLcxmb(
                StringTools.getUUID(), 
                "党籍修改信息审批", 
                new SpSplcb(viewApprovalNode.getSplcId()), 
                "党籍修改信息审批", 
                new SpSpjdb( viewApprovalNode.getSpjdId()),  
                0, 
                0, 
                new Date(),
                partyInfo.getId()   // 审批对象id
                );
        // 添加通知新闻审批
        approvalProjectService.addApprovalProject(spLcxmb, new Yhb(userId),  null, 0 );
        partyInfoMapper.update(partyInfo);
    }

    /**
     * 取消党籍审批
     */
    @Override
    @CacheEvict(value="partyCache", allEntries=true)
    public void cancelApply(String partyInfoId) {
        
        SpLcxmb spLcxmb = approvalProcessProjectMapper.cancelApply(partyInfoId);
    }

    /**
     * 根据通知id查询党党籍信息
     */
    @Override
    public ViewPartyinfo getSinglePartyByNoticeId(String noticeId) {
        
        return viewPartyinfoMapper.getPartyByNoticeId(noticeId);
    }

}
