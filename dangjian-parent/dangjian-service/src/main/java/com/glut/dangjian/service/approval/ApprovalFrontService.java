package com.glut.dangjian.service.approval;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.approval.SpLcxmb;
import com.glut.dangjian.entity.user.Yhb;
import com.glut.dangjian.pojo.ApprovalResult;

/** 
* @author xulankong
* @date 创建时间:  2018年12月21日 下午5:15:00
* @version 1.0
*/
public interface ApprovalFrontService {

    ApprovalResult disAgreePartyApprovalByNotice(String noticeId, Yhb attribute);

    ApprovalResult agreePartyApprovalByNotice(String noticeId, Yhb attribute);

    ApprovalResult disagreeApprovalCommentApprovalByNotice(String noticeId, Yhb attribute);

    ApprovalResult agreeNewsCommentApprovalByNotice(String noticeId, Yhb attribute);

    ApprovalResult disagreeApprovalByNotice(String noticeId, Yhb attribute);

    ApprovalResult agreeNewsApprovalByNotice(String noticeId, Yhb attribute);

    Integer getApprovalNum(Yhb yhb);

    

}
