package com.glut.dangjian.background.news.service;

import com.github.pagehelper.PageInfo;
import com.glut.dangjian.entity.news.XwTpb;

public interface PictureService {

    /**
     * 分页查询本地图片
     */
    public PageInfo<XwTpb> getLocalXwTpbPageList(Integer pageNum, Integer pageSize, XwTpb xwTpb);

    /**
     * 修改图片信息
     * @param tpb
     */
    public void updatePicture(XwTpb tpb);

    /**
     * 批量删除图片    
     * @param tpIds
     */
    public void deletePictureBatchPicture(String[] tpIds);

    /**
     * 添加本地图片
     */
    public String savePicture(XwTpb xwTpb);

    /**
     * 分页查询远程图片
     */
    public PageInfo<XwTpb> getFarXwTpbPageList(Integer pageNum, Integer pageSize, XwTpb xwTpb);

    /**
     * 添加远程图片
     * @param xwTpb
     */
    public String saveFarPicture(XwTpb xwTpb);

    
}
