package com.glut.dangjian.background.other.service;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.other.PartyInfo;
import com.glut.dangjian.entity.other.Sp;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewPartyinfo;

/** 
* @author xulankong
* @date 创建时间:  2018年11月30日 下午5:54:12
* @version 1.0
*/
public interface PartyInfoService {

    PageInfo<ViewPartyinfo> getPageList(Integer pageNum, Integer pageSize, ViewPartyinfo viewPartyinfo);

    void save(PartyInfo partyInfo);

    void update(PartyInfo partyInfo);

    void deleteBatch(String id);

    // 根据用户userid获取视图
    ViewPartyinfo getViewPartyinfoByUserId(String id);

    void updatePartyInfoDisagreeApproval(String objectId);

    void updatePartyInfoAgreeApproval(String objectId);

    ViewPartyinfo getParty(Yhb yhb);

}
