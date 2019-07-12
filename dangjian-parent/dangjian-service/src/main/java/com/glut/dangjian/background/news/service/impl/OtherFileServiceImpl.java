package com.glut.dangjian.background.news.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.glut.dangjian.background.news.service.OtherFileService;
import com.glut.dangjian.entity.news.XwQtwjb;
import com.glut.dangjian.mapper.background.news.OtherFileMapper;
import com.glut.dangjian.utils.StringTools;

@Service("otherFileService")
@Transactional
public class OtherFileServiceImpl implements OtherFileService{

    @Autowired
    private OtherFileMapper otherFileMapper;
    
    /**
     * 修改其他文件信息
     * @param tpb
     */
    @Override
    public void updateOtherFile(XwQtwjb tpb) {
        // TODO Auto-generated method stub
        
    }

    /**
     * 批量删除其他文件    
     * @param tpIds
     */
    @Override
    public void deleteOtherFileBatchOtherFile(String[] tpIds) {
        // TODO Auto-generated method stub
        
    }

    /**
     * 添加其他文件
     */
    @Override
    public String saveOtherFile(XwQtwjb xwQtwjb) {
        xwQtwjb.setJqwjId(StringTools.getUUID());
        otherFileMapper.insertSelective(xwQtwjb);
        return xwQtwjb.getJqwjId();
    }

}
