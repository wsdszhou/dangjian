package com.glut.dangjian.mapper.background.other;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.other.PartyInfo;
import com.glut.dangjian.entity.user.YhXxb;

public interface PartyInfoMapper {
    int insert(PartyInfo record);

    int insertSelective(PartyInfo record);

    void deleteBatch(@Param("ids") String[] ids);

    void update(PartyInfo partyInfo);

    PartyInfo getPartyinfoById(String objectId);

    void updatePartyInfoAgreeApproval(@Param("partyInfo")PartyInfo partyInfo, @Param("yhXxb") YhXxb yhXxb);

    String getUserIdByPartyInfoId(String id);

    void deleteNoApprovalBySpLcxmbId(@Param("lcxmId")String lcxmId, @Param("userId")String userId,
            @Param("id")String id);

    String getFbrIdByPartyinfoId(String id);

    Integer getPartyIStateBypartyInfoId(String id);

}