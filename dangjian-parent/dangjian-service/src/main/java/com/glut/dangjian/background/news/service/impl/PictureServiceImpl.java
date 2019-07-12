package com.glut.dangjian.background.news.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import com.glut.dangjian.background.news.service.PictureService;
import com.glut.dangjian.entity.news.XwTpb;
import com.glut.dangjian.mapper.background.picture.XwTpbMapper;
import com.glut.dangjian.utils.StringTools;

@Service("pictureService")
@Transactional
public class PictureServiceImpl implements PictureService{

    @Autowired
    private  XwTpbMapper xwTpbMapper;

    /**
     * 分页查询本地图片
     * pageNum:当前页
     * pageSize：每页显示多少条数据
     */
    @Override
    public PageInfo<XwTpb> getLocalXwTpbPageList(Integer pageNum, Integer pageSize, XwTpb xwTpb) {
        // TODO Auto-generated method stub
        PageHelper.startPage(pageNum, pageSize);
        List<XwTpb> tpbs = xwTpbMapper.getLocalXwTpbPageList(xwTpb);
        PageInfo<XwTpb> pageInfo = new PageInfo<XwTpb>(tpbs);
        return pageInfo;
    }

    /**
     * 修改图片信息
     */
    @Override
    public void updatePicture(XwTpb tpb) {
        // TODO Auto-generated method stub
        xwTpbMapper.updateByTpIdIfNull(tpb);
    }

    /**
     * 批量删除图片    
     * @param tpIds
     */
    @Override
    public void deletePictureBatchPicture(String[] tpIds) {

        for(String id : tpIds) {
            xwTpbMapper.deleteByTpId(id);
        }
        
    }

    /**
     * 添加图片
     */
    @Override
    public String savePicture(XwTpb xwTpb) {
        // TODO Auto-generated method stub
        String id = StringTools.getUUID();
        xwTpb.setTpId(id);
        xwTpbMapper.insertSelective(xwTpb);
        return id;
    }

    
    /**
     * 分页查询远程图片
     * pageNum:当前页
     * pageSize：每页显示多少条数据
     */
    @Override
    public PageInfo<XwTpb> getFarXwTpbPageList(Integer pageNum, Integer pageSize, XwTpb xwTpb) {
        
        PageHelper.startPage(pageNum,pageSize);
        List<XwTpb> tpbs = xwTpbMapper.getFarXwTpbPageList(xwTpb);
        PageInfo<XwTpb> pageInfo = new PageInfo<XwTpb>(tpbs);
        return pageInfo;
    }

    /**
     * 添加远程图片
     * @param xwTpb
     */
    @Override
    public String saveFarPicture(XwTpb xwTpb) {
        String id = StringTools.getUUID();
        xwTpb.setTpId(id);
        xwTpbMapper.insertSelective(xwTpb);
        return id;
    }
    

    
    
}
