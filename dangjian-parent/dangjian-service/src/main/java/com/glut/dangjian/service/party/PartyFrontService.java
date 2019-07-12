package com.glut.dangjian.service.party;

import com.glut.dangjian.entity.other.PartyInfo;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.entity.view.ViewPartyinfo;

/** 
* @author xulankong
* @date 创建时间:  2018年12月23日 上午10:06:24
* @version 1.0
*/
public interface PartyFrontService {

    // 获取党籍向信息
    ViewPartyinfo getParty(Yhb yhb);
    
    // 添加一个党籍信息
    void saveParty(PartyInfo partyInfo);
    
    // 修改党籍信息
    void updateParty(PartyInfo partyInfo);

    // 取消党籍审批
    void cancelApply(String partyInfoId);

    // 根据通知id查询党党籍信息
    ViewPartyinfo getSinglePartyByNoticeId(String noticeId);



}
