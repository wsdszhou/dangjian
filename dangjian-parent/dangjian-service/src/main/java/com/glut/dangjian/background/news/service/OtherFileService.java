package com.glut.dangjian.background.news.service;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.news.XwQtwjb;

public interface OtherFileService {

    /**
     * 修改其他文件信息
     * @param tpb
     */
    public void updateOtherFile(XwQtwjb tpb);

    /**
     * 批量删除其他文件    
     * @param tpIds
     */
    public void deleteOtherFileBatchOtherFile(String[] tpIds);

    /**
     * 添加其他文件
     * @return 
     */
    public String saveOtherFile(XwQtwjb XwQtwjb);


    
}
