package com.glut.dangjian.mapper.dues;

import com.glut.dangjian.entity.dues.DuesBranch;
import com.glut.dangjian.entity.dues.view.ViewDuesBranch;
import com.glut.dangjian.entity.dues.view.ViewDuesCollegeBranch;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DuesBranchMapper {


    DuesBranch selectById(Integer branchId );

    DuesBranch getDuesBranchById(@Param("branchId") Integer branchId,@Param("collegeId") Integer collegeId);

    List<ViewDuesCollegeBranch> duesBranchPageList(Integer collegeId);
}
