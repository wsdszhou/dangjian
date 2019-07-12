package com.glut.dangjian.mapper.notice;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.approval.SpLcxmb;
import com.glut.dangjian.entity.approval.view.ViewApprovalJobUser;
import com.glut.dangjian.entity.notice.Notice;
import com.glut.dangjian.entity.notice.NoticeObject;
import com.glut.dangjian.entity.user.Yhb;

public interface NoticeObjectMapper {
    // 删除一条记录
    int deleteById(String tzdxId);

    // 添加一条信息
    int insert(NoticeObject record);

    // 添加一信息，并且判断是否为空
    int insertSelective(NoticeObject record);

    // 根据主键查询信息
    NoticeObject selectById(String tzdxId);

    // 修改信息，并且判断是否为空
    int updateByIdSelective(NoticeObject noticeObject);

    // 修改信息
    int updateById(NoticeObject noticeObject);

    // 删除信息根据notice对象id
    void deleteByNoticeId(@Param("noticeId") String noticeId);

    // 批量添加人员通知
    void insertSelective(List<ViewApprovalJobUser> viewApprovalJobUsers);

    void insertBartchSelective( @Param("notice") Notice notice,  @Param("viewApprovalJobUsers") List<ViewApprovalJobUser> viewApprovalJobUsers,
            @Param("spLcxmb")  SpLcxmb spLcxmb);

    void updateIndividualNoticeInsertBartchSelective(@Param("notice") Notice notice, @Param("viewApprovalJobUsers")  List<ViewApprovalJobUser> viewApprovalJobUsers,
            @Param("spLcxmb")  SpLcxmb myGetspLcxmb);

    // 同意审批
    int agreeApprovalNotice(
            @Param("spLcxmb")SpLcxmb spLcxmb,
            @Param("viewApprovalJobUsers") List<ViewApprovalJobUser> viewApprovalJobUsers,
            @Param("noticeObject") NoticeObject noticeObject , 
            @Param("notice") Notice notice,
            @Param("yhb") Yhb yhb);

    // 获取审批对象list，通过审批对象id
    List<NoticeObject> getNoticeObjectListByApprovalId(String lcxmId);

    // 审批不通过
    void disagreeNews(@Param("spLcxmb") SpLcxmb spLcxmb, @Param("noticeObjects") List<NoticeObject> noticeObjects,
            @Param("yhb") Yhb yhb);

    void deleteBySpLcxmbId(String id);

    void endAprrovalNotice(NoticeObject noticeObject);

    void readNotice(@Param("noticeId")String noticeId, @Param("date")Date date);

    void addNotice(@Param("notice")Notice notice, @Param("noticeObject")NoticeObject noticeObject);


}