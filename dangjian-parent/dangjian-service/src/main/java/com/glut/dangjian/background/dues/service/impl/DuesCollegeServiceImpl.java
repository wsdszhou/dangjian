package com.glut.dangjian.background.dues.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.dues.service.DuesCollegeService;
import com.glut.dangjian.entity.dues.DuesCollege;
import com.glut.dangjian.mapper.dues.DuesCollegeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("duesCollegeService")
@Transactional
public class DuesCollegeServiceImpl implements DuesCollegeService {
//    @Autowired
//    private DuesBranch duesBranch;

    @Autowired
    private DuesCollegeMapper duesCollegeMapper;

    @Override
    @Cacheable(value="approvalJobCache", key="'#root.methodName'+'--'+'#root.methodName'" )
    public List<DuesCollege> loadDuesCollege(){

        return duesCollegeMapper.loadDuesCollege();
    }

    @Override
    public PageInfo<DuesCollege> duesCollegePageList(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<DuesCollege> duesCollege  = duesCollegeMapper.duesCollegePageList();
        return  new PageInfo<DuesCollege>(duesCollege);
    }

    @Override
    public DuesCollege getCollegeById(Integer collegeId){
        return duesCollegeMapper.selectById(collegeId);
    }


}
