package com.glut.dangjian.background.log.service.imlp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.glut.dangjian.background.log.service.OperationLogService;
import com.glut.dangjian.entity.log.Log;
import com.glut.dangjian.entity.view.ViewLog;
import com.glut.dangjian.mapper.log.LogMapper;
import com.glut.dangjian.mapper.system.view.ViewLogMapper;

/** 
* @author xulankong
* @date 创建时间:  2018年12月3日 下午7:36:36
* @version 1.0
*/
@Service
@Transactional
public class OperationLogServiceImpl implements OperationLogService{
    
    @Autowired
    private LogMapper logMapper;
    
    @Autowired
    private ViewLogMapper  viewLogMapper;

    @Override
    public void addLog(Log log) {
        logMapper.insert(log);
    }

    @Override
    public PageInfo<ViewLog> getLogPageList(Integer pageNum, Integer pageSize, ViewLog viewLog) {
        PageHelper.startPage(pageNum, pageSize);
        List<ViewLog> viewLogs = viewLogMapper.getLogPageList(viewLog);
        return new PageInfo<>(viewLogs);
    }

    @Override
    public void deleteBatch(String id) {
        String[] ids = id.split(",");
        logMapper.deleteBatch(ids);
    }

}
