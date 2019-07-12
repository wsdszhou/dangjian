package com.glut.dangjian.background.log.service;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.log.Log;
import com.glut.dangjian.entity.view.ViewLog;

/** 
* @author xulankong
* @date 创建时间:  2018年12月3日 下午7:35:15
* @version 1.0
*/
public interface OperationLogService {

    public void addLog(Log log);
    
    public PageInfo<ViewLog> getLogPageList(Integer pageNum, Integer pageSize, ViewLog viewLog);

    public void deleteBatch(String id);
}
