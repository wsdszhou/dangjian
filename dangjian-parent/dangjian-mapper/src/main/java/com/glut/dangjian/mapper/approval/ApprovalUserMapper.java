package com.glut.dangjian.mapper.approval;

import org.apache.ibatis.annotations.Param;

import com.glut.dangjian.entity.approval.SpRyb;

public interface
ApprovalUserMapper {

    int insert(SpRyb record);

    int insertSelective(SpRyb record);

    SpRyb selectById(Integer spryId);

    int updateByIdSelective(SpRyb record);

    int updateById(SpRyb record);

    void deleteById(@Param("ids")int[] ids);

    SpRyb getApprovalUserByUserId(@Param("userId") String userId, @Param("spgwId") Integer spgwId);
}