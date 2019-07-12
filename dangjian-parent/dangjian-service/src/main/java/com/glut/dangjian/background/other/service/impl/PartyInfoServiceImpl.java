package com.glut.dangjian.background.other.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.approval.service.ApprovalProjectService;
import com.glut.dangjian.background.other.service.PartyInfoService;
import com.glut.dangjian.config.ApprovalTypeConfig;
import com.glut.dangjian.entity.approval.SpLcxmb;
import com.glut.dangjian.entity.approval.SpSpjdb;
import com.glut.dangjian.entity.approval.SpSplcb;
import com.glut.dangjian.entity.approval.view.ViewApprovalNode;
import com.glut.dangjian.entity.branch.Zbb;
import com.glut.dangjian.entity.department.Bmb;
import com.glut.dangjian.entity.other.Dnzwb;
import com.glut.dangjian.entity.other.PartyInfo;
import com.glut.dangjian.entity.other.Zzmmb;
import com.glut.dangjian.entity.user.YhXxb;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewPartyinfo;
import com.glut.dangjian.mapper.approval.ApprovalProcessProjectMapper;
import com.glut.dangjian.mapper.approval.view.ViewApprovalNodeMapper;
import com.glut.dangjian.mapper.background.other.PartyInfoMapper;
import com.glut.dangjian.mapper.notice.NoticeMapper;
import com.glut.dangjian.mapper.notice.NoticeObjectMapper;
import com.glut.dangjian.mapper.notice.view.ViewNoticeMapper;
import com.glut.dangjian.mapper.other.view.ViewPartyinfoMapper;
import com.glut.dangjian.mapper.system.view.ViewYhxxMapper;
import com.glut.dangjian.utils.StringTools;

/** 
* @author xulankong
* @date 创建时间:  2018年11月30日 下午5:55:02
* @version 1.0
*/
@Service
@Transactional(propagation=Propagation.NESTED)
public class PartyInfoServiceImpl implements PartyInfoService{

    @Autowired
    private ViewPartyinfoMapper viewPartyinfoMapper;
    
    @Autowired
    private PartyInfoMapper partyInfoMapper;
    
    @Autowired
    private ViewApprovalNodeMapper  viewApprovalNodeMapper;
    
    @Autowired
    private ApprovalProjectService approvalProjectService;
    
    @Autowired
    private ApprovalProcessProjectMapper approvalProcessProjectMapper;
    
    @Autowired
    private ViewYhxxMapper viewUserInfoMapper;
    
    @Autowired
    private ViewNoticeMapper viewNoticeMapper;
    
    @Override
    public PageInfo<ViewPartyinfo> getPageList(Integer pageNum, Integer pageSize, ViewPartyinfo viewPartyinfo) {
        
        PageHelper.startPage(pageNum, pageSize);
        List<ViewPartyinfo> viewPartyinfos = viewPartyinfoMapper.getPageList(viewPartyinfo);
        return new PageInfo<ViewPartyinfo>(viewPartyinfos);
    }

    @Override
    @CacheEvict(value="partyCache", allEntries=true)
    public void save(PartyInfo partyInfo) {
        partyInfo.setId(StringTools.getUUID());
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

    @Override
    @CacheEvict(value="partyCache", allEntries=true)
    public void update(PartyInfo partyInfo) {
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

    @Override
    @CacheEvict(value="partyCache", allEntries=true)
    public void deleteBatch(String id) {
        
        String[] ids = id.split(",");
        partyInfoMapper.deleteBatch(ids);
    }

    /**
     *  根据用户userid获取视图
     */
    @Override
    @Cacheable(value="partyCache", key="'#p0'+'#root.methodName'"  )
    public ViewPartyinfo getViewPartyinfoByUserId(String id) {
        return viewPartyinfoMapper.getViewPartyinfoByUserId(id);
    }

    /**
     * 审批通过后修改用户信息
     */
    @Override
    @CacheEvict(value="partyCache", allEntries=true)
    public void updatePartyInfoAgreeApproval(String objectId) {
        PartyInfo partyInfo = partyInfoMapper.getPartyinfoById(objectId);
        partyInfo.setId(objectId);
        partyInfo.setSpsj(new Date());
        partyInfo.setZrsj(new Date());
        partyInfo.setResult(1);
        String userInfoId = viewUserInfoMapper.getUserInfoIdByPartyInfoId(objectId);
        YhXxb  yhXxb = new YhXxb();
        yhXxb.setYhxxId(userInfoId);
        yhXxb.setYhxxBmdm(new Bmb( partyInfo.getBmdm()));
        yhXxb.setYhxxZbdm(new Zbb(partyInfo.getZbdm()));
        yhXxb.setYhxxDnzwdm(new Dnzwb(partyInfo.getDnzwdm()));
        yhXxb.setYhxxZzmmdm(new Zzmmb(partyInfo.getZzmmdm()));
        partyInfoMapper.updatePartyInfoAgreeApproval(partyInfo, yhXxb);
    }

    /**
     * 审批未通过
     */
    @Override
    @CacheEvict(value="partyCache", allEntries=true)
    public void updatePartyInfoDisagreeApproval(String objectId) {
        PartyInfo partyInfo = new PartyInfo();
        partyInfo.setId(objectId);
        partyInfo.setSpsj(new Date());
        partyInfo.setResult(1);
        Integer partyIState = partyInfoMapper.getPartyIStateBypartyInfoId(objectId);
        if (partyIState==2) {
            partyInfo.setZt(1);
        }
        partyInfoMapper.update(partyInfo);
    }

    /**
     * 获取党籍审批
     */
    @Override
    public ViewPartyinfo getParty(Yhb yhb) {
        
        return viewPartyinfoMapper.getParty(yhb.getUserId());
    }

}
