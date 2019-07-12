package com.glut.dangjian.mapper.approval;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.approval.SpLcxmb;
import com.glut.dangjian.entity.approval.view.ViewApprovalProjectProcessNode;
import com.glut.dangjian.entity.user.Yhb;

public interface ApprovalProcessProjectMapper {
    
    int deleteById(Integer lcxmId);

    int insert(SpLcxmb record);

    int insertSelective(SpLcxmb record);

    SpLcxmb selectById(Integer lcxmId);

    int updateByIdSelective(SpLcxmb record);

    int updateById(SpLcxmb record);

    List<SpLcxmb> getPageList(ViewApprovalProjectProcessNode viewApprovalProjectProcessNode);

    SpLcxmb getApprovalProjectByObjectId(String objectId);

    SpLcxmb getNoApprovalPartByObjectId(String id);

    void deleteBatchById(@Param("ids")String[] ids);

    // 取消审批
    SpLcxmb cancelApply(String partyInfoId);

    String getApprovalObjectIdByNoticeId(String noticeId);

    Integer getApprovalNumByUserId(String userId);

}